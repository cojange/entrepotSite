package com.site.client.board.imgb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.client.board.imgb.service.ClImgbService;
import com.site.client.board.imgb.vo.ClImgbVO;
import com.site.client.member.login.vo.LoginVO;
import com.site.common.file.FileUploadUtil;


@Controller
@RequestMapping(value="client")
public class ClImgbController {

	Logger logger = Logger.getLogger(ClImgbController.class);
	
	@Autowired
	private ClImgbService clImgbService;
	
	//글 목록 출력
	@RequestMapping(value="/board/imgb/clImgbList.do", method=RequestMethod.GET)//맵핑을 한다.(현재 jsp저장해둔경로)
	public String ClImgbList(@ModelAttribute("data")ClImgbVO cvo, Model model) {
		logger.info("climgbList 호출 성공");
		logger.info("cvo:" + cvo.toString());
		List<ClImgbVO> clImgbList = clImgbService.clImgbList(cvo);
		
		logger.info("list:" + clImgbList);
		model.addAttribute("clImgbList", clImgbList);
		return "client/board/imgb/clImgbList"; //jsp로 이동하는 리턴 값
	}
	//글 쓰기 폼 출력
	@RequestMapping(value="/board/imgb/writeForm.do")
	public String writeForm() {
		logger.info("writeForm 호출 성공");
		
		return "client/board/imgb/writeForm";
	}
	
	//글쓰기 구현(첨부파일 제외 할때)
	@RequestMapping(value="/board/imgb/clImgbInsert.do",method=RequestMethod.POST)
	public String clImgbInsert(ClImgbVO cvo, Model model, HttpServletRequest req,
			HttpSession session) 
			throws IllegalStateException,IOException {
		logger.info("climgbInsert 호출 성공"); 
		
		LoginVO login = (LoginVO)session.getAttribute("login");
	      cvo.setM_num(login.getM_num());
	     
		
		/*result == 0 을 제와하는 경우*/
		int result = 0;
		String url ="";
		
		logger.info("getFile = " +cvo.getFile());
		if(!cvo.getFile().isEmpty()) {
			String imgb_img1 = FileUploadUtil.fileUpload(cvo.getFile(), "board", req, "imgb", "imgb");
			String thumbFile = FileUploadUtil.makeThumbnail(imgb_img1, "imgb", req);
			cvo.setImgb_img1(imgb_img1);
			cvo.setImgb_thumb(thumbFile);
		}else {
	    	  cvo.setImgb_img1("");
	      }
		result  = clImgbService.imgbInsert(cvo);
		
		if(result ==1) {
			url ="/client/board/imgb/clImgbList.do";
		}else {
			model.addAttribute("code", 1);
			url ="/client/board/imgb/writeForm.do";
		}
		return "redirect: "+url;
	}
	
	@RequestMapping(value="/board/imgb/imgbDetail.do", method=RequestMethod.GET)
	public String imgbDetail(ClImgbVO cvo, Model model) {
		logger.info("imgbDetail 호출 성공");
		logger.info("imgb_no="+cvo.getImgb_no());
		
		ClImgbVO clidetail = new ClImgbVO();
		clidetail = clImgbService.imgbDetail(cvo);
		
		if(clidetail!=null &&(!clidetail.equals(""))) {
			clidetail.setImgb_content(clidetail.getImgb_content().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("clidetail", clidetail);
		
		return "client/board/imgb/imgbDetail"; //jsp로 이동하는 return 값
	}
	
	//비밀번호 확인,param pb_no, param pb_password
		@RequestMapping(value="/board/imgb/pwdConfirm.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
		public String pwdConfirm(ClImgbVO cvo) {
			logger.info("pwdConfirm 호출 성공");
			String value="";
			
			//아래변수에는 입력 성공에 대한 상태값 저장(1 or 0)
			int result = clImgbService.pwdConfirm(cvo);
			//return result+"" //정수값으로 반환핡경우 String으로
			
			if(result ==1) {
				value="성공";
			}else {
				value="실패";
			}
			logger.info("result="+result+"value=" +value);
			return value;
		}
		//수정 페이지 불러오기
		@RequestMapping(value="/board/imgb/updateForm.do")
		public String updateForm(ClImgbVO cvo, Model model) {
			logger.info("updateForm 호출성공");
			logger.info("imgb_no="+cvo.getImgb_no());
			
			ClImgbVO updateData = new ClImgbVO();
			updateData = clImgbService.imgbDetail(cvo);
			model.addAttribute("update", updateData);
			return "client/board/imgb/updateForm";//jsp로 이동
		}
		
		
		//수정하기
		@RequestMapping(value="/board/imgb/clImgbUpdate.do",method=RequestMethod.POST)
		public String clImgbUpdate(ClImgbVO cvo, Model model,HttpServletRequest req)throws IOException{
			logger.info("clImgbUpdate 호출 성공");
			
			int result =0;
			String url="";
			String imgb_img1="";
			
			if(!cvo.getFile().isEmpty()) {
				logger.info("=====file="+cvo.getFile().getOriginalFilename());
				if(!cvo.getImgb_img1().isEmpty()) {
					FileUploadUtil.fileDelete(cvo.getImgb_img1(), "imgb","imgb", req);
		    	  }
					//다시 파일 업로드
					imgb_img1 = FileUploadUtil.fileUpload(cvo.getFile(), "imgb", req, "imgb", "imgb");
					cvo.setImgb_img1(imgb_img1);
			}else {
				logger.info("파일첨부가 없음");
				cvo.setImgb_img1("");
			}
			result =clImgbService.clImgbUpdate(cvo);
				
			if(result ==1) {
				url="/client/board/imgb/imgbDetail.do?imgb_no="+cvo.getImgb_no()+"&board_no="+cvo.getBoard_no();
			}else {
				url="/client/board/imgb/updateForm.do?imgb_no="+cvo.getImgb_no()+"&board_no="+cvo.getBoard_no();
			}
			
			return "redirect:"+url;
		}
		
		//글 삭제하기
		@RequestMapping(value="/boarad/imgb/clImgbDelete.do",method=RequestMethod.POST)
		public String clImgbDelete(ClImgbVO cvo, HttpServletRequest req)throws IOException{
			logger.info("clImgbDelete 호출성공");
			
			int result =0;
			String url="";
			
			//파일이 존재하면
			if(!cvo.getImgb_img1().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getImgb_img1(), "imgb","imgb", req);
			}
			result= clImgbService.clImgbDelete(cvo.getImgb_no());
			
			if(result==1) {
				url="/client/board/imgb/clImgbList.do";
			}else {
				url="/client/board/imgb/imgbDetail.do?imgb_no="+cvo.getImgb_no();
			}
			return "redirect:"+url;
		}
		
		//mg_num select 가져오기
		@ResponseBody
		@RequestMapping(value="/board/imgb/getMg_num.do")
		public String getMg_num(ObjectMapper mapper, HttpSession session) {
			
			LoginVO login = (LoginVO) session.getAttribute("login");
			List<String> resultData=new ArrayList<>();
			resultData = clImgbService.getMg_num(login.getM_num());
			String jsonData ="";
			
			
			try {
				jsonData = mapper.writeValueAsString(resultData);
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
			
			return jsonData;
		}
}

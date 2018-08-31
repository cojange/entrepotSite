package com.site.client.board.personal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.client.board.personal.service.PersonalService;
import com.site.client.board.personal.vo.PersonalVO;
import com.site.common.file.FileUploadUtil;



@Controller

@RequestMapping(value="/client")
public class PersonalController {
	Logger logger = Logger.getLogger(PersonalController.class);
	
	@Autowired
	private PersonalService personalService;
	
	//1대1게시판 글 구현
	@RequestMapping(value="/board/personal/personalList.do", method= RequestMethod.GET)
	public String PersonalList(@ModelAttribute("data")PersonalVO pvo, Model model) {
		logger.info("personalList 호출 성공");
		logger.info("pvo:" + pvo.toString());
		List<PersonalVO> personalList = personalService.personalList(pvo);
		
		logger.info("list:"+personalList);
		model.addAttribute("personalList", personalList);
		return "client/board/personal/personalList"; //jsp로 이동하는 리턴 값
	}
	//글 쓰기 폼  출력하기
	@RequestMapping(value="/boarad/personal/writeForm.do")
	public String writeForm() {
		logger.info("writeForm 호출 성공");
		
		return "client/board/personal/writeForm";//글쓰는 jsp로 이동 
	}
	
	@RequestMapping(value="/board/personal/personalInsert.do",method=RequestMethod.POST)
	public String personalInsert(PersonalVO pvo,Model model, HttpServletRequest req)throws IllegalStateException, IOException {
	      logger.info("personalInsert 호출 성공");
	      
	      //확인 후 주석처리
	      /*logger.info("fileName:" + pvo.getFile().getOriginalFilename());
	      logger.info("file_thumb"+ pvo.getFile_thumb());*/
	      
	      int result = 0;
	      String url = "";
	      
	      if(!pvo.getFile().isEmpty()) {// 비어있지 않으면
	    	  String file_thumb = FileUploadUtil.fileUpload(pvo.getFile(), "personal", req, "personal", "personal");
	    	  pvo.setFile_thumb(file_thumb);
	      }else {
	    	  pvo.setFile_thumb("");
	      }
	      result = personalService.personalInsert(pvo);
	      if(result ==1) { //오류가 발생하지 안을 경우
	    	  url="/client/board/personal/personalList.do";
	      }else { //오류가 발생한 경우
	    	  url ="/client/board/personal/writeForm.do";
	      }
		return "redirect:" + url;
	}
	//글 자세히 보기
	@RequestMapping(value="/board/personal/detailForm.do", method=RequestMethod.GET)
	//public String personalDetail(@RequestParam("pb_no")int pb_no , Model model) {
	public String personalDetail(PersonalVO pvo, Model model) {
		logger.info("personalDetail 호출 성공");
		logger.info("pb_no="+pvo.getPb_no());
		
		PersonalVO detail = new PersonalVO();
		detail = personalService.personalDetail(pvo);
		if(detail!=null && (!detail.equals(""))) {
			detail.setPb_content(detail.getPb_content().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);
		
		return "client/board/personal/detailForm"; //jsp 이동 리턴값
	}
	//비밀번호 확인,param pb_no, param pb_password
	@RequestMapping(value="/board/personal/pwdConfirm.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String pwdConfirm(PersonalVO pvo) {
		logger.info("pwdConfirm 호출 성공");
		String value="";
		
		//아래변수에는 입력 성공에 대한 상태값 저장(1 or 0)
		int result = personalService.pwdConfirm(pvo);
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
	@RequestMapping(value="/board/personal/personalUpdate.do")
	public String personalUpdate(PersonalVO pvo, Model model) {
		logger.info("personalUpdate 호출 성공");
		logger.info("pb_no=" + pvo.getPb_no());
		
		PersonalVO updateData = new PersonalVO();
		updateData = personalService.personalDetail(pvo);
		model.addAttribute("updateData", updateData);
		return "client/board/personal/update.do"; //jsp 리턴값
	}
	
	//글 수정하기
		@RequestMapping(value="/board/personal/personalUpdate.do",method=RequestMethod.POST)
		public String updateForm(PersonalVO pvo, Model model, HttpServletRequest req)throws IOException {
		      logger.info("personalUpdate 호출 성공");
		      
		      int result = 0;
		      String url ="";
		      String file_thumb="";
		      
		      if(!pvo.getFile().isEmpty()) {
		    	  logger.info("======== file="+pvo.getFile().getOriginalFilename());
		    	  //기존 파일 삭제처리
		    	  if(!pvo.getFile_thumb().isEmpty()) {
		    		FileUploadUtil.fileDelete(pvo.getFile_thumb(), "personal", req);
		    	  }
		    	  //다시 파일업로드
		    	  file_thumb = FileUploadUtil.fileUpload(pvo.getFile(), "personal", req, "personal", "personal");
		    	 pvo.setFile_thumb(file_thumb); 
		      }else {
		    	  logger.info("파일첨부가 없음");
		    	  pvo.setFile_thumb("");
		      }
		      result = personalService.personalUpdate(pvo);
		      
		      if(result == 1) {
		    	  //url="/client/board/personal/personalList.do //수정목록으로 이동
		    	  //아래 url은 수정 후 상세 페이지로 이동
		    	  url="/client/board/personal/personalDetail.do?pb_no="+pvo.getPb_no();
		      }else {
		    	  url="/client/board/personal/personalUpdate.do?pb_no="+pvo.getPb_no();
		      }
		      return "redirect:" + url;
		}
		//글 삭제하기
		@RequestMapping(value="/board/personal/personalDelete.do",method=RequestMethod.POST)
		public String personalDelete(PersonalVO pvo, HttpServletRequest req)throws IOException{
			logger.info("personalUpdate 호출 성공");
			//아래변수에 입력 성공에 대한 상태값을 담습니다.(1 or 0)
			int result = 0;
			String url ="";
			
			//파일이 존재하면
			if(!pvo.getFile_thumb().isEmpty()) {
				FileUploadUtil.fileDelete(pvo.getFile_thumb(), "personal", req);
			}
			result = personalService.personalDelete(pvo.getPb_no());
			
			if(result ==1) {
				url="/client/board/personal/personalList.do";
			}else {
				url = "/client/board/personal/personalDetail.do?pb_no="+pvo.getPb_no();
			}
			return "redirect:"+url;
		}
}

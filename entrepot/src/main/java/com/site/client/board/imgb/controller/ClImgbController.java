package com.site.client.board.imgb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.board.imgb.service.ClImgbService;
import com.site.client.board.imgb.vo.ClImgbVO;
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
   public String clImgbInsert(ClImgbVO cvo, Model model, HttpServletRequest req) throws IllegalStateException,IOException {
      logger.info("climgbInsert 호출 성공"); 
      /*result == 0 을 제와하는 경우*/
      int result = 0;
      String url ="";
      
      logger.info("getFile = " +cvo.getFile());
      if(!cvo.getFile().isEmpty()) {
         String file_thumb = FileUploadUtil.fileUpload(cvo.getFile(), "imgb_img", req, "woo", "imgb_img");
                                          //vo안에File,    파일이름      요청   이름      폴더명
         cvo.setFile_thumb(file_thumb);
      }
      result  = clImgbService.imgbInsert(cvo);
      
      if(result ==1) {
         url ="/client/board/imgb/clImgbInsert.do";
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
   
}
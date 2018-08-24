package com.site.common.excel;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.AbstractView;

import com.site.common.util.GetDateUtil;

import net.sf.jxls.transformer.XLSTransformer;

public class ListExcelView extends AbstractView {
   static Logger logger = Logger.getLogger(ListExcelView.class);
   
   /***************************************************************************************************
    * 참고 : "Content-disposition : attachment"은 브라우저 인식 파일 확장자를 포함하여 모든 확장자의 파일들에 대해,
    *        다운로드시 무조건 "파일 다운로드" 대화상자를 보여주도록하는 헤더속성이라 할 수 있다.
    ***************************************************************************************************/
   @Override
   protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      //\으로 열고 \으로 닫음
      //""은 큰따옴표 하나로 출력됨
      //file_name의 값은 board(AdminBoardController에서 확인)
      //board_20180810.xlsx의 형태로 출력
	   
	   GetDateUtil gdu = GetDateUtil.getInstance();
	   response.setContentType("application/x-msexcel; charset=UTF-8");
      response.setHeader("Content-Disposition", "attachment;fileName=\""+model.get("file_name")+
    		  gdu.getYear()+"_"+gdu.getMonth()+gdu.getDay()+"_"+model.get("file_key")+"_"+gdu.getMonth()+model.get("endWord")+".xlsx\"");
      
      
      /***************************************************************************************************
       * 참고 : jXLS는 엑셀파일 포맷의 템플릿을 이용하여 엑셀파일을 손쉽게 생성하기 위한 패키지
       *       (jXLS는 템플릿을 기반으로 최종 엑셀파일을 생성)
       ***************************************************************************************************/
      String docRoot = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/");
      logger.info("경로 체크(docRoot) : "+docRoot);
      InputStream is = new BufferedInputStream(new FileInputStream(docRoot+model.get("template")));
      
      XLSTransformer trans = new XLSTransformer();
      Workbook workbook = trans.transformXLS(is, model);
      is.close();
      
      workbook.write(response.getOutputStream());
   }
}
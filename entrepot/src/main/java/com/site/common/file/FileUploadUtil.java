package com.site.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import com.site.common.util.GetDateUtil;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*파일 업로드할 폴더 생성*/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/*파일 업로드 메서드*/
	public static String fileUpload(MultipartFile file,String folder, HttpServletRequest request,String fileName, String mode)
		throws IOException{
		logger.info("fileUpload 호출 성공");
		String real_name=null;
		String org_name = file.getOriginalFilename();
		logger.info("org_name = " + org_name);
		String extenser = org_name.substring(org_name.lastIndexOf("."));
		GetDateUtil gdu =GetDateUtil.getInstance();
		
		//저장할 파일이름
		if(org_name !=null &&(!org_name.equals(""))) {
			String code="";
			if(mode.equals("cost")){
				//비용 코드
				code=gdu.getMonth()+gdu.getDay();
			}else if(mode.equals("reg")) {
				//약관 코드
				code=gdu.getYear()+gdu.getMonth()+gdu.getDay();
			}else if(mode.equals("adminBoard")) {
				//공지사항&이벤트 코드
				code=gdu.getYear()+gdu.getMonth()+gdu.getDay();
			}else if(mode.equals("main") || mode.equals("prev")) {
				//상품등록 코드(main)
				code=gdu.getHalfYear()+gdu.getMonth()+gdu.getDay();
			}else {
				//그 외
				code = System.currentTimeMillis()+"";
			}
			
			
			if(mode.equals("main")) {
				//product main
				real_name = fileName + "-" + code + "_" + mode + "_" + code + extenser;
			}else if(mode.equals("prev")){
				//product prev
				real_name = fileName+"-" + code + "_" + mode + "_" +gdu.getTime().replaceAll(" : ", "") + extenser;
			}else {
				real_name = fileName + "_" + code +"_" +org_name;
			}
			
			String docRoot = "";
			if(folder.equals("magazineImage")) {
				docRoot= request.getSession().getServletContext().getRealPath("/uploadStorage/"+folder+"/"+mode);
			}else {
				docRoot= request.getSession().getServletContext().getRealPath("/uploadStorage/"+folder+"/"+fileName);
			}
			
			
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/" +real_name);
			logger.info("업로드할 파일(fileAdd): " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/*파일 삭제 메서드*/
	public static void fileDelete(String fileName,String folder,String mode, HttpServletRequest request) throws IOException{
		logger.info("fileDelete 호출 성공");
		
		boolean result = false;
		String dirName="";
		if(mode.equals("code")) {
			dirName = fileName.substring(0, fileName.indexOf("_"));
		}else if(mode.equals("product")) {
			dirName = fileName.substring(fileName.indexOf("_")+1,fileName.lastIndexOf("_"));
		}
		
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+folder+"/"+dirName);
		
		File fileDelete = new File(docRoot + "/" + fileName);
		logger.info("삭제할 파일(fileDelete) : "+fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		 logger.info("파일 삭제 여부(true/false) : "+result);
	}
	
	/* 썸네일 파일 업로드 */
	public static String makeThumbnail(String fileName, HttpServletRequest request) throws IOException{
		   logger.info("makeThumbnail 호출 성공");
		   
		   String dirName = "";
		   
		   //magazine product thum
		   dirName = "magazineImage/main";
		   
		   //이미지가 존재하는 폴더 추출
		   String imgPath = request.getSession().getServletContext().getRealPath("/uploadStorage/"+dirName);
		   //추출된 폴더의 실제 경로 (물리적 위치: c:\...)
		   
		   File fileAdd = new File(imgPath, fileName);
		   //이미지 파일 만들기 이때 경로와 파일 이름이 필요하다.
		   logger.info("원본 이미지 파일(fileAdd): " + fileAdd);
		   
		   BufferedImage sourceImg = ImageIO.read(fileAdd);
		   //이미지 읽어오기
		   BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,220);
		   //resize(대상[BufferedImage 타입], 원본비율, 높이 또는 너비, 크기)
		   
		   //기존 파일 이름에서 main -> thum으로
		   String thumbnailName = fileName.replace("main", "thum");
		   //기존 경로에서 main -> thum으로
		   dirName = dirName.replace("main", "thum");
		   String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+dirName);
		   makeDir(docRoot);
		   
		   File newFile = new File(docRoot, thumbnailName);
		   logger.info("업로드할 파일(newFile) : " + newFile);
		   
		   String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		   logger.info("확장자(formatName) : " + formatName);
		   
		   ImageIO.write(destImg, formatName, newFile);
		   
		   return thumbnailName;
	   }
}

package com.site.admin.magazine.adMagazine.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.admin.magazine.adMagazine.service.AdMagazineService;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="admin/magazine/adMagazine")
public class AdMagazineController {
	Logger logger = Logger.getLogger(AdMagazineController.class);
	
	@Autowired
	private AdMagazineService adMagazineService;
	
	/**
	 * 상품 리스트 구현하기
	 * **/	
	@RequestMapping(value="adMagazineList.do", method=RequestMethod.GET)
	public String adMagazineList(MagazineVO msvo, Model model) {
		logger.info("adMagazineList 호출 성공");		
		
		List<MagazineVO> adMagazineList = adMagazineService.adMagazineList(msvo);
		model.addAttribute("adMagazineList", adMagazineList);
		
		System.out.println(adMagazineList.toString());
		
		return "admin/magazine/adMagazine/adMagazineList";
	}
	
	/**
	 * 상품 입력페이지 가기
	 * **/
	@RequestMapping(value="/adMagazineInsertForm.do")
	public String adMagazineInsertForm() {
		logger.info("writeForm 호출 성공");
		
		return "admin/magazine/adMagazine/adMagazineInsertForm";
	}
	
	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
 
    //로직은 언제나 Service에서 짜도록 하자.
    //중간실패시 rollback은 고려하지 않았음.
    @ResponseBody
    @RequestMapping(value="/imageupload.do", method=RequestMethod.POST)
    public int multiImageUpload(MagazineSearchVO msvo, HttpServletRequest request) throws IllegalStateException, IOException {
        long sizeSum = 0;
        for(MultipartFile image : msvo.getFile()) {
            String originalName =  FileUploadUtil.fileUpload(image, "magazinePrev", request, "mgPrev", "mgPrev");
            //확장자 검사
            if(!isValidExtension(originalName)){
                return RESULT_UNACCEPTED_EXTENSION;
            }
            
            //용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return RESULT_EXCEED_SIZE;
            }
            
            //TODO 저장..
           /* if(!msvo.getPl_path().isEmpty()) {
            	for(int i; i<msvo.getPl_path().size(); i++) {
            		String filename = FileUploadUtil.fileUpload(msvo.getPl_path().iterator().next(), "magazinePrev", request, "mgPrev", "mgPrev");
            		msvo.setPl_path(filename[i]);
            	}
            }*/
            
        }
        
        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
        return RESULT_SUCCESS;
    }
    
    //required above jdk 1.7 - switch(String)
    private boolean isValidExtension(String originalName) {
        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
        switch(originalNameExtension) {
        case "jpg":
        case "png":
        case "gif":
            return true;
        }
        return false;
    }
}

package com.site.admin.magazine.adMagazine.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.magazine.adMagazine.dao.AdMagazineDao;
import com.site.admin.magazine.adMagazine.vo.MagazineImgVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.common.file.FileUploadUtil;

@Service
public class AdMagazineServiceImpl implements AdMagazineService {
	Logger logger = Logger.getLogger(AdMagazineServiceImpl.class);
	
	@Autowired
	private AdMagazineDao adMagazineDao;
	
	//상품 리스트 구현
	@Override
	public List<MagazineVO> adMagazineList(MagazineSearchVO msvo) {
		List<MagazineVO> adMagazineList = null;
		
		adMagazineList = adMagazineDao.adMagazineList(msvo);
		return adMagazineList;
	}
	
	//잡지 정보 가져오기
	@Override
	public List<String> callMgPartner(){
		List<String> mginfoList = adMagazineDao.callMgPartner();
		return mginfoList;
	}
	
	//상품코드 가져우기
	@Override
	public List<String> callMgNum(String com_name){
		List<String> mginfoList = adMagazineDao.callMgNum(com_name);
		return mginfoList;
				
	}
	
	//상품등록하기
	@Override
	public String insertMagazine(MagazineSearchVO msvo) {
		String result="";
		
		int res = adMagazineDao.insertMagazine(msvo);
		
		if(res ==1) {
			result = "success";
		} else {
			result = "false";
		}
		return result;
	}

	@Override
	public List<MagazineSearchVO> callDtKeyword() {
		List<MagazineSearchVO> keywordList = adMagazineDao.callDtKeyword();
		return keywordList;
	}
	
	@Override
	public String adDetailInsert(MagazineSearchVO msvo, HttpServletRequest request) {
		//잡지 코드 주입
		msvo.setMg_num(adMagazineDao.getMgNum(msvo));
		//상품 코드 주입
		msvo.setPd_num(adMagazineDao.getPdNum(msvo));
		//이미지 명을 담을 list
		List<String> imgList = new ArrayList<>();
		//이미지 dao에 쓸 vo
		MagazineImgVO mivo = new MagazineImgVO();
		mivo.setPd_num(msvo.getPd_num());
		mivo.setMg_num(msvo.getMg_num());
		try {
			
			//main 업로드
				String mainImg = FileUploadUtil.fileUpload(msvo.getMainfile(), "magazineImage", request, msvo.getMg_num(), "main");
				
				imgList.add(mainImg);
				
				String prevImg ="";
			//preview 사진 업로드
				for(int i=0; i<msvo.getPrevfile().size(); i++) {
					prevImg = FileUploadUtil.fileUpload(msvo.getPrevfile().get(i), "magazineImage", request, msvo.getMg_num(), "prev");
					imgList.add(prevImg);
				}
				FileUploadUtil.sequence=0;
			//thum파일 생성 및 업로드
				String thumImg = FileUploadUtil.makeThumbnail(mainImg,"details", request);
				imgList.add(thumImg);
			
		}catch(IOException e) {
			//업로드 실패시 연관 업로드 파일 삭제
			e.printStackTrace();
			try {
				if(imgList.size()!=0) {
					for(int i =0; i<imgList.size(); i++) {
						FileUploadUtil.fileDelete(imgList.get(i), "magazineImage", "product", request);
					}
				}
			}catch(IOException i) {
				i.printStackTrace();
				return "delete fails after upload fails";
			}
			return "upload fails";
		}
		
		//키워드 조립하기
		String keyword="";
		for(String k : msvo.getDt_keyword_submit()) {
			keyword += k;
		}
		msvo.setDt_keyword(keyword);
		
		//대상 조립하기
		String target = "";
		for (String t : msvo.getDt_target_submit()) {
			target += t;
		}
		msvo.setDt_target(target);
		
		
		int contentInsert =0;
		
		if(adMagazineDao.selectPrevContent(msvo)!= null) {
			//contents update
			contentInsert = adMagazineDao.updateDetailContent(msvo);
		}else {
			//contents insert
			contentInsert = adMagazineDao.insertDetailContent(msvo);
		}
			
			//image insert
			String imgFileName="";
			int imgInsert = 0;
			for(int i=0; i<imgList.size(); i++) {
				imgFileName = imgList.get(i);
				mivo.setPl_path(imgFileName);
				mivo.setPl_type(imgFileName.substring(imgFileName.indexOf("_")+1,imgFileName.lastIndexOf("_")));
				imgInsert += adMagazineDao.insertImgContent(mivo);
			}
			//insert error
			if(contentInsert != 1 || imgInsert<imgList.size()) {
				return "dao insert fails";
			}
		//prev 파일 sequence 초기화
		FileUploadUtil.sequence=0;
		//무사히 성공...
		return "success";
		
	}
}

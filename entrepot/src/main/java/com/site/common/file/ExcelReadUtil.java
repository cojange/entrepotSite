package com.site.common.file;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.site.common.util.GetDateUtil;
import com.site.common.vo.CostExcelVO;

public class ExcelReadUtil {
	
	static Logger logger = Logger.getLogger(ExcelReadUtil.class);
	
	public List<CostExcelVO> readExcel(String path, HttpServletRequest request) throws IOException{
		
		
		String excelFile = path.substring(path.lastIndexOf(".")).toLowerCase();
		String filePath = 
			request.getSession().getServletContext().getRealPath("/uploadStorage/cost/"+path.substring(0, 8)+"/"+path);
		
		
		
		if(excelFile.equals(".xls")) {
			return readXls(filePath);
		}else if(excelFile.equals(".xlsx")) {
			return readXlsx(filePath);
		} else return null;
	}
	
	//xlsx
	private List<CostExcelVO> readXlsx(String path) throws IOException{
		logger.info("xlsx 파일 로딩");
		FileInputStream fis = new FileInputStream(path);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		int rowindex=0;
		int columnindex=0;
		
		XSSFSheet sheet = workbook.getSheetAt(0);
		List<CostExcelVO> acList = new ArrayList<>();
		CostExcelVO cevo;
		
		int rows=sheet.getPhysicalNumberOfRows();
		for(rowindex=3; rowindex<rows; rowindex++) {
			
			cevo = new CostExcelVO();
			
			XSSFRow row = sheet.getRow(rowindex);
			if(row!= null) {
				int cells=row.getPhysicalNumberOfCells();
				for(columnindex=0; columnindex<=cells; columnindex++) {
					XSSFCell cell=row.getCell(columnindex);
					String value="";
					if(cell==null) {
						continue;
					}else {
						switch(cell.getCellType()) {
						case XSSFCell.CELL_TYPE_FORMULA:
							value=cell.getCellFormula()+"";
							break;
						case XSSFCell.CELL_TYPE_NUMERIC:
							//숫자값이 날짜값일 경우 DateFormat
							if (DateUtil.isCellDateFormatted(cell)) {
								SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
								value = date.format(cell.getDateCellValue());
								} else {
								value = cell.getNumericCellValue()+"";
								}
							break;
						case XSSFCell.CELL_TYPE_STRING:
							value=cell.getStringCellValue()+"";
							break;
						case XSSFCell.CELL_TYPE_BLANK:
							value=cell.getBooleanCellValue()+"";
							break;
						case XSSFCell.CELL_TYPE_ERROR:
							value=cell.getErrorCellString()+"";
							break;
						}
						
						switch(columnindex) {
						case 0:
							cevo.setCostDate(value);
							break;
						case 1:
							cevo.setCompany(value);
							break;
						case 2:
							cevo.setCost(value);
							break;
						case 3:
							cevo.setMemo(value);
							break;
						case 4:
							cevo.setManager(value);
							break;
						};
						
						logger.info(value);
					}
				}
				acList.add(cevo);
			}
		}
		return acList;
	}
	
	//xls
	private List<CostExcelVO> readXls(String path) throws IOException{
		logger.info("xls 파일 로딩");
		FileInputStream fis = new FileInputStream(path);
		HSSFWorkbook workbook = new HSSFWorkbook(fis);
		
		int rowindex=0;
		int columnindex=0;
		
		//시트수 첫번째 시트만이므로 0
		HSSFSheet sheet=workbook.getSheetAt(0);
		
		int rows=sheet.getPhysicalNumberOfRows();
		
		List<CostExcelVO> acList = new ArrayList<>();
		CostExcelVO cevo;
		for(rowindex=3;rowindex<rows;rowindex++) {
			//행읽기
			//vo 객체만들기
			
			cevo = new CostExcelVO();
			HSSFRow row=sheet.getRow(rowindex);
			if(row != null) {
				//셀의수
				int cells = row.getPhysicalNumberOfCells();
				for(columnindex = 0; columnindex<=cells;columnindex++) {
					//셀값읽기
					HSSFCell cell = row.getCell(columnindex);
					String value="";
					if(cell==null) {
						continue;
					}else {
						//셀의 타입별로 읽기
						switch(cell.getCellType()) {
						case HSSFCell.CELL_TYPE_FORMULA:
							value=cell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC:
							//숫자값이 날짜값일 경우 DateFormat
							if (DateUtil.isCellDateFormatted(cell)) {
								SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
								value = date.format(cell.getDateCellValue());
								} else {
								value = cell.getNumericCellValue()+"";
								}
							break;
						case HSSFCell.CELL_TYPE_STRING:
							value=cell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK:
							value=cell.getErrorCellValue()+"";
							break;
						};
						
						switch(columnindex) {
						case 0:
							cevo.setCostDate(value);
							break;
						case 1:
							cevo.setCompany(value);
							break;
						case 2:
							cevo.setCost(value);
							break;
						case 3:
							cevo.setMemo(value);
							break;
						case 4:
							cevo.setManager(value);
							break;
						};
						logger.info(value);
						
					}
				}
				acList.add(cevo);
			}
			
		}
		return acList;
	}
}

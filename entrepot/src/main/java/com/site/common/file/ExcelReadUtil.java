package com.site.common.file;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.site.admin.cost.adCost.vo.AdCostVO;

public class ExcelReadUtil {
	
	//xls
	private List<AdCostVO> readXls(String path) throws IOException{
		FileInputStream fis = new FileInputStream(path);
		HSSFWorkbook workbook = new HSSFWorkbook(fis);
		
		int rowindex=0;
		int columnindex=0;
		
		//시트수 첫번째 시트만이므로 0
		HSSFSheet sheet=workbook.getSheetAt(0);
		
		int rows=sheet.getPhysicalNumberOfRows();
		
		List<AdCostVO> acList = new ArrayList<>();
		
		for(rowindex=1;rowindex<rows;rowindex++) {
			//행읽기
			//vo 객체만들기
			acvo = new AdCostVO();
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
							value=cell.getNumericCellValue()+"";
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
							
							
						}
						
					}
				}
			}
		}
		
	}
}

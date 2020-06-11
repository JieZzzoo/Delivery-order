package cn.itcast.ssm.view;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import cn.itcast.ssm.pojo.Notice;

public class NoticeExcelView extends AbstractExcelView {

@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 获取用户列表
		List<Notice> noticeList = (List<Notice>) model.get("noticeList");

		// 创建工作表
		HSSFSheet sheet = workbook.createSheet("公告列表");

		// 创建列标题行
		HSSFRow row1 = sheet.createRow(0);
		String[] titles = { "公告ID", "公告标题", "公告内容", "公告创建时间"};
		for (int i = 0; i < titles.length; i++) {
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titles[i]);
		}
		// 写入数据
		if (noticeList != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int j = 0; j < noticeList.size(); j++) {
				HSSFRow row = sheet.createRow(j + 1);
				row.createCell(0).setCellValue(noticeList.get(j).getnId());
				row.createCell(1).setCellValue(noticeList.get(j).getTitle());
				row.createCell(2).setCellValue(noticeList.get(j).getDetails());
				row.createCell(3).setCellValue(sdf.format(noticeList.get(j).getnTime()));
			}
		}

		// 设置响应头部
		response.setHeader("Content-Disposition", "attachment;filename=" 
		+ new String("公告列表.xls".getBytes(), "ISO-8859-1"));
	}

}

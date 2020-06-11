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

import cn.itcast.ssm.pojo.User;

public class UserExcelView extends AbstractExcelView {

@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 获取用户列表
		List<User> userList = (List<User>) model.get("userList");

		// 创建工作表
		HSSFSheet sheet = workbook.createSheet("用户列表");

		// 创建列标题行
		HSSFRow row1 = sheet.createRow(0);
		String[] titles = { "帐号", "用户名", "性别", "年龄", "出生日期" };
		for (int i = 0; i < titles.length; i++) {
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titles[i]);
		}
		// 写入数据
		if (userList != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int j = 0; j < userList.size(); j++) {
				HSSFRow row = sheet.createRow(j + 1);
				row.createCell(0).setCellValue(userList.get(j).getAccount());
				row.createCell(1).setCellValue(userList.get(j).getUserName());
				row.createCell(2).setCellValue((userList.get(j).getGender()==1)?"男":"女");
				row.createCell(3).setCellValue(userList.get(j).getAge());
				row.createCell(4).setCellValue(sdf.format(userList.get(j).getBirthday()));
			}
		}

		// 设置响应头部
		response.setHeader("Content-Disposition", "attachment;filename=" 
		+ new String("用户列表.xls".getBytes(), "ISO-8859-1"));
	}

}

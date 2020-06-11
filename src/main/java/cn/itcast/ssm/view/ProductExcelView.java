package cn.itcast.ssm.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import cn.itcast.ssm.pojo.Product;

public class ProductExcelView extends AbstractExcelView {

@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 获取用户列表
		List<Product> productList = (List<Product>) model.get("productList");

		// 创建工作表
		HSSFSheet sheet = workbook.createSheet("商品列表");

		// 创建列标题行
		HSSFRow row1 = sheet.createRow(0);
		String[] titles = { "商品ID","商品名称", "商品价格（元）", "商品分类", "商品库存量", "商品描述" };
		for (int i = 0; i < titles.length; i++) {
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titles[i]);
		}
		// 写入数据
		if (productList != null) {
			for (int j = 0; j < productList.size(); j++) {
				HSSFRow row = sheet.createRow(j + 1);
				row.createCell(0).setCellValue(productList.get(j).getpId());
				row.createCell(1).setCellValue(productList.get(j).getName());
				row.createCell(2).setCellValue(productList.get(j).getPrice());
				row.createCell(3).setCellValue(productList.get(j).getCategory());
				row.createCell(4).setCellValue(productList.get(j).getPnum());
				row.createCell(5).setCellValue(productList.get(j).getDescription());
			}
		}

		// 设置响应头部
		response.setHeader("Content-Disposition", "attachment;filename=" 
		+ new String("商品列表.xls".getBytes(), "ISO-8859-1"));
	}

}

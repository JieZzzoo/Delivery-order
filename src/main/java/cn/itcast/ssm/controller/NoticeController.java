package cn.itcast.ssm.controller;

import java.nio.file.attribute.UserPrincipalLookupService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.aspectj.weaver.NewConstructorTypeMunger;
import org.aspectj.weaver.ast.Var;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.itcast.ssm.pojo.Notice;
import cn.itcast.ssm.service.NoticeService;
import cn.itcast.ssm.vo.EasyUIResult;
import tk.mybatis.mapper.common.Mapper;

@RequestMapping("/notice")
@Controller
public class NoticeController {
@Autowired NoticeService noticeService;

@RequestMapping("/notice_index")
public String product_index() {
	return "notice/notice_index";
}

@RequestMapping("/list")
public ResponseEntity<EasyUIResult> queryNoticeList(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="rows",defaultValue="2")Integer rows,Notice notice){
	try {
		
		PageInfo<Notice> pageInfo = noticeService.queryByExample(page, rows, notice);
		EasyUIResult easyUIResult= new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
		System.out.println("easyUIResult.getTotal()"+easyUIResult.getTotal());
		System.out.println("e"+easyUIResult.getRows());
		return ResponseEntity.ok(easyUIResult);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
@RequestMapping("/page/add")
public String toPageAdd(){
	return "notice/notice_add";
}
@RequestMapping(value="/save",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> saveNotice(Notice notice){

	try {
		Map<String, Object> map=new HashMap<String, Object>();
		Date date=new Date();
		notice.setnTime(date);
		noticeService.save(notice);

		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}

@RequestMapping("/page/edit")
public String toPageEdit(){
	return "notice/notice_edit";
}
@RequestMapping(value="/edit",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> updateNotice(Notice notice){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		
		noticeService.update(notice);
		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}

@RequestMapping(value="/delete",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> deleteNotice(@RequestParam(value="ids") Long nId[]){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		Notice notice=new Notice();
		for(int i = 0;i<nId.length;i++){
			System.out.print(nId[i]);
			notice.setnId(nId[i]);
		noticeService.deleteById(notice);}
		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}

@RequestMapping(value="/export/excel/{page}/{rows}")
public ModelAndView exportExcel(@PathVariable("page") Integer page,@PathVariable("rows") Integer rows){
	ModelAndView mv=new ModelAndView("noticeExcelView");
	//查询公告
	PageInfo<Notice> pageInfo = noticeService.queryListInPage(page, rows);
	mv.addObject("noticeList", pageInfo.getList());
	return mv;
	
}
@RequestMapping(value="/export/excelall")
public ModelAndView exportExcelAll(){
	ModelAndView mv=new ModelAndView("noticeExcelView");
	//查询公告
	List<Notice> list = noticeService.queryAll();
	mv.addObject("noticeList",list);
	return mv;
	
}
@RequestMapping("/page/query")
public String toPageQuery(){
	return "notice/notice_query";
}
}

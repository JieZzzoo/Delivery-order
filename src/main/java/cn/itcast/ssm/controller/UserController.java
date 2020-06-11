package cn.itcast.ssm.controller;

import java.net.URLEncoder;
import java.nio.file.attribute.UserPrincipalLookupService;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.aspectj.weaver.ast.Var;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.pagehelper.PageInfo;

import cn.itcast.ssm.pojo.User;
import cn.itcast.ssm.service.UserService;
import cn.itcast.ssm.vo.EasyUIResult;
import tk.mybatis.mapper.common.Mapper;

@RequestMapping("/user")
@Controller
public class UserController {
@Autowired UserService userService;
@RequestMapping("/index")
public String index() {
	return "index";
}
@RequestMapping("/user_index")
public String user_index() {
	return "user_index";
}
@RequestMapping("/list")
public ResponseEntity<EasyUIResult> queryUserList(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="rows",defaultValue="2")Integer rows,User user){
	try {
		//PageInfo<User> pageInfo=userService.queryListInPage(page, rows);
		//EasyUIResult easyUIResult=new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
		PageInfo<User> pageInfo = userService.queryByExample(page, rows, user);
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
	return "user_add";
}
@RequestMapping(value="/save",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> saveUser(User user){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		userService.save(user);
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
	return "user_edit";
}
@RequestMapping(value="/edit",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> updateUser(User user){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		userService.update(user);
		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}
/*@RequestMapping(value="/delete",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> deleteUser(@RequestParam(value="ids") Long id){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		User user=new User();
		user.setId(id);
		userService.deleteById(user);
		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}*/
@RequestMapping(value="/delete",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> deleteUser(@RequestParam(value="ids") Long id[]){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		User user=new User();
		for(int i = 0;i<id.length;i++){
		user.setId(id[i]);
		userService.deleteById(user);}
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
	ModelAndView mv=new ModelAndView("excelView");
	//查询用户
	PageInfo<User> pageInfo = userService.queryListInPage(page, rows);
	mv.addObject("userList", pageInfo.getList());
	return mv;
	
}
@RequestMapping(value="/export/excelall")
public ModelAndView exportExcelAll(){
	ModelAndView mv=new ModelAndView("excelView");
	//查询用户
	List<User> list = userService.queryAll();
	mv.addObject("userList",list);
	return mv;
	
}
@RequestMapping("/page/query")
public String toPageQuery(){
	return "user_query3";
}
@RequestMapping("/register")
public String register(@ModelAttribute User user){
	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String ct=format.format(new Date());
	try{
		user.setCreateTime(format.parse(ct));
		user.setAge(getAge(user.getBirthday()));
	}catch(Exception e){
		e.printStackTrace();
	}
	userService.save(user);
		//return "/client/registersuccess";
	return	"redirect:/client/page/registersuccess";
}



//根据生日计算年龄
private static int getAge(Date birthDay) throws Exception { 
	        //获取当前系统时间
	        Calendar cal = Calendar.getInstance(); 
	        //如果出生日期大于当前时间，则抛出异常
	        if (cal.before(birthDay)) { 
	            throw new IllegalArgumentException( 
	                "The birthDay is before Now.It's unbelievable!"); 
	        } 
	        //取出系统当前时间的年、月、日部分
	        int yearNow = cal.get(Calendar.YEAR); 
	        int monthNow = cal.get(Calendar.MONTH); 
	        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
	         
	        //将日e799bee5baa6e4b893e5b19e31333337613931期设置为出生日期
	        cal.setTime(birthDay); 
	        //取出出生日期的年、月、日部分  
	        int yearBirth = cal.get(Calendar.YEAR); 
	        int monthBirth = cal.get(Calendar.MONTH); 
	        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH); 
	        //当前年份与出生年份相减，初步计算年龄
	        int age = yearNow - yearBirth; 
	        //当前月份与出生日期的月份相比，如果月份小于出生月份，则年龄上减1，表示不满多少周岁
	        if (monthNow <= monthBirth) { 
	            //如果月份相等，在比较日期，如果当前日，小于出生日，也减1，表示不满多少周岁
	            if (monthNow == monthBirth) { 
	                if (dayOfMonthNow < dayOfMonthBirth) age--; 
	            }else{ 
	                age--; 
	            } 
	        } 
	        return age; 
	    }
/*@RequestMapping("login")
public String login(@ModelAttribute User user,HttpSession session){
	User user2=new User();
	user2.setUserName(URLEncoder.encode(user.getUserName().trim()));
	user2.setPassword(URLEncoder.encode(user.getPassword().trim()));
	List<User> list=UserService.login(user2);
	if(!list.isEmpty()){
		session.setAttribute("user1", list.get(0));
		return "resirect:/client/index";  //重定向到主页
		//return "/client/index";  //这样写是请求转发，此处必须使用重定向
	}
	else{
		session.setAttribute("msg", "用户名或密码错误！");
		return "/client/login";
	}
}*/

/*//不识别管理员用户身份，无法直接进入管理员页面
@RequestMapping("/login")
public String login (@ModelAttribute(value="user") User user,HttpSession session){
	User user2=new User();
	user2.setUserName(URLEncoder.encode(user.getUserName().trim()));
	user2.setPassword(URLEncoder.encode(user.getPassword().trim()));
	List<User> list=userService.login(user2);
	if (!list.isEmpty()) {
		session.setAttribute("user", list.get(0));
		return "redirect:/client/index";//重定向到主页
		//return "/client/index";   //这样写是请求转发，此处必须使用重定向
		
	}
	else{
		session.setAttribute("msg", "用户名或密码错误！");
		//return "/client/login";
		return "redirect:/client/page/login";  //使用重定向到主页，不使用请求转发  不使用之前输入的值
}
}*/

//登陆改进，增加用户识别身份功能，普通用户和管理员成功登录后进入不同页面
@RequestMapping("/login")
public ModelAndView login(@ModelAttribute User user,ModelAndView mv,HttpSession session){
	//User user2=new User();
	user.setUserName(new String(user.getUserName().trim()));//此处用户名中文部乱码，无需处理
	user.setPassword(user.getPassword().trim());
	List<User> list=userService.login(user);
	if (!list.isEmpty()) {
		User user2=new User();
		user2=list.get(0);
		//普通用户登陆成功，进入前台系统页面
		if (user2.getIdentity().equals("0")) {
			session.setAttribute("user", user2);
			//登陆成功，重定向到指定页
			mv.setView(new RedirectView("/client/index"));
		}
			//管理员登录，进入到后台管理系统
		else{
			mv.setView(new RedirectView("/user/index"));
		}
	}
	else{
		mv.addObject("msg", "用户名或密码错误");
		mv.setViewName("/client/login");
	}
	return mv;
}
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/client/index";
	}

@RequestMapping("/editUserInfo")
public String modifyUserInfo(@ModelAttribute User user,HttpSession session){
	if(user.getBirthday()!=null){
		try {
			user.setAge(getAge(user.getBirthday()));
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	userService.update(user);
	//数据库更新之后，需要将session中的用户信息做相应修改
	User user1=(User) session.getAttribute("user");
	user1.setBirthday(user.getBirthday());
	user.setPassword(user.getPassword());
	user1.setGender(user.getGender());
	session.setAttribute("user",user1);
	return "redirect:/client/page/success";//使用重定向到修改成功页面
	
}

}






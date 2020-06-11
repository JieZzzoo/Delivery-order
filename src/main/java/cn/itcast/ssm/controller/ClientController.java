package cn.itcast.ssm.controller;

import java.awt.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import cn.itcast.ssm.pojo.Notice;
import cn.itcast.ssm.pojo.Product;
import cn.itcast.ssm.service.NoticeService;
import cn.itcast.ssm.service.ProductService;
import net.sf.jsqlparser.expression.operators.relational.MultiExpressionList;

@Controller
@RequestMapping("/client")
public class ClientController {
	
	@Autowired NoticeService noticeService;
	@Autowired ProductService productService;
	
	@RequestMapping("index")
	public String index(Model model){
		
		//查询最新公告
		Notice notice = new Notice();
		notice.setTitle("");
		PageInfo<Notice> pageInfo =noticeService.queryByExample(1, 1, notice);
		model.addAttribute("nList", pageInfo.getList());
		
		//查询本周热卖商品
		java.util.List<Product> piList= productService.queryHot();
		model.addAttribute("pList", piList);
		//查询喜欢商品
		java.util.List<Product> xList= productService.queryXiHuan();
		model.addAttribute("xList", xList);
		//查询最新上市商品
		java.util.List<Product> xpList= productService.queryXinPin();
		model.addAttribute("xpList", xpList);
		
		return "/client/index";
	}
	
	//打开注册页面
		@RequestMapping("/page/register")
		public String register(){
			return "/client/register";
			
}
		// 打开注册成功页面
		@RequestMapping("/page/registersuccess")
		public String registersuccess() {
			return "/client/registersuccess";
		}

		//打开登录页面
		@RequestMapping("/page/login")
		public String loginpage(){
			return  "/client/login";
		}
	
		
		
//打开个人中心页面，如果用户在点击“个人中心”时没有登陆，则跳转登陆页面，否则打开个人信息页面
@RequestMapping("/page/myAccount")
public String myAccount(HttpSession session){
	if(session.getAttribute("user")!=null){
		return "/client/myAccount";
	}else{
		return  "client/login";
	}
}
//打开个人信息页面
@RequestMapping("/page/modifyUserInfo")
public String modifyUserInfo(){
	return "/client/modifyuserinfo";
}

//打开个人信息修改成功页面
@RequestMapping("/page/success")
public String success(){
	return  "/client/success";
}
//打开购物车页面
@RequestMapping("/page/cart")
public String cart(){
	return "/client/cart";
}

//打开结账页面
@RequestMapping("/page/order")
public String order(HttpSession session){
	//下单前检查用户是否登录，没有登陆则先登录
	if(session.getAttribute("user")==null){
		session.setAttribute("msg", "您还没有登录，请登录");
		return "/client/login";
	}
	//如果购物车为空，不能下单，打开主页
	if(session.getAttribute("cart")==null){
		return "redirect:/client/index";
	}
	return "/client/order";
}
//打开创建订单成功页面
@RequestMapping("/page/createOrderSuccess")
public String createOrderSuccess(){
	return "client/createOrderSuccess";
}

//打开支付页面
@RequestMapping("/page/pay")
public String pay(){
	return "/client/pay";
}

//模拟支付
@RequestMapping("/pay")
public String pay(Long oId,Double money,String yh,HttpServletRequest request){
	request.setAttribute("oId", oId);
	request.setAttribute("money", money);
	request.setAttribute("yh", yh);
	return "/client/confirm";
}
//打开支付成功页面
@RequestMapping("/page/paysuccess")
public String paysuccess(){
	return "/client/paysuccess";
}




}

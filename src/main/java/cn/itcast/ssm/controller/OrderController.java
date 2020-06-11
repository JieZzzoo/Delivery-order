package cn.itcast.ssm.controller;

import java.nio.file.attribute.UserPrincipalLookupService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.XmlTokenSource;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.aspectj.weaver.ast.Var;
import org.ietf.jgss.Oid;
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

import cn.itcast.ssm.pojo.Order;
import cn.itcast.ssm.pojo.OrderItem;
import cn.itcast.ssm.pojo.Product;
import cn.itcast.ssm.pojo.User;
import cn.itcast.ssm.service.OrderItemService;
import cn.itcast.ssm.service.OrderService;
import cn.itcast.ssm.service.ProductService;
import cn.itcast.ssm.vo.EasyUIResult;
import tk.mybatis.mapper.common.Mapper;

@RequestMapping("/order")
@Controller
public class OrderController {
@Autowired OrderService orderService;
@Autowired OrderItemService orderItemService;
@Autowired ProductService productService;

@RequestMapping("/order_index")
public String order_index() {
	return "order/order_index";
}
@RequestMapping("/list")
public ResponseEntity<EasyUIResult> queryOrdertList(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="rows",defaultValue="2")Integer rows,Order order){
	try {
		
		PageInfo<Order> pageInfo = orderService.queryByExample(page, rows, order);
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


@RequestMapping(value="/delete",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> deleteProduct(@RequestParam(value="ids") Long oId[]){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		Order order=new Order();
		for(int i = 0;i<oId.length;i++){
			System.out.print(oId[i]);
			order.setoId(oId[i]);
		orderService.deleteById(order);}
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
	ModelAndView mv=new ModelAndView("orderExcelView");
	//查询订单
	PageInfo<Order> pageInfo = orderService.queryListInPage(page, rows);
	mv.addObject("orderList", pageInfo.getList());
	return mv;
	
}
@RequestMapping(value="/export/excelall")
public ModelAndView exportExcelAll(){
	ModelAndView mv=new ModelAndView("orderExcelView");
	//查询订单
	List<Order> list = orderService.queryAll();
	mv.addObject("orderList",list);
	return mv;
	
}
@RequestMapping("/page/query")
public String toPageQuery(){
	return "order/order_query";
}

@RequestMapping("/queryOrderByUser")
public String queryOrderByUser(HttpSession session){
	User user= (User) session.getAttribute("user");
	List<Order> orders =orderService.queryByUser(user.getId());
	session.setAttribute("orders", orders);
	return "/client/orderlist";
}


//前台系统。用户根据Id删除订单
@RequestMapping("/deleteById")
public String deleteById(@RequestParam(value="oId")Long oId){
	Order order= new  Order();
	OrderItem orderItem=new OrderItem();
	order.setoId(oId);
	orderItem.setoId(oId);
	orderService.deleteById(order);
	OrderItemService.delete(orderItem);
	return "redirect:/order/queryOrderByUser";
}



@RequestMapping("/createOrder")
public String createOrder(Order order,HttpSession session){
	User user=(User) session.getAttribute("user");
	Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
	order.setId(user.getId());
	orderService.save(order);
	for(Product p :cart.keySet()){
		OrderItem orderItem=new OrderItem();
		orderItem.setBuynum(cart.get(p));
		orderItem.setoId(order.getoId());
		orderItem.setpId(p.getpId());
		orderItemService.save(orderItem);
		}
	session.removeAttribute("caer");
	return "redirect:/client/page/createOrderSuccess";
}


/*//前台系统，用户提交订单
@RequestMapping("/createOrder")
public String createOrder(Order order,HttpSession session){
	//1.从session中获取当前用户
	User user=(User) session.getAttribute("user");
	//2.从购物车中获取商品信息
	Map<Product, Integer> cart=(Map<Product, Integer>)session.getAttribute("cart");
	//3.将数据封装到订单对象中
	//将用户id封装到订单对象中
	order.setId(user.getId());
	//4.调用service向订单中添加订单
	orderService.save(order);
	//5.向orderietm中添加记录
	for(Product p:cart.keySet()){
		OrderItem orderItem=new OrderItem();
		orderItem.setBuynum(cart.get(p));
		orderItem.setoId(order.getoId());
		orderItem.setpId(p.getpId());
		orderItemService.save(orderItem);
	}
	//订单表生成后清空购物车
	session.removeAttribute("cart");
	return "redirect:/client/page/createOrderSuccess";
}*/




@RequestMapping("/orderstate")
public String changOrderatate(Order order,HttpSession session,HttpServletResponse response){
	if(order.getoId()!=null){
		Order order2=orderService.queryById(order.getoId());
		order2.setPaystate(1);
		//根据订单号修改订单状态
		orderService.update(order2);
		//订单支付后，修改库存
		List<OrderItem> orderItems=orderItemService.queryByExample(order2.getoId());
		Product  p=new Product();
		int buynum,newnum;
		for(OrderItem orderItem:orderItems){
			p=productService.queryById(orderItem.getpId());
			buynum=orderItem.getBuynum();
			newnum=p.getPnum()-buynum;
			p.setPnum(newnum);
			productService.update(p);
		}
	}
	return "redirect:/client/page/paysuccess";
}
}

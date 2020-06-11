package cn.itcast.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import cn.itcast.ssm.pojo.Order;
import cn.itcast.ssm.pojo.OrderItem;
import cn.itcast.ssm.pojo.OrderResult;
import cn.itcast.ssm.pojo.Product;
import cn.itcast.ssm.service.OrderItemService;
import cn.itcast.ssm.service.OrderService;
import cn.itcast.ssm.service.ProductService;
@RequestMapping("/orderitem")
@Controller
public class OrderItemController {
	@Autowired OrderItemService orderItemService;
	@Autowired ProductService productService;
	@Autowired OrderService orderService;
	@RequestMapping("/findOrderItemById")
	public String findOrderItemById(@RequestParam(value="oId") Long oId,HttpSession session){
		//根据oId,在orderitem表中查询某一订单的所有内容
		List<OrderItem> oil= orderItemService.queryByExample(oId);
		//根据oId在orders表中查询某一条订单
		Order order = orderService.queryById(oId);
		List<OrderResult> orl =new ArrayList<>();
		for(OrderItem orderItem:oil){
			Product product =productService.queryById(orderItem.getpId());
			OrderResult orderResult= new OrderResult();
			orderResult.setBuynum(orderItem.getBuynum());
			orderResult.setP(product);
			orl.add(orderResult);
			
		}
		session.setAttribute("orderResultList", orl);
		session.setAttribute("order", order);
		return "client/orderInfo";
		
		
/*		for (OrderItem orderItem:oil ){
			//根据订单条目的pId查询商品
			Product product=productService.queryById(orderItem.getpId());
			OrderResult orderResult =new OrderResult();
			//获取某一订单条目的购买数量buynum,并保存到结果中
			orderResult.setBuynum(orderItem.getBuynum());
			orderResult.setP(product);
			orl.add(orderResult);
		}
		session.setAttribute("orderResultList",orl);
		
		session.setAttribute("order",order);
		return "/client/orderInfo";*/
		
		
	}
	
}

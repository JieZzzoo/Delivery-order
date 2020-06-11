package cn.itcast.ssm.controller;

import java.nio.file.attribute.UserPrincipalLookupService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.aspectj.weaver.ast.Var;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.sym.Name;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.util.Base64Decoder.IntWrapper;

import cn.itcast.ssm.pojo.Product;
import cn.itcast.ssm.service.ProductService;
import cn.itcast.ssm.vo.EasyUIResult;
import tk.mybatis.mapper.common.Mapper;

@RequestMapping("/product")
@Controller
public class ProductController {
@Autowired ProductService productService;

@RequestMapping("/product_index")
public String product_index() {
	return "product/product_index";
}
@RequestMapping("/list")
public ResponseEntity<EasyUIResult> queryProductList(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="rows",defaultValue="2")Integer rows,Product product){
	try {
		
		PageInfo<Product> pageInfo = productService.queryByExample(page, rows, product);
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
	return "product/product_add";
}
@RequestMapping(value="/save",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> saveProduct(Product product){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		productService.save(product);
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
	return "product/product_edit";
}
@RequestMapping(value="/edit",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> updateProduct(Product product){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		productService.update(product);
		map.put("status", 200);
		return ResponseEntity.ok(map);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
}

@RequestMapping(value="/delete",method=RequestMethod.POST)
public ResponseEntity<Map<String,Object>> deleteProduct(@RequestParam(value="ids") Long pId[]){
	try {
		Map<String, Object> map=new HashMap<String, Object>();
		Product product=new Product();
		for(int i = 0;i<pId.length;i++){
			System.out.print(pId[i]);
		product.setpId(pId[i]);
		productService.deleteById(product);}
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
	ModelAndView mv=new ModelAndView("productExcelView");
	//查询用户
	PageInfo<Product> pageInfo = productService.queryListInPage(page, rows);
	mv.addObject("productList", pageInfo.getList());
	return mv;
	
}
@RequestMapping(value="/export/excelall")
public ModelAndView exportExcelAll(){
	ModelAndView mv=new ModelAndView("productExcelView");
	//查询商品
	List<Product> list = productService.queryAll();
	mv.addObject("productList",list);
	return mv;
	
}
@RequestMapping("/page/query")
public String toPageQuery(){
	return "product/product_query";
}
@RequestMapping("/showProductByCategory")
public String showProductByCategory(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value = "rows",defaultValue="4") Integer rows,Product product,Model model){
	try{
		//解决url传参的中文乱码问题
		String category = new  String(product.getCategory().getBytes("iso-8859-1"),"utf-8");
		PageInfo<Product> bean;
		Product product2 = new Product();
		if (!category.equals("全部商品目录")) {
			product2.setCategory(category);
		}
		bean = productService.queryByExample(page, rows, product2);
		model.addAttribute("bean",bean);
		model.addAttribute("category", category);
	}catch(Exception e){
		e.printStackTrace();
	}
	return "/client/product_list";
}

@RequestMapping("/showProductByName")
public String showProductByName(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value = "rows",defaultValue="4") Integer rows,Product product,Model model){
	try{
		//解决url传参的中文乱码问题
		String name = new  String(product.getName().getBytes("iso-8859-1"),"utf-8");
		PageInfo<Product> bean;
		Product product2 = new Product();
		if (!name.equals("请输入商品名")) {
			product2.setName(name);
		}
		bean = productService.queryByExample(page, rows, product2);
		model.addAttribute("bean",bean);
		model.addAttribute("name", name);
	}catch(Exception e){
		e.printStackTrace();
	}
	return "/client/product_search_list";
}

@RequestMapping("/showProductByBranch")
public String showProductByBranch(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value = "rows",defaultValue="4") Integer rows,Product product,Model model){
	try{
		//解决url传参的中文乱码问题
		String branch = new  String(product.getBranch().getBytes("iso-8859-1"),"utf-8");
		PageInfo<Product> bean;
		Product product2 = new Product();
		if (!branch.equals("请输入商品名")) {
			product2.setBranch(branch);
		}
		bean = productService.queryByExample(page, rows, product2);
		model.addAttribute("bean",bean);
		model.addAttribute("name", branch);
	}catch(Exception e){
		e.printStackTrace();
	}
	return "/client/product_search_list";
}

@RequestMapping("/findProductById")
public String findProductById(Product product,Model model){
	Product p =productService.queryById(product.getpId());
	model.addAttribute("product", p);
	return "/client/info";
}

@RequestMapping("/addCart")
public String addCart(Product product,HttpSession session){
	Long pId=product.getpId();
	Product p = new Product();
	Integer count = null;
	p=productService.queryById(pId);
	Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
	if(cart==null){
		cart=new HashMap<Product,Integer>();
	}
	Set<Product> keys=cart.keySet();
	//遍历购物车cart，按商品id查找购物车中是否有先要购买的商品
	for(Product p1:keys){
		//满足p1.getpId（）==p.getpId()这个条件，说明购物车里已有要购买的商品，则让购买商品数量加1
		if(p1.getpId()==p.getpId()){
			Integer num =cart.get(p1);
			count=cart.put(p1, num+1);
			break;
	}
}
	//如果count==null，说明购物车里没有现要购买的商品，则将商品添加到购物车，购买数量为1
	if(count==null){
		cart.put(p, 1);
		}
	session.setAttribute("cart", cart);
	return "redirect:/client/page/cart";
	}


@RequestMapping("/changCart")
public String changCart(Long pId,int count,HttpSession session){
	//1.得到要修改的购物车
	Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
	Set<Product> keys=cart.keySet();
	//2.遍历购物车cart，按商品id查找购物车中对应的商品
	for(Product p1:keys){
		if(p1.getpId()==pId){
	     //3.找到对应商品之后，如果修改后的商品数量不为0，则修改购物车中对应商品的数量
			if(count!=0){
				cart.put(p1, count);
				break;
			}else{
	        //4.如果修改后的商品数量为0，则把商品从购物车中移除
				cart.remove(p1);
		}
      }
  }
	return "redirect:/client/page/cart";
  }
}

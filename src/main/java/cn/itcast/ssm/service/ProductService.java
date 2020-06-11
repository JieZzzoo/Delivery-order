package cn.itcast.ssm.service;

import java.net.URLDecoder;
import java.util.List;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;

import cn.itcast.ssm.mapper.HotMapper;
import cn.itcast.ssm.mapper.ProductMapper;
import cn.itcast.ssm.mapper.XiHuanMapper;
import cn.itcast.ssm.mapper.XinPinMapper;
import cn.itcast.ssm.pojo.Product;
import tk.mybatis.mapper.entity.Example;

@Service
public class ProductService extends BaseService<Product> {
@Autowired
private ProductMapper productMapper;

@Autowired
private HotMapper hotMapper;
@Autowired
private XiHuanMapper xiuHuanMapper;
@Autowired
private XinPinMapper xinPinMapper;

public PageInfo<Product> queryByExample( Integer page,Integer rows, Product product) {		
	
	PageHelper.startPage(page,rows);
	

	Example example = new Example(Product.class);
	Example.Criteria criteria = example.createCriteria();
	if (StringUtil.isNotEmpty(product.getName())) {
		 criteria.andLike("name", "%" + URLDecoder.decode(product.getName()) + "%");  //模糊查询
		//criteria.andEqualTo("account", user.getAccount());  //精确查询
	}
	
	if (StringUtil.isNotEmpty(product.getCategory())) {
		 //criteria.andLike("name", "%" + URLDecoder.decode(product.getName()) + "%");  //模糊查询
		criteria.andEqualTo("category", product.getCategory());  //精确查询
	}
	
	if (StringUtil.isNotEmpty(product.getBranch())) {
		 //criteria.andLike("name", "%" + URLDecoder.decode(product.getName()) + "%");  //模糊查询
		criteria.andEqualTo("branch", product.getBranch());  //精确查询
	}
	if(product.getPrice()!=null){
		if(product.getPrice()==1){
			criteria.andLessThan("price", 50);
		}
	    if (product.getPrice()==2) {

		    criteria.andBetween("price", 50, 100);
	    }
	    if (product.getPrice()==3) {

		    criteria.andBetween("price", 100, 200);
	    }
	    if(product.getPrice()==4){
			criteria.andGreaterThan("price", 200);
		}
	}
	List<Product> list = productMapper.selectByExample(example);
	PageInfo<Product> pageInfo = new PageInfo<>(list);
	
	return pageInfo;
}
	public List<Product> queryHot(){
		return hotMapper.queryHot();
	}
	public List<Product> queryXiHuan() {
		
		// TODO Auto-generated method stub
		return xiuHuanMapper.queryXiHuan();
	}
	public List<Product> queryXinPin() {
		// TODO Auto-generated method stub
		return xinPinMapper.queryXinPin();
	}
}

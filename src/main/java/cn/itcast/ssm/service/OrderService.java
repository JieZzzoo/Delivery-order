package cn.itcast.ssm.service;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;

import cn.itcast.ssm.mapper.OrderMapper;
import cn.itcast.ssm.pojo.Order;
import tk.mybatis.mapper.entity.Example;

@Service
public class OrderService extends BaseService<Order> {
@Autowired
private OrderMapper orderMapper;

public PageInfo<Order> queryByExample( Integer page,Integer rows, Order order) {		
	
	PageHelper.startPage(page,rows);
	

	Example example = new Example(Order.class);
	Example.Criteria criteria = example.createCriteria();
	if (StringUtil.isNotEmpty(order.getReceiverName())) {
		 criteria.andLike("receiverName", "%" + URLDecoder.decode(order.getReceiverName()) + "%");  //模糊查询
		//criteria.andEqualTo("account", user.getAccount());  //精确查询
	}
	if (StringUtil.isNotEmpty(order.getReceiverAddress())) {
		 criteria.andLike("receiverAddress", "%" + URLDecoder.decode(order.getReceiverAddress())+ "%");
		//criteria.andEqualTo("userName", user.getUserName());
	}
	if (StringUtil.isNotEmpty(order.getReceiverPhone())) {
		 //criteria.andLike("receiverPhone", "%" + URLDecoder.decode(order.getReceiverPhone())+ "%");
		criteria.andEqualTo("receiverPhone", order.getReceiverPhone());
	}
	
	
	List<Order> list = orderMapper.selectByExample(example);
	PageInfo<Order> pageInfo = new PageInfo<>(list);
	
	return pageInfo;
}

//前台，根据用户id查询用户所有订单
public List<Order> queryByUser(Long id){
	Example example = new Example(Order.class);
	Example.Criteria criteria = example.createCriteria();
	if(id!=null){
		criteria.andEqualTo("id", id);
	}
	List<Order> orders = orderMapper.selectByExample(example);
	return orders;
}

}

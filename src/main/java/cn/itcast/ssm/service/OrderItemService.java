package cn.itcast.ssm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.itcast.ssm.mapper.OrderItemMapper;
import cn.itcast.ssm.pojo.OrderItem;
import tk.mybatis.mapper.entity.Example;

@Service
public class OrderItemService extends BaseService<OrderItem> {
	@Autowired
	private OrderItemMapper orderItemMapper;
	
	public List<OrderItem> queryByExample(Long oId){
		Example example = new Example(OrderItem.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("oId", oId);
		List<OrderItem> oil=orderItemMapper.selectByExample(example);
		return oil;
	}

	public static void delete(OrderItem orderItem) {
		// TODO Auto-generated method stub
		
	}

	
}

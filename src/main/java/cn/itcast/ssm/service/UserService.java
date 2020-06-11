package cn.itcast.ssm.service;

import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;

import cn.itcast.ssm.mapper.UserMapper;
import cn.itcast.ssm.pojo.User;
import tk.mybatis.mapper.entity.Example;

@Service
public class UserService extends BaseService<User> {
@Autowired
private UserMapper userMapper;

public PageInfo<User> queryByExample( Integer page,Integer rows, User user) {		
	
	PageHelper.startPage(page,rows);
	

	Example example = new Example(User.class);
	Example.Criteria criteria = example.createCriteria();
	if (StringUtil.isNotEmpty(user.getAccount())) {
		 criteria.andLike("account", "%" + URLDecoder.decode(user.getAccount()) + "%");  //模糊查询
		//criteria.andEqualTo("account", user.getAccount());  //精确查询
	}
	if (StringUtil.isNotEmpty(user.getUserName())) {
		 criteria.andLike("userName", "%" + URLDecoder.decode(user.getUserName())+ "%");
		//criteria.andEqualTo("userName", user.getUserName());
	}
	if (user.getGender()!=null) {

		criteria.andEqualTo("gender", user.getGender());
	}
	if(user.getAge()!=null){
		if(user.getAge()==1){
			criteria.andLessThan("age", 10);
		}
	    if (user.getAge()==2) {

		    criteria.andBetween("age", 10, 30);
	    }
	    if (user.getAge()==3) {

		    criteria.andBetween("age", 30, 50);
	    }
	    if(user.getAge()==4){
			criteria.andGreaterThan("age", 50);
		}
	}
	List<User> list = userMapper.selectByExample(example);
	PageInfo<User> pageInfo = new PageInfo<>(list);
	
	return pageInfo;
}
public List<User> login(User user){
	Example example=new Example(User.class);
	Example.Criteria criteria =example.createCriteria();
	if(user.getUserName()!=null){
		criteria.andEqualTo("userName",URLDecoder.decode(user.getUserName()));  	//解决中文乱码问题
		//criteria.andEqualTo("userName",user.getUserName());
	}
	if(user.getPassword()!=null){
		criteria.andEqualTo("password",URLDecoder.decode(user.getPassword()));
		//criteria.andEqualTo("password",user.getPassword());
	}
	List<User> list = userMapper.selectByExample(example);
	return list;
	
}

}

package cn.itcast.ssm.service;

import java.net.URLDecoder;
import java.util.List;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;

import cn.itcast.ssm.mapper.NoticeMapper;
import cn.itcast.ssm.pojo.Notice;
import tk.mybatis.mapper.entity.Example;

@Service
public class NoticeService extends BaseService<Notice> {
@Autowired
private NoticeMapper noticeMapper;

public PageInfo<Notice> queryByExample( Integer page,Integer rows, Notice notice) {		
	
	PageHelper.startPage(page,rows);
	

	Example example = new Example(Notice.class);
	Example.Criteria criteria = example.createCriteria();
	if (StringUtil.isNotEmpty(notice.getTitle())) {
		 criteria.andLike("title", "%" + URLDecoder.decode(notice.getTitle()) + "%");  //模糊查询
		//criteria.andEqualTo("account", user.getAccount());  //精确查询
	}
	if (StringUtil.isNotEmpty(notice.getDetails())) {
		 criteria.andLike("details", "%" + URLDecoder.decode(notice.getDetails())+ "%");
		//criteria.andEqualTo("userName", user.getUserName());
	}
	//if(notice.getTitle().length()==0){
	 /*if(notice.getTitle()!=null){
		example.setOrderByClause("n_time desc");*/
	
	if(notice.getTitle().length()==0){
		example.setOrderByClause("n_time desc");
	}
	
	
	List<Notice> list = noticeMapper.selectByExample(example);
	PageInfo<Notice> pageInfo = new PageInfo<>(list);
	
	return pageInfo;
}
}

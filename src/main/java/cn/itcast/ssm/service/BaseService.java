
package cn.itcast.ssm.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.common.Mapper;

public abstract class BaseService<T> {
	
	@Autowired
	private Mapper<T> mapper;
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<T> queryAll(){
		return mapper.selectAll();
	}
	/**
	 * 分页查询
	 * @param page页号
	 * @param rows页大小，每页记录数
	 * @param pageinfo
	 */
	public PageInfo<T> queryListInPage(Integer page,Integer rows){
		PageHelper.startPage(page, rows);
		List<T> list=mapper.selectAll();
		return new PageInfo<>(list);
	}
	/**
	 * 根据id查询数据
	 * @return
	 */
	public T queryById(long id){
		return mapper.selectByPrimaryKey(id);
	}
	/**
	 * 新增
	 * @param t
	 */
	public void save(T t){
		mapper.insertSelective(t);
	}
	/**
	 * 更新（修改）
	 * @param t
	 */
	public void update(T t){
		mapper.updateByPrimaryKeySelective(t);
	}
	/**
	 * 根据id删除
	 * @param id
	 */
	public void deleteById(T t){
		mapper.deleteByPrimaryKey(t);
	}
	
}

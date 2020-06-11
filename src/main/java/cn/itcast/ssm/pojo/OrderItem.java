package cn.itcast.ssm.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="orderitem")
public class OrderItem implements Serializable{
	private static final long serialVersionUID = -7644967201570973657L;
	//jpa注解
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long oId;
	private Long pId;
	private int buynum;
	
	public Long getoId() {
		return oId;
	}
	public void setoId(Long oId) {
		this.oId = oId;
	}
	public Long getpId() {
		return pId;
	}
	public void setpId(Long pId) {
		this.pId = pId;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
}

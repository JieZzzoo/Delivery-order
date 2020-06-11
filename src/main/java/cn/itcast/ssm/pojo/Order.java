package cn.itcast.ssm.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
@Table(name="orders")
public class Order implements Serializable {

	private static final long serialVersionUID = -7644967201570973657L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long oId;
	private Double money;
	private String receiverAddress;
	private String receiverName;
	private String receiverPhone;
	private Integer paystate;
	private Date ordertime;
	private Long id;
	
	
	public Long getoId() {
		return oId;
	}
	public void setoId(Long oId) {
		this.oId = oId;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	
	public Integer getPaystate() {
		return paystate;
	}
	public void setPaystate(Integer paystate) {
		this.paystate = paystate;
	}
	
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Order [oId=" + oId + ", money=" + money + ", receiverAddress=" + receiverAddress + ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", paystate=" + paystate + ", ordertime=" + ordertime + ", id="
				+ id + "]";
	}
	
}

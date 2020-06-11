package cn.itcast.ssm.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="products")
public class Product implements Serializable {

	private static final long serialVersionUID = -7644967201570973657L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long pId;
	
	private String name;
	private Double price;
	private String category;
	private String branch;
	private Integer pnum;
	private String imgurl;
	private String description;
	
	
	public Long getpId() {
		return pId;
	}
	public void setpId(Long pId) {
		this.pId = pId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch =branch;
	}
	
	public Integer getPnum() {
		return pnum;
	}
	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}
	
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", name=" + name + ", price=" + price + ", category=" + category + ", pnum=" + pnum + ", imgurl=" + imgurl + ", description=" + description + "]";
	}
	
}

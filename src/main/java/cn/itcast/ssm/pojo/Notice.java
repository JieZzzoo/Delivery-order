package cn.itcast.ssm.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
@Table(name="notice")
public class Notice implements Serializable {

	private static final long serialVersionUID = -7644967201570973657L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long nId;
	private String title;
	private String details;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date nTime;
	

	public Long getnId() {
		return nId;
	}
	public void setnId(Long nId) {
		this.nId = nId;
	}


	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	public Date getnTime() {
		return nTime;
	}
	public void setnTime(Date nTime) {
		this.nTime = nTime;
	}
	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", title=" + title + ", details=" + details + ", nTime="
				+ nTime + "]";
	}
	
}

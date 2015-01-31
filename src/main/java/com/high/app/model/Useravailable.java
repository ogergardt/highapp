package com.high.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(catalog = "highapp", name = "useravailable")
public class Useravailable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "userid", nullable = false)
	private Integer userid;

	@Column(name = "weekday", nullable = false)
	private Integer weekday;


	@Column(name = "hourbegin", nullable = false)
	private Integer hourbegin;

	@Column(name = "available", nullable = false)
	private Integer available;
	
	@ManyToOne  
	@JoinColumn(name="userid", referencedColumnName="id", insertable=false, updatable=false)  
	private User user;  
	
	public Useravailable() {
	}


	public Useravailable(Integer userid, Integer weekday, Integer hourbegin, Integer available) {
		this.userid = userid;
		this.weekday = weekday;
		this.hourbegin = hourbegin;
		this.available = available;
	}
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public Integer getWeekday() {
		return weekday;
	}


	public void setWeekday(Integer weekday) {
		this.weekday = weekday;
	}


	public Integer getHourbegin() {
		return hourbegin;
	}


	public void setHourbegin(Integer hourbegin) {
		this.hourbegin = hourbegin;
	}


	public Integer getAvailable() {
		return available;
	}


	public void setAvailable(Integer available) {
		this.available = available;
	}


}
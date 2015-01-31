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
@Table(catalog = "highapp", name = "schedule")
public class Schedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "userid", nullable = false)
	private Integer userid;

	@Column(name = "begin", nullable = false, length = 50)
	private String begin;


	@Column(name = "comment", nullable = false, length = 600)
	private String comment;
	
	@ManyToOne  
	@JoinColumn(name="userid", referencedColumnName="id", insertable=false, updatable=false)  
	private User user;  
	
	public Schedule() {
	}


	public Schedule(Integer userid, String begin, String comment) {
		this.userid = userid;
		this.begin = begin;
		this.comment = comment;
	}
	
	public User getUser() {
		return user;
	}
	
	public String getUserName() {
		return user.getName();
	}
	public String getUserEmail() {
		return user.getEmail();
	}
	
	public String getUserLogin() {
		return user.getLogin();
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

	public String getBegin() {
		return begin;
	}


	public void setBegin(String begin) {
		this.begin = begin;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}

}
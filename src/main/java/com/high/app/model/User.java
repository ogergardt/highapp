package com.high.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(catalog = "highapp", name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

  
	@Column(name = "login", nullable = false, unique = true, length = 20)
	private String login;


	@Column(name = "name", nullable = false, length = 20)
	private String name;


	@Column(name = "email", nullable = false, length = 60)
	private String email;


	@Column(name = "password", nullable = false, length = 100)
	private String password;

	@Column(name = "role", nullable = false, length = 20)
	private String role;
	
	public User() {
	}


	public User(String login, String name, String email, String password, String role) {
		this.login = login;
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	
}

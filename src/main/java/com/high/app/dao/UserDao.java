package com.high.app.dao;

import java.util.List;

import com.high.app.model.User;

public interface UserDao {
	public void save(User user);
	public void save(List<User> user);
	public void delete(User user);
	public void update(User user);


	public List<User> getUsers();
	public User getUserById(Integer id);
	public User getUserByLogin(String login);
	public User getUserByEmail(String email);
	                    
}

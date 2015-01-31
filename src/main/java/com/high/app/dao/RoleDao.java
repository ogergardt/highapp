package com.high.app.dao;

import java.util.List;

import com.high.app.model.Role;

public interface RoleDao {
	public void save(Role role);
	public void save(List<Role> role);
	public void delete(Role role);
	public void update(Role role);
	
	public List<Role> getRoles();
	public Role getRoleById(Integer id);
}

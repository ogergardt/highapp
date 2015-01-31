package com.high.app.dao.impl;

import java.util.List;

import com.high.app.dao.AbstractDao;
import com.high.app.dao.RoleDao;
import com.high.app.model.Role;


public class RoleDaoImpl extends AbstractDao implements RoleDao {

	@Override
	public void save(Role role) {
		session.save(role);
	}

	@Override
	public void save(List<Role> list) {
		for( int i = 0; i < list.size(); ++i )
			session.save(list.get(i));
	}

	@Override
	public void delete(Role role) {
		session.delete(role);

	}

	@Override
	public void update(Role role) {
		session.update(role);

	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Role> getRoles() {
		return session.createQuery("from com.high.app.model.Role").list();
	}

	@Override
	public Role getRoleById(Integer id) {
		return (Role) session.get(Role.class, id);
	}

}

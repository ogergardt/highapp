package com.high.app.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.high.app.dao.AbstractDao;
import com.high.app.dao.UserDao;
import com.high.app.model.User;

public class UserDaoImpl extends AbstractDao implements UserDao {

	@Override
	public void save(User user) {
		session.save(user);
	}


	@Override
	public void save(List<User> list) {
		for( int i = 0; i < list.size(); ++i )
			session.save(list.get(i));
	}


	@Override
	public void delete(User user) {
		session.delete(user);
	}


	@Override
	public void update(User user) {
		session.update(user);
	}


	@Override
    @SuppressWarnings("unchecked")
	public List<User> getUsers() {
		return session.createQuery("from com.high.app.model.User").list();
	}


	@Override
	public User getUserById(Integer id) {
		return (User) session.get(User.class, id);
	}


	@Override
	public User getUserByLogin(String login) {
		Query query = session.createQuery("from com.high.app.model.User where login=:val");
		Object res = query.setParameter("val", login).uniqueResult();
		return (User) res;
	}
	
	@Override
	public User getUserByEmail(String email) {
		Query query = session.createQuery("from com.high.app.model.User where email=:val");
		Object res = query.setParameter("val", email).uniqueResult();
		return (User) res;
	}

}

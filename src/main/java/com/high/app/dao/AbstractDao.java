package com.high.app.dao;

import org.hibernate.Session;

public abstract class AbstractDao {
	
	protected Session session;


	public Session getSession() {
		return session;
	}


	public void setSession(Session session) {
		this.session = session;
	}

}

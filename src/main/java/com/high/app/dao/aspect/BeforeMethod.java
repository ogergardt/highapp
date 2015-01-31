package com.high.app.dao.aspect;

import com.high.app.hibernate.HibernateUtil;


import java.lang.reflect.Method;


import org.hibernate.Session;
import org.springframework.aop.MethodBeforeAdvice;


import com.high.app.dao.AbstractDao;


public class BeforeMethod implements MethodBeforeAdvice {


	@Override
	public void before(Method method, Object[] args, Object target)
			throws Throwable {


		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		((AbstractDao) target).setSession(session);
		session.beginTransaction();


	}


}

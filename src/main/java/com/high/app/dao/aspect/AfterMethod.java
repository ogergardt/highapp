package com.high.app.dao.aspect;


import java.lang.reflect.Method;


import org.aspectj.lang.annotation.Aspect;
import org.hibernate.Session;
import org.springframework.aop.AfterReturningAdvice;

import com.high.app.dao.AbstractDao;

@Aspect
public class AfterMethod implements AfterReturningAdvice {


	@Override
	public void afterReturning(Object returnValue, Method method,
			Object[] args, Object target) throws Throwable {


		Session session = ((AbstractDao) target).getSession();
		session.getTransaction().commit();


	}

}

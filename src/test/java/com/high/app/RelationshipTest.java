package com.high.app;

import java.util.List;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.high.app.dao.UserDao;
import com.high.app.model.User;


public class RelationshipTest extends TestCase{
	
	private static SessionFactory sessionFactory;
	private Session session;
	private static ApplicationContext context;

	@BeforeClass
	public static void configure() {

//		Configuration cfg = new Configuration();
//		cfg.configure().setProperty("hbm2ddl.auto", "create");
//		sessionFactory = cfg.buildSessionFactory();

		context = new ClassPathXmlApplicationContext("DaoFactory.xml");

	}

	@Before
	public void preLaunch() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
	}

	@After
	public void postLaunch() {
		session.getTransaction().commit();
	}



	@Test
	public void createAnonymousPurchase() {

		User user1 = new User("Overlord", "Vladimir", "overlord2003@ukr.net", "secret","ROLE_USER");
		User user2 = new User("Pepe", "Vladimir", "v.sosnyn@gmail.com", "qwerty","ROLE_USER");
		User user3 = new User("Kakatrix", "Курица", "kakatrix@mail.ru", "secret_too","ROLE_USER");
		User user4 = new User("Joshuardo", "Владимир", "joshuardo@mail.ru", "power","ROLE_USER");

		session.save(user1);
		session.save(user2);
		session.save(user3);
		session.save(user4);

	}


	@Test
	public void createUsers()  {

		UserDao userdao = (UserDao) context.getBean("userDao");

		User user1 = new User("Overlord", "Vladimir", "overlord2003@ukr.net", "secret","ROLE_USER");
		User user2 = new User("Pepe", "Vladimir", "v.sosnyn@gmail.com", "qwerty","ROLE_USER");
		User user3 = new User("Kakatrix", "Курица", "kakatrix@mail.ru", "secret_too","ROLE_USER");
		User user4 = new User("Joshuardo", "Владимир", "joshuardo@mail.ru", "power","ROLE_USER");

		userdao.save(user1);
		userdao.save(user2);
		userdao.save(user3);
		userdao.save(user4);

		List<User> ls = userdao.getUsers();

		User forUpdate = ls.get(3);
		forUpdate.setEmail("--PREMISSION--");

		userdao.update(forUpdate);

		ls = userdao.getUsers();

		userdao.delete(forUpdate);

		ls = userdao.getUsers();

		forUpdate = userdao.getUserById(1);
		forUpdate = userdao.getUserByLogin("Overlord");

		assertTrue(true);

	}

	@Test
	public void createPurchaseByUser() {

	}


	@Test
	public void other() {
//		context.ge
		ApplicationContext context = new ClassPathXmlApplicationContext("DaoFactory.xml");
		boolean s = context.isSingleton("userDao");

		UserDao userdao = (UserDao) context.getBean("userDao");
		userdao = (UserDao) context.getBean("userDao");
		userdao = (UserDao) context.getBean("userDao");
		userdao = (UserDao) context.getBean("userDao");


	}
	
	@Test
	public void testSomeData() {
		assertTrue("Constant is not true", true);
	}

}

package com.occm.daos.impl;

import java.util.Collection;

import javax.annotation.PostConstruct;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.occm.daos.interfaces.UserDao;
import com.occm.models.User;

@Repository("UserDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory factory;

	public UserDaoImpl() {
		System.out.println("In User Dao : Const. : Factory => ( " + factory
				+ " ) ");
	}

	@PostConstruct
	public void init() {
		System.out.println("In User Dao : Init : Factory => ( " + factory
				+ " ) ");
	}

	@Override
	public User register(User user) {
		Long id = (Long) factory.getCurrentSession().save(user);
		user.setId(id);
		return user;
	}

	@Override
	public User validate(User user) {
		String hql = "select u from User u where u.email = :em and c.password = :pa";

		return (User) factory.getCurrentSession().createQuery(hql)
				.setParameter("em", user.getEmail())
				.setParameter("pa", user.getPassword()).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<User> viewAll() {
		String hql = "select u from User u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public User update(User user) {
		System.out.println("In User Dao : Update : user => ( " + user + " ) ");
		factory.getCurrentSession().update(user);
		return user;
	}

	@Override
	public User unsubscribe(Long id) {
		Session ref=factory.getCurrentSession();
		System.out.println("In User Dao : Unsubscribe : Session Ref => ( " + ref + " ) ");
		User user = getDetails(id);
		if(user != null)
			ref.delete(user);
		else
			System.out.println("In User Dao : Unsubscribe : User Not Found  : ID => ( " + id + " ) ");
		return user;
	}

	@Override
	public User getDetails(Long id) {
		
		Session ref=factory.getCurrentSession();
		System.out.println("In User Dao : getDetails : Session Ref => ( " + ref + " ) ");
		return (User) ref.get(User.class,id);
		
		/*String hql = "select u from User u where u.id = :i";

		return (User) factory.getCurrentSession().createQuery(hql)
				.setParameter("i", id).uniqueResult();*/
	}

}

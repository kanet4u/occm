package com.occm.services.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.occm.daos.interfaces.UserDao;
import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Service("user_service_dao")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao dao;

	@Override
	@Transactional(timeout=100)
	public User register(User user) {
		return dao.register(user);
	}

	@Override
	@Transactional(readOnly=true)
	public User validate(User user) {
		return dao.validate(user);
	}

	@Override
	@Transactional(readOnly=true)
	public Collection<User> viewAll() {
		return dao.viewAll();
	}

	@Override
	public User update(User user) {
		return dao.update(user);
	}

	@Override
	public User unsubscribe(Long id) {
		return dao.unsubscribe(id);
	}

	@Override
	public User getDetails(Long id) {
		return dao.getDetails(id);
	}
}

package com.occm.services.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.occm.daos.interfaces.UserDao;
import com.occm.models.Competition;
import com.occm.models.Role;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.models.UserStatus;
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
	@Transactional(timeout=100)
	public User update(User user) {
		return dao.update(user);
	}

	@Override
	@Transactional
	public User unsubscribe(Long id) {
		return dao.unsubscribe(id);
	}

	@Override
	public User getDetails(Long id) {
		return dao.getDetails(id);
	}

	@Override
	public Role getRole(Long id) {
		return dao.getRole(id);
	}

	@Override
	public UserStatus getUserStatus(Long id) {
		return dao.getUserStatus(id);
	}

	@Override
	public Collection<Competition> getCompetitionList() {
		return dao.getCompetitionList();
	}

	@Override
	public Collection<UserCompetitions> getUserCompetitionList(User user) {
		return dao.getUserCompetitionList(user);
	}

	@Override
	public Competition getCompetitionDetails(Long id) {
		return dao.getCompetitionDetails(id);
	}

	@Override
	public UserCompetitions joinUserCompetition(User user, Competition comp) {
		return dao.joinUserCompetition(user, comp);
	}

	@Override
	@Transactional
	public Competition updateCompetition(Competition comp) {
		return dao.updateCompetition(comp);
	}

}

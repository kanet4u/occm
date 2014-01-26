package com.occm.daos.interfaces;

import java.util.Collection;

import com.occm.models.User;

public interface UserDao {
	
	User register(User user);
	
	User validate(User user);
	
	Collection<User> viewAll();
	
	User update(User user);
	
	User unsubscribe(Long id);
	
	User getDetails(Long id);
	
}

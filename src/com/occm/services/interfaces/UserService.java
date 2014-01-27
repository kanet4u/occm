package com.occm.services.interfaces;

import java.util.Collection;

import com.occm.models.Role;
import com.occm.models.User;
import com.occm.models.UserStatus;

public interface UserService {

	User register(User user);
	
	User validate(User user);
	
	Collection<User> viewAll();
	
	User update(User user);
	
	User unsubscribe(Long id);
	
	User getDetails(Long id);
	
	Role getRole(Long id);

	UserStatus getUserStatus(Long id);
}

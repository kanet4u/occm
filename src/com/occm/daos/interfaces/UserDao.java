package com.occm.daos.interfaces;

import java.util.Collection;

import com.occm.models.Competition;
import com.occm.models.UserCompetitions;
import com.occm.models.UserStatus;
import com.occm.models.Role;
import com.occm.models.User;

public interface UserDao {
	
	User register(User user);
	
	User validate(User user);
	
	Collection<User> viewAll();
	
	User update(User user);
	
	User unsubscribe(Long id);
	
	User getDetails(Long id);

	Role getRole(Long id);

	UserStatus getUserStatus(Long id);

	

	Collection<Competition> getCompetitionList();

	Collection<UserCompetitions> getUserCompetitionList(Long id);
	
}

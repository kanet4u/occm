package com.occm.daos.impl;

import java.util.Collection;

import javax.annotation.PostConstruct;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.occm.daos.interfaces.UserDao;
import com.occm.models.Competition;
import com.occm.models.Page;
import com.occm.models.Problem;
import com.occm.models.Role;
import com.occm.models.Submission;
import com.occm.models.Tag;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.models.UserStatus;

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
		factory.getCurrentSession().flush();
		return user;
	}

	@Override
	public User validate(User user) {
		String hql = "select u from User u where u.email = :em and u.password = :pa";

		user = (User) factory.getCurrentSession().createQuery(hql)
				.setParameter("em", user.getEmail())
				.setParameter("pa", user.getPassword()).uniqueResult();

		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<User> viewAll() {
		String hql = "select u from User u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public User update(User user) {
		// System.out.println("In User Dao : Update : user => ( " + user +
		// " ) ");
		factory.getCurrentSession().update(user);
		factory.getCurrentSession().flush();
		return user;
	}

	@Override
	public User unsubscribe(Long id) {
		Session ref = factory.getCurrentSession();
		System.out.println("In User Dao : Unsubscribe : Session Ref => ( "
				+ ref + " ) ");
		User user = getDetails(id);
		if (user != null) {
			ref.delete(user);
			factory.getCurrentSession().flush();
		} else
			System.out
					.println("In User Dao : Unsubscribe : User Not Found  : ID => ( "
							+ id + " ) ");
		return user;
	}

	@Override
	public User getDetails(Long id) {

		Session ref = factory.getCurrentSession();
		System.out.println("In User Dao : getDetails : Session Ref => ( " + ref
				+ " ) ");
		return (User) ref.get(User.class, id);
	}

	@Override
	public Role getRole(Long id) {

		Session ref = factory.getCurrentSession();
		System.out.println("In User Dao : getRole : Session Ref => ( " + ref
				+ " ) ");
		return (Role) ref.get(Role.class, id);
	}

	@Override
	public UserStatus getUserStatus(Long id) {

		Session ref = factory.getCurrentSession();
		System.out.println("In User Dao : getUserStatus : Session Ref => ( "
				+ ref + " ) ");
		return (UserStatus) ref.get(UserStatus.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Competition> getCompetitionList() {
		String hql = "select u from Competition u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Problem> getProblemList() {
		String hql = "select u from Problem u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Tag> getTagList() {
		String hql = "select u from Tag u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Role> getRoleList() {
		String hql = "select u from Role u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Submission> getSubmissionList() {
		String hql = "select u from Submission u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Page> getPageList() {
		String hql = "select u from Page u";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<UserCompetitions> getUserCompetitionList(User user) {
		String hql = "select u from UserCompetitions u where u.user = :usr and u.approved = 1";

		return factory.getCurrentSession().createQuery(hql)
				.setParameter("usr", user).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<UserCompetitions> getJoinRequestList() {
		String hql = "select u from UserCompetitions u where u.approved = 0";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public Competition getCompetitionDetails(Long id) {
		Session ref = factory.getCurrentSession();
		return (Competition) ref.get(Competition.class, id);
	}

	@Override
	public UserCompetitions joinUserCompetition(User user, Competition comp) {
<<<<<<< HEAD
		UserCompetitions userComp = new UserCompetitions(user, comp, false);
		Long id = (Long) factory.getCurrentSession().save(userComp);
		userComp.setId(id);
		factory.getCurrentSession().flush();
=======
		String hql = "select u from UserCompetitions u where u.user = :user and u.competition = :competition";
		UserCompetitions userComp;
		userComp = (UserCompetitions) factory.getCurrentSession()
				.createQuery(hql).setParameter("user", user)
				.setParameter("competition", comp).uniqueResult();
		if (userComp == null) {
			userComp = new UserCompetitions(user, comp, false);
			Long id = (Long) factory.getCurrentSession().save(userComp);
			userComp.setId(id);
			factory.getCurrentSession().flush();
		}

>>>>>>> branch 'master' of https://github.com/kanet4u/occm
		return userComp;
	}

	@Override
	@Transactional
	public Competition updateCompetition(Competition comp) {
<<<<<<< HEAD
=======
		System.out.println("compe==> " + comp.getTitle());
>>>>>>> branch 'master' of https://github.com/kanet4u/occm
		factory.getCurrentSession().update(comp);
		factory.getCurrentSession().flush();
		return comp;
	}
<<<<<<< HEAD

	@Override
	public boolean deleteCompetition(Long id) {
		Session ref = factory.getCurrentSession();
		Competition comp = getCompetitionDetails(id);
		if (comp != null) {
			ref.delete(comp);
			factory.getCurrentSession().flush();
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Problem getProblemDetails(Long id) {
		Session ref = factory.getCurrentSession();
		return (Problem) ref.get(Problem.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Problem> getProblemList(Competition comp) {
		String hql = "select p from Problem p where p.competition = :comp ";

		return factory.getCurrentSession().createQuery(hql).setParameter("comp", comp).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Problem> getAllProblemList() {
		String hql = "select p from Problem p ";

		return factory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public Problem updateProblem(Problem prob) {
		factory.getCurrentSession().update(prob);
		factory.getCurrentSession().flush();
		return prob;
	}

	@Override
	public boolean deleteProblem(Long id) {
		Session ref = factory.getCurrentSession();
		Problem prob = getProblemDetails(id);
		if (prob != null) {
			ref.delete(prob);
			factory.getCurrentSession().flush();
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Submission addSubmission(Submission submission) {
		Long id = (Long) factory.getCurrentSession().save(submission);
		submission.setId(id);
		factory.getCurrentSession().flush();
		return submission;
	}
=======
>>>>>>> branch 'master' of https://github.com/kanet4u/occm

}

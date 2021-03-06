package com.occm.services.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.occm.daos.interfaces.UserDao;
import com.occm.models.Competition;
import com.occm.models.Language;
import com.occm.models.Page;
import com.occm.models.Problem;
import com.occm.models.Role;
import com.occm.models.Submission;
import com.occm.models.SubmissionStatus;
import com.occm.models.Tag;
import com.occm.models.TestCase;
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
	public Collection<Problem> getProblemList() {
		return dao.getProblemList();
	}

	@Override
	public Collection<Tag> getTagList() {
		return dao.getTagList();
	}
	
	@Override
	public Collection<Role> getRoleList() {
		return dao.getRoleList();
	}
	
	@Override
	public Collection<Submission> getSubmissionList() {
		return dao.getSubmissionList();
	}
	
	@Override
	public Collection<Page> getPageList() {
		return dao.getPageList();
	}
	
	@Override
	public Collection<UserCompetitions> getUserCompetitionList(User user) {
		return dao.getUserCompetitionList(user);
	}

	@Override
	public Collection<UserCompetitions> getJoinRequestList() {
		return dao.getJoinRequestList();
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

	@Override
	public boolean deleteCompetition(Long id) {
		// TODO Auto-generated method stub
		return dao.deleteCompetition(id);
	}

	@Override
	public Collection<Problem> getProblemList(Competition comp) {
		// TODO Auto-generated method stub
		return dao.getProblemList(comp);
	}

	@Override
	public Collection<Problem> getAllProblemList() {
		// TODO Auto-generated method stub
		return dao.getAllProblemList();
	}

	@Override
	public Problem getProblemDetails(Long id) {
		// TODO Auto-generated method stub
		return dao.getProblemDetails(id);
	}

	@Override
	public Problem updateProblem(Problem prob) {
		// TODO Auto-generated method stub
		return dao.updateProblem(prob);
	}

	@Override
	public boolean deleteProblem(Long id) {
		// TODO Auto-generated method stub
		return dao.deleteProblem(id);
	}

	@Override
	public Submission addSubmission(Submission submission) {
		// TODO Auto-generated method stub
		return dao.addSubmission(submission);
	}

	@Override
	public Collection<User> getUserList(String[] ids) {
		// TODO Auto-generated method stub
		return dao.getUserList(ids);
	}

	@Override
	public UserCompetitions isUserJoinedToCompetition(User user, Competition comp) {
		// TODO Auto-generated method stub
		return dao.isUserJoinedToCompetition(user, comp);
	}

	@Override
	public boolean isUserJoinedAndAprovedToCompetition(User user, Competition comp) {
		// TODO Auto-generated method stub
		return dao.isUserJoinedAndApprovedToCompetition(user, comp);
	}

	@Override
	public Collection<UserStatus> getUserStatusList() {
		// TODO Auto-generated method stub
		return dao.getUserStatusList();
	}

	@Override
	public Language getLanguage(Long id) {
		// TODO Auto-generated method stub
		return dao.getLanguage(id);
	}

	@Override
	public Collection<Language> getLanguageList() {
		// TODO Auto-generated method stub
		return dao.getLanguageList();
	}

	@Override
	public Collection<Tag> getTagList(String[] ids) {
		// TODO Auto-generated method stub
		return dao.getTagList(ids);
	}

	@Override
	public Tag getTagDetails(Long id) {
		// TODO Auto-generated method stub
		return dao.getTagDetails(id);
	}

	@Override
	public Collection<Problem> getCompetitionProblemsList(Competition comp) {
		// TODO Auto-generated method stub
		return dao.getCompetitionProblemsList(comp);
	}

	@Override
	public SubmissionStatus getSubmissionStatus(Long id) {
		// TODO Auto-generated method stub
		return dao.getSubmissionStatus(id);
	}

	@Override
	public Problem addProblem(Problem prob) {
		// TODO Auto-generated method stub
		return dao.addProblem(prob);
	}

	@Override
	public Competition addCompetition(Competition comp) {
		// TODO Auto-generated method stub
		return dao.addCompetition(comp);
	}

	
	@Override
	public Collection<TestCase> getTestCaseList() {
		return dao.getTestCaseList();
	}
	
	@Override
	public boolean deleteTestCase(Long id) {
		// TODO Auto-generated method stub
		return dao.deleteTestCase(id);
	}
	
	@Override
	public TestCase getTestCaseDetails(Long id) {
		// TODO Auto-generated method stub
		return dao.getTestCaseDetails(id);
	}
	
	@Override
	public TestCase addTestCase(TestCase test) {
		// TODO Auto-generated method stub
		return dao.addTestCase(test);
	}

	@Override
	public Submission getSubmission(Long id) {
		// TODO Auto-generated method stub
		return dao.getSubmission(id);
	}

}

package com.occm.services.interfaces;

import java.util.Collection;

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

public interface UserService {

	User register(User user);

	User validate(User user);

	Collection<User> viewAll();

	User update(User user);

	User unsubscribe(Long id);

	User getDetails(Long id);

	Role getRole(Long id);
	
	Language getLanguage(Long id);
	
	UserStatus getUserStatus(Long id);

	Collection<Competition> getCompetitionList();

	Collection<Problem> getProblemList();

	Collection<Tag> getTagList();

	Collection<Role> getRoleList();

	Collection<Submission> getSubmissionList();

	Collection<Page> getPageList();

	Collection<UserCompetitions> getUserCompetitionList(User user);

	Competition getCompetitionDetails(Long id);

	UserCompetitions joinUserCompetition(User user, Competition comp);

	Competition updateCompetition(Competition comp);

	Collection<UserCompetitions> getJoinRequestList();

	boolean deleteCompetition(Long id);

	Collection<Problem> getProblemList(Competition comp);

	Collection<Problem> getAllProblemList();

	Problem getProblemDetails(Long id);

	Problem updateProblem(Problem prob);

	boolean deleteProblem(Long id);

	Submission addSubmission(Submission submission);
	
	Collection<User> getUserList(String[] ids);

	UserCompetitions isUserJoinedToCompetition(User user, Competition comp);

	boolean isUserJoinedAndAprovedToCompetition(User user, Competition comp);

	Collection<Language> getLanguageList();

	Collection<UserStatus> getUserStatusList();
	
	Collection<Problem> getCompetitionProblemsList(Competition comp);

	Collection<Tag> getTagList(String[] ids);

	Tag getTagDetails(Long id);
	SubmissionStatus getSubmissionStatus(Long id);

	Problem addProblem(Problem prob);

	Competition addCompetition(Competition comp);
	
	Collection<TestCase> getTestCaseList();
	
	boolean deleteTestCase(Long id);
	
	TestCase getTestCaseDetails(Long id);

	TestCase addTestCase(TestCase test);
	
	Submission getSubmission(Long id);
}

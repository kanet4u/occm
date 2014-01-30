package com.occm.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "submissions")
public class Submission {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="competition_id")
	private Competition competition;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="problem_id")
	private Problem problem;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="language_id")
	private Language language;
	
	@NotNull
	@Column(name="source_code")
	private String sourceCode;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="status")
	private SubmissionStatus status;
	
	@NotNull
	private String path;
	
	private boolean test;
	private String input;
	
	@Column(name="creation_time")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm a")
	private Date creationTime;
	
	@Column(name="updation_time")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm a")
	private Date updationTime;
	
	private String log;
	
	private double runtime;
	
	private int memory;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="failed_test_case")
	private TestCase failedTestCase;
	
	private int score;

	public Submission() {
		super();
	}

	public Submission(Long id, Competition competition, User user,
			Problem problem, Language language, String sourceCode,
			SubmissionStatus status, String path, Date creationTime,
			Date updationTime, String log, double runtime, int memory,
			TestCase failedTestCase, int score) {
		super();
		this.id = id;
		this.competition = competition;
		this.user = user;
		this.problem = problem;
		this.language = language;
		this.sourceCode = sourceCode;
		this.status = status;
		this.path = path;
		this.creationTime = creationTime;
		this.updationTime = updationTime;
		this.log = log;
		this.runtime = runtime;
		this.memory = memory;
		this.failedTestCase = failedTestCase;
		this.score = score;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Competition getCompetition() {
		return competition;
	}

	public void setCompetition(Competition competition) {
		this.competition = competition;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public String getSourceCode() {
		return sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}

	public SubmissionStatus getStatus() {
		return status;
	}

	public void setStatus(SubmissionStatus status) {
		this.status = status;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public Date getUpdationTime() {
		return updationTime;
	}

	public void setUpdationTime(Date updationTime) {
		this.updationTime = updationTime;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public double getRuntime() {
		return runtime;
	}

	public void setRuntime(double runtime) {
		this.runtime = runtime;
	}

	public int getMemory() {
		return memory;
	}

	public void setMemory(int memory) {
		this.memory = memory;
	}

	public TestCase getFailedTestCase() {
		return failedTestCase;
	}

	public void setFailedTestCase(TestCase failedTestCase) {
		this.failedTestCase = failedTestCase;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	
	public boolean isTest() {
		return test;
	}

	public void setTest(boolean test) {
		this.test = test;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	@Override
	public String toString() {
		return "\nSubmission [id=" + id + ", competition=" + competition
				+ ", user=" + user + ", problem=" + problem + ", language="
				+ language + ", sourceCode=" + sourceCode + ", status="
				+ status + ", path=" + path + ", creationTime=" + creationTime
				+ ", updationTime=" + updationTime + ", log=" + log
				+ ", runtime=" + runtime + ", memory=" + memory
				+ ", failedTestCase=" + failedTestCase + ", score=" + score
				+ "]";
	}
	
}

package com.occm.models;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "problems")
public class Problem {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToMany(mappedBy="problems", fetch = FetchType.LAZY)
	private Set<Competition> competitions = new HashSet<Competition>();
	
	@NotNull
	private String title;
	
	@NotNull
	private String details;
	
	@NotNull
	private String input1;
	
	@NotNull
	private String output1;

	@NotNull
	private String input2;
	
	@NotNull
	private String output2;

	private String input3;
	
	private String output3;
	
	@NotNull
	@Column(name="time_limit")
	private int timeLimit;
	
	@NotNull
	@Column(name="memory_limit")
	private int memoryLimit;
	
	@NotNull
	private int level;
	
	@NotNull
	private int score;
	
	@NotNull
	private Date created;
	
	@NotNull
	private String alias;
	
	@NotNull
	private boolean status;
	
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "problem")
	public Set<TestCase> testCases = new HashSet<TestCase>();
	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch= FetchType.LAZY)
    @JoinTable(name="problem_tags", 
                joinColumns={@JoinColumn(name="problem_id")}, 
                inverseJoinColumns={@JoinColumn(name="tag_id")})
	private Set<Tag> tags = new HashSet<Tag>();
	
	@OneToMany(mappedBy = "problem",fetch = FetchType.LAZY)
	public Set<Submission> submissions = new HashSet<Submission>();

	public Problem() {
		super();
	}

	public Problem(Long id, Set<Competition> competitions, String title,
			String details, String input1, String output1, String input2,
			String output2, String input3, String output3, int timeLimit,
			int memoryLimit, int level, int score, Set<TestCase> testCases,
			Set<Tag> tags, Set<Submission> submissions) {
		super();
		this.id = id;
		this.competitions = competitions;
		this.title = title;
		this.details = details;
		this.input1 = input1;
		this.output1 = output1;
		this.input2 = input2;
		this.output2 = output2;
		this.input3 = input3;
		this.output3 = output3;
		this.timeLimit = timeLimit;
		this.memoryLimit = memoryLimit;
		this.level = level;
		this.score = score;
		this.testCases = testCases;
		this.tags = tags;
		this.submissions = submissions;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<Competition> getCompetitions() {
		return competitions;
	}

	public void setCompetitions(Set<Competition> competitions) {
		this.competitions = competitions;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getInput1() {
		return input1;
	}

	public void setInput1(String input1) {
		this.input1 = input1;
	}

	public String getOutput1() {
		return output1;
	}

	public void setOutput1(String output1) {
		this.output1 = output1;
	}

	public String getInput2() {
		return input2;
	}

	public void setInput2(String input2) {
		this.input2 = input2;
	}

	public String getOutput2() {
		return output2;
	}

	public void setOutput2(String output2) {
		this.output2 = output2;
	}

	public String getInput3() {
		return input3;
	}

	public void setInput3(String input3) {
		this.input3 = input3;
	}

	public String getOutput3() {
		return output3;
	}

	public void setOutput3(String output3) {
		this.output3 = output3;
	}

	public int getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(int timeLimit) {
		this.timeLimit = timeLimit;
	}

	public int getMemoryLimit() {
		return memoryLimit;
	}

	public void setMemoryLimit(int memoryLimit) {
		this.memoryLimit = memoryLimit;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Set<TestCase> getTestCases() {
		return testCases;
	}

	public void setTestCases(Set<TestCase> testCases) {
		this.testCases = testCases;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public Set<Submission> getSubmissions() {
		return submissions;
	}

	public void setSubmissions(Set<Submission> submissions) {
		this.submissions = submissions;
	}

	@Override
	public String toString() {
		return "\nProblem [id=" + id + ", competitions=" + competitions
				+ ", title=" + title + ", details=" + details + ", input1="
				+ input1 + ", output1=" + output1 + ", input2=" + input2
				+ ", output2=" + output2 + ", input3=" + input3 + ", output3="
				+ output3 + ", timeLimit=" + timeLimit + ", memoryLimit="
				+ memoryLimit + ", level=" + level + ", score=" + score
				+ ", testCases=" + testCases + ", tags=" + tags
				+ ", submissions=" + submissions + "]";
	}
	
}

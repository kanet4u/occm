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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "competitions")
public class Competition {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String title;
	
	@NotNull
	private String details;
	
	@NotNull
	private String url;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	
	@NotNull
	@Column(name="is_limited")
	private boolean isLimited;
	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch= FetchType.LAZY)
    @JoinTable(name="competition_problems", 
                joinColumns={@JoinColumn(name="competition_id")}, 
                inverseJoinColumns={@JoinColumn(name="problem_id")})
	private Set<Problem> problems = new HashSet<Problem>();
	
	@ManyToMany(mappedBy="competitions", fetch = FetchType.LAZY)
	private Set<User> users = new HashSet<User>();

	public Competition() {
		super();
	}

	public Competition(Long id, String title, String details, String url,
			Date startTime, Date endTime, boolean isLimited,
			Set<Problem> problems, Set<User> users) {
		super();
		this.id = id;
		this.title = title;
		this.details = details;
		this.url = url;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isLimited = isLimited;
		this.problems = problems;
		this.users = users;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public boolean isLimited() {
		return isLimited;
	}

	public void setLimited(boolean isLimited) {
		this.isLimited = isLimited;
	}

	public Set<Problem> getProblems() {
		return problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "\nCompetition [id=" + id + ", title=" + title + ", details="
				+ details + ", url=" + url + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", isLimited=" + isLimited
				+ ", problems=" + problems + ", users=" + users + "]";
	}

}
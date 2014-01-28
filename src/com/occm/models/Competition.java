package com.occm.models;

import java.sql.Timestamp;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
	
	
	@Column(name="start_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startTime;
	
	@Column(name="end_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endTime;
	
	@Column(name="duration")
	private double duration;
	
	@NotNull
	@Column(name="is_limited")
	private boolean isLimited;
	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch= FetchType.LAZY)
    @JoinTable(name="competition_problems", 
                joinColumns={@JoinColumn(name="competition_id")}, 
                inverseJoinColumns={@JoinColumn(name="problem_id")})
	private Set<Problem> problems = new HashSet<Problem>();
	
	@ManyToMany(mappedBy="competitions", fetch = FetchType.EAGER)
	private Set<User> users = new HashSet<User>();

	public Competition() {
		super();
	}

	public Competition(Long id, String title, String details,
			Date startTime, Date endTime, boolean isLimited,
			Set<Problem> problems, Set<User> users) {
		super();
		this.id = id;
		this.title = title;
		this.details = details;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isLimited = isLimited;
		this.problems = problems;
		/*this.users = users;*/
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
	public boolean getIsLimited() {
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
				+ details  + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", isLimited=" + isLimited
				+ ", problems=" + problems  ;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

}

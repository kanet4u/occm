package com.occm.models;

import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "competitions")
public class Competition implements Comparable<Competition> {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotNull
	private String title;

	@NotNull
	private String details;

	@Column(name = "start_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startTime;

	@Column(name = "end_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endTime;

	@Column(name = "duration")
	private String duration;

	@NotNull
	@Column(name = "is_limited")
	private boolean isLimited;

	@Transient
	private String status;

	@Transient
	private int userCount;

	@Transient
	private int problemCount;

	@Transient
	private String timeLeft;

	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	@JoinTable(name = "competition_problems", joinColumns = { @JoinColumn(name = "competition_id") }, inverseJoinColumns = { @JoinColumn(name = "problem_id") })
	private Set<Problem> problems = new HashSet<Problem>();

	@ManyToMany(mappedBy = "competitions", fetch = FetchType.EAGER)
	private Set<User> users = new HashSet<User>();

	public Competition() {
		super();
	}

	public Competition(Long id, String title, String details, Date startTime,
			Date endTime, boolean isLimited, Set<Problem> problems,
			Set<User> users) {
		super();
		this.id = id;
		this.title = title;
		this.details = details;
		this.startTime = startTime;
		this.endTime = endTime;
		this.isLimited = isLimited;
		this.problems = problems;
		/* this.users = users; */
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
				+ details + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", isLimited=" + isLimited + ", problems=" + problems;
	}

	public String getDuration() {

		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public void setDuration() {
		if (endTime != null && startTime != null) {
			long duration = this.getEndTime().getTime()
					- this.getStartTime().getTime();

			long diffHours = TimeUnit.MILLISECONDS.toHours(duration);
			long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(duration
					- TimeUnit.HOURS.toMillis(diffHours));
			long diffSeconds = TimeUnit.MILLISECONDS.toSeconds(duration
					- TimeUnit.MINUTES.toMillis(diffMinutes)
					- TimeUnit.HOURS.toMillis(diffHours));

			this.duration = "" + diffHours + " : " + diffMinutes + " : "
					+ diffSeconds;
		}
		else{
			duration = "";
		}
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(Date current) {
		if (this.isLimited()) {
			if (current.compareTo(this.getStartTime()) >= 0
					&& current.compareTo(this.getEndTime()) <= 0) {
				status = "RUNNING";
				long duration = this.getEndTime().getTime() - current.getTime();

				long diffHours = TimeUnit.MILLISECONDS.toHours(duration);
				long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(duration
						- TimeUnit.HOURS.toMillis(diffHours));
				long diffSeconds = TimeUnit.MILLISECONDS.toSeconds(duration
						- TimeUnit.MINUTES.toMillis(diffMinutes)
						- TimeUnit.HOURS.toMillis(diffHours));

				this.timeLeft = "" + diffHours + " : " + diffMinutes + " : "
						+ diffSeconds;
			} else if (current.compareTo(this.getStartTime()) < 0) {
				status = "UPCOMMING";
			} else if (current.compareTo(this.getEndTime()) > 0) {
				status = "ARCHIEVED";
			}

		} else {
			status = "NEVERENDING";
		}
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public int getProblemCount() {
		return problemCount;
	}

	public void setProblemCount(int problemCount) {
		this.problemCount = problemCount;
	}

	public String getTimeLeft() {
		return timeLeft;
	}

	public void setTimeLeft(String timeLeft) {
		this.timeLeft = timeLeft;
	}

	@Override
	public int compareTo(Competition comp) {
		return (int) (this.id - comp.id);
	}

	public static Comparator<Competition> CompetitionStatusComparator = new Comparator<Competition>() {

		public int compare(Competition comp1, Competition comp2) {

			String stat1 = comp1.getStatus().toUpperCase();
			String stat2 = comp2.getStatus().toUpperCase();

			if (stat1.equals(stat2)) {
				return 0;
			}
			if (stat1.equals("RUNNING")) {
				return -1;
			}
			if (stat2.equals("RUNNING")) {
				return 1;
			}
			if (stat1.equals("UPCOMMING")) {
				return -1;
			}
			if (stat2.equals("UPCOMMING")) {
				return 1;
			}
			if (stat1.equals("NEVERENDING")) {
				return -1;
			}
			if (stat2.equals("NEVERENDING")) {
				return 1;
			} else {
				return 0;
			}
		}

	};

}

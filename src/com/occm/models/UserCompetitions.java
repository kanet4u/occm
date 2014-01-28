package com.occm.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;



@Entity
@Table(name = "user_competitions")
public class UserCompetitions {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL, fetch= FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL, fetch= FetchType.LAZY)
	@JoinColumn(name="competition_id")
	private Competition competition;
	
	@NotNull
	private boolean approved;

	public UserCompetitions(User user, Competition competition, boolean approved) {
		super();
		this.user = user;
		this.competition = competition;
		this.approved = approved;
	}

	public UserCompetitions() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Competition getCompetition() {
		return competition;
	}

	public void setCompetition(Competition competition) {
		this.competition = competition;
	}

	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	@Override
	public String toString() {
		return "UserCompetitions [user=" + user + ", competition="
				+ competition + ", approved=" + approved + "]";
	}
}

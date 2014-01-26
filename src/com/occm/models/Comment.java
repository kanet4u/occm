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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "comments")
public class Comment {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="parent_comment_id")
	private Comment parentComment;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="problem_id")
	private Problem problem;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	@NotNull
	private String comment;
	
	@NotNull
	@Column(name = "posted_at")
	private Date postedAt;
	
	@NotNull
	private boolean show;
	
	@NotNull
	private int rating;

	public Comment() {
		super();
	}

	public Comment(Long id, Comment parentComment, Problem problem, User user,
			String comment, Date postedAt, boolean show, int rating) {
		super();
		this.id = id;
		this.parentComment = parentComment;
		this.problem = problem;
		this.user = user;
		this.comment = comment;
		this.postedAt = postedAt;
		this.show = show;
		this.rating = rating;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Comment getParentComment() {
		return parentComment;
	}

	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}

	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(Date postedAt) {
		this.postedAt = postedAt;
	}

	public boolean isShow() {
		return show;
	}

	public void setShow(boolean show) {
		this.show = show;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "\nComment [id=" + id + ", parentComment=" + parentComment
				+ ", problem=" + problem + ", user=" + user + ", comment="
				+ comment + ", postedAt=" + postedAt + ", show=" + show
				+ ", rating=" + rating + "]";
	}
	
	
}

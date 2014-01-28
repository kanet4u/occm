package com.occm.models;

public class CompetitionListDetails {
	private String status;
	private int userCount;
	private int problemCount;
	private String timeLeft;
	
	public CompetitionListDetails(String status, int userCount,
			int problemCount, String timeLeft) {
		super();
		this.status = status;
		this.userCount = userCount;
		this.problemCount = problemCount;
		this.timeLeft = timeLeft;
	}
	public String getStatus() {
		return status;
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
}

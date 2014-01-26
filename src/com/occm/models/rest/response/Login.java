package com.occm.models.rest.response;

public class Login {
	
	private Long userId;
	
	private String userEmail;
	
	private String userFName;
	
	private String userSName;
	
	private String userPassword;
	
	private String result;
	
	private String message;

	public Login() {
		
	}

	

	public Login(Long userId, String userEmail, String userFName,
			String userSName, String userPassword, String result) {
		super();
		this.userId = userId;
		this.setUserEmail(userEmail);
		this.userFName = userFName;
		this.userSName = userSName;
		this.userPassword = userPassword;
		this.result = result;
	}



	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserFName() {
		return userFName;
	}

	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}

	public String getUserSName() {
		return userSName;
	}

	public void setUserSName(String userSName) {
		this.userSName = userSName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}
	
	
}

package com.occm.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "user_status")
public class UserStatus {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String status;
	
	@OneToMany(mappedBy = "status", fetch = FetchType.LAZY)
	private Set<User> users = new HashSet<User>();

	public UserStatus() {
		super();
	}
	

	public UserStatus(Long id, String status) {
		super();
		this.id = id;
		this.status = status;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	/*
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
*/
	@Override
	public String toString() {
		return "\nUserStatus [id=" + id + ", status=" + status + "]";
	}

	public boolean isActive(){
		return status.equals("active");
	}
}

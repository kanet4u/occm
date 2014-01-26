package com.occm.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.occm.models.Role;
import com.occm.models.UserStatus;

@Entity
@Table(name = "users")
public class User {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String email;
	
	@NotNull
	private String password;
	
	@NotNull
	private String fname;
	
	@NotNull
	private String sname;
	
	
	@ManyToOne(cascade=CascadeType.ALL, fetch= FetchType.LAZY)
	@JoinColumn(name="status")
	private UserStatus status;
	
	@NotNull
	private String image;
	
	
	@ManyToOne(cascade=CascadeType.ALL, fetch= FetchType.LAZY)
	@JoinColumn(name="role")
	private Role role;

	@ManyToMany(cascade = {CascadeType.ALL}, fetch=FetchType.LAZY)
    @JoinTable(name="user_competitions", 
                joinColumns={@JoinColumn(name="user_id")}, 
                inverseJoinColumns={@JoinColumn(name="competition_id")})
	private Set<Competition> competitions = new HashSet<Competition>();
	
	@OneToMany(mappedBy = "user", fetch=FetchType.LAZY)
	private Set<Submission> submissions = new HashSet<Submission>();

	public User() {
		super();
	}
	
	

	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}



	public User(Long id, String email, String password, String fname,
			String sname, UserStatus status, String image, Role role) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.sname = sname;
		this.status = status;
		this.image = image;
		this.role = role;
	}


/*
	public User(Long id, String email, String password, String fname,
			String sname, UserStatus status, String image, Role role,
			Set<Competition> competitions, Set<Submission> submissions) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.sname = sname;
		this.status = status;
		this.image = image;
		this.role = role;
		this.competitions = competitions;
		this.submissions = submissions;
	} */

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Competition> getCompetitions() {
		return competitions;
	}

	public void setCompetitions(Set<Competition> competitions) {
		this.competitions = competitions;
	}

	public Set<Submission> getSubmissions() {
		return submissions;
	}

	public void setSubmissions(Set<Submission> submissions) {
		this.submissions = submissions;
	}

	@Override
	public String toString() {
		return "\nUser [id=" + id + ", email=" + email + ", password=" + password
				+ ", fname=" + fname + ", sname=" + sname + ", status="
				+ status + ", image=" + image + ", role=" + role
				+ ", competitions=" + competitions + ", submissions="
				+ submissions + "]";
	}

	
	
}


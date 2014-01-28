package com.occm.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "actions")
public class Action {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String action;
	
	@NotNull
	private String title;

	
	//@ManyToMany(mappedBy="actions", fetch = FetchType.LAZY)
	//private Set<Role> roles = new HashSet<Role>();

	//private Collection<Role> roles = new ArrayList<Role>();
	public Action() {
		
	}
	

	public Action(Long id, String action, String title) {
		super();
		this.id = id;
		this.action = action;
		this.title = title;
	}

	@Override
	public String toString() {
		return "\nAction [id=" + id + ", action=" + action + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	
	/*public Set<Role> getRoles() {
		return roles;
	}

	public void setRolesList(Set<Role> roles) {
		this.roles = roles;
	}*/
	
	
}

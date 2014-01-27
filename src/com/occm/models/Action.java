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
	
	//@ManyToMany(mappedBy="actions", fetch = FetchType.LAZY)
	//private Set<Role> roles = new HashSet<Role>();

	//private Collection<Role> roles = new ArrayList<Role>();
	public Action() {
		
	}
	

	public Action(Long id, String action) {
		super();
		this.id = id;
		this.action = action;
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

	/*public Set<Role> getRoles() {
		return roles;
	}

	public void setRolesList(Set<Role> roles) {
		this.roles = roles;
	}*/
	
	
}

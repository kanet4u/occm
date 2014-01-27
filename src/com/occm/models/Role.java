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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "roles")
public class Role {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String role;
	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch= FetchType.EAGER)
    @JoinTable(name="role_actions", 
                joinColumns={@JoinColumn(name="role_id")}, 
                inverseJoinColumns={@JoinColumn(name="action_id")})
	private Set<Action> actions = new HashSet<Action>();
    //private Collection<Action> actions = new ArrayList<Action>();

	public Role() {
		
	}
	
	

	public Role(Long id, String role) {
		super();
		this.id = id;
		this.role = role;
	}



	public Role(Long id, String role, Set<Action> actions) {
		super();
		this.id = id;
		this.role = role;
		this.actions = actions;
	}

	@Override
	public String toString() {
		return "\nRole [id=" + id + ", role=" + role + ", actions=" + actions
				+ "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public Set<Action> getActions() {
		return actions;
	}

	public void setActions(Set<Action> actions) {
		this.actions = actions;
	}
	
	
}

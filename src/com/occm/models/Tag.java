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
@Table(name = "tags")
public class Tag {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String tag;
	
	@ManyToMany(mappedBy="tags", fetch = FetchType.LAZY)
	private Set<Problem> problems = new HashSet<Problem>();

	public Tag() {
		super();
	}

	public Tag(Long id, String tag) {
		super();
		this.id = id;
		this.tag = tag;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Set<Problem> getProblems() {
		return problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

	@Override
	public String toString() {
		return tag;
	}
	
	
}

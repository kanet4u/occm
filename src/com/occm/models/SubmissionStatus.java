package com.occm.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "submission_status")
public class SubmissionStatus {
	
	@Id
	private String code;
	
	@NotNull
	private String name;

	public SubmissionStatus() {
		super();
	}

	public SubmissionStatus(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "\nSubmissionStatus [code=" + code + ", name=" + name + "]";
	}
	
}

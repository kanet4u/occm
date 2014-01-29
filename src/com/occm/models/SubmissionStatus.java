package com.occm.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "submission_status")
public class SubmissionStatus {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long code;
	
	@NotNull
	private String name;

	@NotNull
	private String alias;
	
	@NotNull
	private String severity;
	
	public SubmissionStatus() {
		super();
	}

	public SubmissionStatus(Long code, String name, String alias, String severity) {
		super();
		this.code = code;
		this.name = name;
		this.alias = alias;
		this.severity = severity;
	}

	public Long getCode() {
		return code;
	}

	public void setCode(Long code) {
		this.code = code;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	
	public String getSeverity() {
		return severity;
	}

	public void setSeverity(String severity) {
		this.severity = severity;
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

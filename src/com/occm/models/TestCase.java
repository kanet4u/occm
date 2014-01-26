package com.occm.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "testcases")
public class TestCase {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="problem_id")
	private Problem problem;
	
	@NotNull
	private String input;
	
	@NotNull
	private String output;

	public TestCase() {
		super();
	}

	public TestCase(Long id, Problem problem, String input, String output) {
		super();
		this.id = id;
		this.problem = problem;
		this.input = input;
		this.output = output;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	@Override
	public String toString() {
		return "\nTestCase [id=" + id + ", problem=" + problem + ", input="
				+ input + ", output=" + output + "]";
	}
	
}

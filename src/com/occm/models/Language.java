package com.occm.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "languages")
public class Language {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String code;
	
	@NotNull
	private String name;
	
	private String home;
	
	private String options;

	private String path;

	public Language() {
		super();
	}

	public Language(Long id, String code, String name, String home,
			String options, String path) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.home = home;
		this.options = options;
		this.path = path;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "\nLanguage [id=" + id + ", code=" + code + ", name=" + name
				+ ", home=" + home + ", options=" + options + ", path=" + path
				+ "]";
	}


}

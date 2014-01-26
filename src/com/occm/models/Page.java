package com.occm.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "pages")
public class Page {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotNull
	private String title;
	
	@NotNull
	private String url;
	
	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name="type", length = 4)
	private PageType type;
	
	@NotNull
	private String content;
	
	@NotNull
	private Date created;
	
	@NotNull
	private Date updated;
	
	@NotNull
	private boolean status;
	
	public Page() {
		super();
	}

	public Page(Long id, String title, String url, PageType type,
			String content, Date created, Date updated, boolean status) {
		super();
		this.id = id;
		this.title = title;
		this.url = url;
		this.type = type;
		this.content = content;
		this.created = created;
		this.updated = updated;
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public PageType getType() {
		return type;
	}

	public void setType(PageType type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "\nPage [id=" + id + ", title=" + title + ", url=" + url
				+ ", type=" + type + ", content=" + content + ", created="
				+ created + ", updated=" + updated + ", status=" + status + "]";
	}
	
	
	
}


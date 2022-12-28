package com.anabada.web.vo;

import java.util.Date;

public class QnaVO {

	private int q_no;
	private String id;
	private String email;
	private String q_title;
	private String q_content;
	private Date q_date;
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	
	@Override
	public String toString() {
		return "QnaVO [q_no=" + q_no + ", id=" + id + ", email=" + email + ", q_title=" + q_title + ", q_content="
				+ q_content + ", q_date=" + q_date + "]";
	}
	
}

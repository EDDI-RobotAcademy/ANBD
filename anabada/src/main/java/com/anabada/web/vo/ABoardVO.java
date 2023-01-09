package com.anabada.web.vo;

import java.util.Date;

public class ABoardVO {
	
	private int a_bno;
	private String a_title;
	private String a_content;
	private String a_image;
	private Date a_regdate;
	private int a_like_cnt;
	private int a_cnt;
	private String a_type;
	private String id;
	
	public int getA_bno() {
		return a_bno;
	}
	public void setA_bno(int a_bno) {
		this.a_bno = a_bno;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_image() {
		return a_image;
	}
	public void setA_image(String a_image) {
		this.a_image = a_image;
	}
	public Date getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	public int getA_like_cnt() {
		return a_like_cnt;
	}
	public void setA_like_cnt(int a_like_cnt) {
		this.a_like_cnt = a_like_cnt;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public String getA_type() {
		return a_type;
	}
	public void setA_type(String a_type) {
		this.a_type = a_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "BoardVO [a_bno=" + a_bno + ", a_title=" + a_title + ", a_content=" + a_content + ", a_image=" + a_image
				+ ", a_regdate=" + a_regdate + ", a_like_cnt=" + a_like_cnt + ", a_cnt=" + a_cnt + ", a_type=" + a_type
				+ ", id=" + id + "]";
	}
	
}

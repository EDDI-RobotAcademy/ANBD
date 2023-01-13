package com.anabada.web.vo;

public class HelpVO {
	
	private int h_no;
	private String id;
	private String h_title;
	private String h_content;
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String h_content) {
		this.h_content = h_content;
	}
	
	@Override
	public String toString() {
		return "HelpVO [h_no=" + h_no + ", id=" + id + ", h_title=" + h_title + ", h_content=" + h_content + "]";
	}
	
}

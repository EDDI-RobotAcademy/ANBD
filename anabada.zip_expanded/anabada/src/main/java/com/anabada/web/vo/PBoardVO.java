package com.anabada.web.vo;

import java.util.Date;

public class PBoardVO {

	private int pno;
	private String p_title;
	private int p_cost;
	private String p_type;
	private String p_con;
	private String sell_a;
	private String sell_b;
	private String p_content;
	private Date p_regdate;
	private int p_file;
	private int p_count;
	private int p_heart;
	private String id;
	private String p_local;
	private String p_filepath;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_cost() {
		return p_cost;
	}
	public void setP_cost(int p_cost) {
		this.p_cost = p_cost;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_con() {
		return p_con;
	}
	public void setP_con(String p_con) {
		this.p_con = p_con;
	}
	public String getSell_a() {
		return sell_a;
	}
	public void setSell_a(String sell_a) {
		this.sell_a = sell_a;
	}
	public String getSell_b() {
		return sell_b;
	}
	public void setSell_b(String sell_b) {
		this.sell_b = sell_b;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getP_file() {
		return p_file;
	}
	public void setP_file(int p_file) {
		this.p_file = p_file;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public int getP_heart() {
		return p_heart;
	}
	public void setP_heart(int p_heart) {
		this.p_heart = p_heart;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getP_local() {
		return p_local;
	}
	public void setP_local(String p_local) {
		this.p_local = p_local;
	}
	public String getP_filepath() {
		return p_filepath;
	}
	public void setP_filepath(String p_filepath) {
		this.p_filepath = p_filepath;
	}
	@Override
	public String toString() {
		return "PBoardVO [pno=" + pno + ", p_title=" + p_title + ", p_cost=" + p_cost + ", p_type=" + p_type
				+ ", p_con=" + p_con + ", sell_a=" + sell_a + ", sell_b=" + sell_b + ", p_content=" + p_content
				+ ", p_regdate=" + p_regdate + ", p_file=" + p_file + ", p_count=" + p_count + ", p_heart=" + p_heart
				+ ", id=" + id + ", p_local=" + p_local + ", p_filepath=" + p_filepath + "]";
	}
	
	

}

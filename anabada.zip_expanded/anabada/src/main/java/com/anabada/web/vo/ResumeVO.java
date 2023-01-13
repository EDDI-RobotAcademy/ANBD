package com.anabada.web.vo;

import java.sql.Date;

public class ResumeVO {
	
	private String id;
	private int r_bno;
	private String r_name;
	private String r_gender;
	private String r_tel;
	private String r_age;
	private String r_company;
	private String r_start;
	private String r_end;
	private Date r_date;
	private int j_bno;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getR_bno() {
		return r_bno;
	}
	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_gender() {
		return r_gender;
	}
	public void setR_gender(String r_gender) {
		this.r_gender = r_gender;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	public String getR_age() {
		return r_age;
	}
	public void setR_age(String r_age) {
		this.r_age = r_age;
	}
	public String getR_company() {
		return r_company;
	}
	public void setR_company(String r_company) {
		this.r_company = r_company;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public String getR_end() {
		return r_end;
	}
	public void setR_end(String r_end) {
		this.r_end = r_end;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getJ_bno() {
		return j_bno;
	}
	public void setJ_bno(int j_bno) {
		this.j_bno = j_bno;
	}
	@Override
	public String toString() {
		return "ResumeVO [id=" + id + ", r_bno=" + r_bno + ", r_name=" + r_name + ", r_gender=" + r_gender + ", r_tel="
				+ r_tel + ", r_age=" + r_age + ", r_company=" + r_company + ", r_start=" + r_start + ", r_end=" + r_end
				+ ", r_date=" + r_date + ", j_bno=" + j_bno + "]";
	}
	
	
	
	
	
	

}

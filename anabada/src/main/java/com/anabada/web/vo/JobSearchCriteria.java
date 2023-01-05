package com.anabada.web.vo;

public class JobSearchCriteria extends JobCriteria{

	private String j_addr1 = "전국";
	private String j_cate = "모두";
	private String j_day = "모두";
	private String j_term = "모두";
	
	public String getJ_addr1() {
		return j_addr1;
	}
	public void setJ_addr1(String j_addr1) {
		this.j_addr1 = j_addr1;
	}
	public String getJ_cate() {
		return j_cate;
	}
	public void setJ_cate(String j_cate) {
		this.j_cate = j_cate;
	}
	public String getJ_day() {
		return j_day;
	}
	public void setJ_day(String j_day) {
		this.j_day = j_day;
	}
	public String getJ_term() {
		return j_term;
	}
	public void setJ_term(String j_term) {
		this.j_term = j_term;
	}
	
	@Override
	public String toString() {
		return "JobSearchCriteria [j_addr1=" + j_addr1 + ", j_cate=" + j_cate + ", j_day=" + j_day + ", j_term="
				+ j_term + "]";
	}
	
	
	
	
	
}

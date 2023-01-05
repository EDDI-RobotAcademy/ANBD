package com.anabada.web.vo;

import java.sql.Date;

public class ReviewVO {

	private int pno;
	private String r_seller;
	private String r_consumer;
	private double r_score;
	private String r_content;
	private Date r_date;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getR_seller() {
		return r_seller;
	}
	public void setR_seller(String r_seller) {
		this.r_seller = r_seller;
	}
	public String getR_consumer() {
		return r_consumer;
	}
	public void setR_consumer(String r_consumer) {
		this.r_consumer = r_consumer;
	}
	public double getR_score() {
		return r_score;
	}
	public void setR_score(double r_score) {
		this.r_score = r_score;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [pno=" + pno + ", r_seller=" + r_seller + ", r_consumer=" + r_consumer + ", r_score=" + r_score
				+ ", r_content=" + r_content + ", r_date=" + r_date + "]";
	} 
	
	
}

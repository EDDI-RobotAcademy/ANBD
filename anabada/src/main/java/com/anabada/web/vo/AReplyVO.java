package com.anabada.web.vo;

import java.util.Date;

public class AReplyVO {
	
	private int a_bno;
	private int r_rno;
	private String r_content;
	private Date r_regdate;
	private String id;
	
	public int getA_bno() {
		return a_bno;
	}
	public void setA_bno(int a_bno) {
		this.a_bno = a_bno;
	}
	public int getR_rno() {
		return r_rno;
	}
	public void setR_rno(int r_rno) {
		this.r_rno = r_rno;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AReplyVO [a_bno=" + a_bno + ", r_rno=" + r_rno + ", r_content=" + r_content + ", r_regdate=" + r_regdate
				+ ", id=" + id + "]";
	}
	
}

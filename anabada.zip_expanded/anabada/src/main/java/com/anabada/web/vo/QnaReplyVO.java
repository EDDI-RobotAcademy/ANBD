package com.anabada.web.vo;

import java.util.Date;

public class QnaReplyVO {

	private int q_no;
	private int qr_no;
	private String id;
	private String qr_content;
	private Date qr_date;
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public int getQr_no() {
		return qr_no;
	}
	public void setQr_no(int qr_no) {
		this.qr_no = qr_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQr_content() {
		return qr_content;
	}
	public void setQr_content(String qr_content) {
		this.qr_content = qr_content;
	}
	public Date getQr_date() {
		return qr_date;
	}
	public void setQr_date(Date qr_date) {
		this.qr_date = qr_date;
	}
	
	@Override
	public String toString() {
		return "QnaReplyVO [q_no=" + q_no + ", qr_no=" + qr_no + ", id=" + id + ", qr_content=" + qr_content
				+ ", qr_date=" + qr_date + "]";
	}
	
	
	
}

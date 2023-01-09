package com.anabada.web.vo;

public class ALikeVO {
	
	private int like_no;
	private int like_chk;
	private String id;
	private int a_bno;
	
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getLike_chk() {
		return like_chk;
	}
	public void setLike_chk(int like_chk) {
		this.like_chk = like_chk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getA_bno() {
		return a_bno;
	}
	public void setA_bno(int a_bno) {
		this.a_bno = a_bno;
	}
	
	@Override
	public String toString() {
		return "ALikeVO [like_no=" + like_no + ", like_chk=" + like_chk + ", id=" + id + ", a_bno=" + a_bno + "]";
	}
}

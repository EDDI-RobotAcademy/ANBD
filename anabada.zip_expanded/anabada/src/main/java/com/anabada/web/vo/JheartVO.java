package com.anabada.web.vo;

public class JheartVO {

	private String id;
	private int h_bno;
	private int j_bno;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public int getH_bno() {
		return h_bno;
	}


	public void setH_bno(int h_bno) {
		this.h_bno = h_bno;
	}


	public int getJ_bno() {
		return j_bno;
	}


	public void setJ_bno(int j_bno) {
		this.j_bno = j_bno;
	}



	@Override
	public String toString() {
		return "JheartVO [id=" + id + ", h_bno=" + h_bno + ", j_bno=" + j_bno + "]";
	}
	
	
	
	
}

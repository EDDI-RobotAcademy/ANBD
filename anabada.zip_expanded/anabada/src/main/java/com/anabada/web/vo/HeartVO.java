package com.anabada.web.vo;

public class HeartVO {
	private int pno;
	private String id;
	private String h_filePath;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getH_filePath() {
		return h_filePath;
	}
	public void setH_filePath(String h_filePath) {
		this.h_filePath = h_filePath;
	}
	@Override
	public String toString() {
		return "HeartVO [pno=" + pno + ", id=" + id + ", h_filePath=" + h_filePath + "]";
	}
	
	
	

}

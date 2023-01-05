package com.anabada.web.vo;

public class SimilerVO {
	
	private String s_title ; 
	private String s_filePath ;
	private int s_pno;
	private String s_p_type;
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_filePath() {
		return s_filePath;
	}
	public void setS_filePath(String s_filePath) {
		this.s_filePath = s_filePath;
	}
	public int getS_pno() {
		return s_pno;
	}
	public void setS_pno(int s_pno) {
		this.s_pno = s_pno;
	}
	public String getS_p_type() {
		return s_p_type;
	}
	public void setS_p_type(String s_p_type) {
		this.s_p_type = s_p_type;
	}
	@Override
	public String toString() {
		return "SimilerVO [s_title=" + s_title + ", s_filePath=" + s_filePath + ", s_pno=" + s_pno + ", s_p_type="
				+ s_p_type + "]";
	}

	

}

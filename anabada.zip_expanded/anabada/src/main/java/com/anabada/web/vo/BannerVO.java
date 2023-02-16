package com.anabada.web.vo;

public class BannerVO {

	private int a_no;
	private String a_file;
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_file() {
		return a_file;
	}
	public void setA_file(String a_file) {
		this.a_file = a_file;
	}
	
	@Override
	public String toString() {
		return "BannerVO [a_no=" + a_no + ", a_file=" + a_file + "]";
	}
	
}

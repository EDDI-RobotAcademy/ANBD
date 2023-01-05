package com.anabada.web.vo;

public class PfileVO {
	
	private int fno;
	private int ftotal;
	private String filepath;
	private int pno;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getFtotal() {
		return ftotal;
	}
	public void setFtotal(int ftotal) {
		this.ftotal = ftotal;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	@Override
	public String toString() {
		return "PfileVO [fno=" + fno + ", ftotal=" + ftotal + ", filepath=" + filepath + ", pno=" + pno + "]";
	}
	
	
	

}

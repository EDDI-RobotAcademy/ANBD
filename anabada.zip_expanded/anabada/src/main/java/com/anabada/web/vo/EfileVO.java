package com.anabada.web.vo;

public class EfileVO {
	private int efno;
	private String filepath;
	private String id ;
	public int getEfno() {
		return efno;
	}
	public void setEfno(int efno) {
		this.efno = efno;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "EfileVO [efno=" + efno + ", filepath=" + filepath + ", id=" + id + "]";
	}

}

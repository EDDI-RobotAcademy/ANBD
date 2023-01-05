package com.anabada.web.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class EventBoardVO {
	private int eno;
	private String e_title;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String e_date;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String e_start;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String e_end;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String e_win;
	private String e_type;
	private String e_content;
	private int e_total;
	private int e_count;
	private String id;
	private String e_filePath;
	private String e_winner;
	
	public String getE_winner() {
		return e_winner;
	}
	public void setE_winner(String e_winner) {
		this.e_winner = e_winner;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getE_start() {
		return e_start;
	}
	public void setE_start(String e_start) {
		this.e_start = e_start;
	}
	public String getE_end() {
		return e_end;
	}
	public void setE_end(String e_end) {
		this.e_end = e_end;
	}
	public String getE_win() {
		return e_win;
	}
	public void setE_win(String e_win) {
		this.e_win = e_win;
	}
	public String getE_type() {
		return e_type;
	}
	public void setE_type(String e_type) {
		this.e_type = e_type;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public int getE_total() {
		return e_total;
	}
	public void setE_total(int e_total) {
		this.e_total = e_total;
	}
	public int getE_count() {
		return e_count;
	}
	public void setE_count(int e_count) {
		this.e_count = e_count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getE_filePath() {
		return e_filePath;
	}
	public void setE_filePath(String e_filePath) {
		this.e_filePath = e_filePath;
	}
	@Override
	public String toString() {
		return "EventBoardVO [eno=" + eno + ", e_title=" + e_title + ", e_date=" + e_date + ", e_start=" + e_start
				+ ", e_end=" + e_end + ", e_win=" + e_win + ", e_type=" + e_type + ", e_content=" + e_content
				+ ", e_total=" + e_total + ", e_count=" + e_count + ", id=" + id + ", e_filePath=" + e_filePath
				+ ", e_winner=" + e_winner + "]";
	}

	
	
	
	

}

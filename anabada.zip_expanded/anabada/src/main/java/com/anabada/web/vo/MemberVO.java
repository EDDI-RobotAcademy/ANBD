package com.anabada.web.vo;

import java.util.Date;

public class MemberVO {

   private String id;
   private String pass;
   private String name;
   private String nick;
   private String tel;
   private String email;
   private int lev;
   private int caution;
   private Date register_date;
   
   
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getCaution() {
		return caution;
	}
	public void setCaution(int caution) {
		this.caution = caution;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", name=" + name + ", nick=" + nick + ", tel=" + tel + ", email="
				+ email + ", lev=" + lev + ", caution=" + caution + ", register_date=" + register_date + "]";
	}  
}
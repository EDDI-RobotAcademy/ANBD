package com.anabada.web.vo;
//
public class KakaoVO {

	private String nickname;
	private String account_email;
	private String id;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "KakaoVO [nickname=" + nickname + ", account_email=" + account_email + ", id=" + id + "]";
	}
	
}

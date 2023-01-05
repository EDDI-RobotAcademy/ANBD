package com.anabada.web.vo;

public class NoteSearchCriteria extends NoteCriteria{
	
	private String who="receive";

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	@Override
	public String toString() {
		return "NoteSearchCriteria [who=" + who + "]";
	}
	
}

package com.yl.dto;

public class Manager_dto {
	String mgid;
	String mgpw;
	String mgname;
	String mgpartname;
	public Manager_dto(String mgid, String mgpw, String mgname, String mgpartname) {
		super();
		this.mgid = mgid;
		this.mgpw = mgpw;
		this.mgname = mgname;
		this.mgpartname = mgpartname;
	}
	public Manager_dto() {
		super();
	}
	public String getMgid() {
		return mgid;
	}
	public void setMgid(String mgid) {
		this.mgid = mgid;
	}
	public String getMgpw() {
		return mgpw;
	}
	public void setMgpw(String mgpw) {
		this.mgpw = mgpw;
	}
	public String getMgname() {
		return mgname;
	}
	public void setMgname(String mgname) {
		this.mgname = mgname;
	}
	public String getMgpartname() {
		return mgpartname;
	}
	public void setMgpartname(String mgpartname) {
		this.mgpartname = mgpartname;
	}
	
	
}

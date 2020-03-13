package com.yl.dto;

import java.sql.Date;

public class Review_comment_dto {
	private int rcno;
	private int rno;
	private String mgid;
	private String rccontent;
	private Date rcdate;
	public Review_comment_dto() {
		super();
	}
	public Review_comment_dto(int rcno, int rno, String mgid, String rccontent, Date rcdate) {
		super();
		this.rcno = rcno;
		this.rno = rno;
		this.mgid = mgid;
		this.rccontent = rccontent;
		this.rcdate = rcdate;
	}
	public int getRcno() {
		return rcno;
	}
	public void setRcno(int rcno) {
		this.rcno = rcno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMgid() {
		return mgid;
	}
	public void setMgid(String mgid) {
		this.mgid = mgid;
	}
	public String getRccontent() {
		return rccontent;
	}
	public void setRccontent(String rccontent) {
		this.rccontent = rccontent;
	}
	public Date getRcdate() {
		return rcdate;
	}
	public void setRcdate(Date rcdate) {
		this.rcdate = rcdate;
	}
	
	
}

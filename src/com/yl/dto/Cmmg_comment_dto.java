package com.yl.dto;

import java.sql.Date;

public class Cmmg_comment_dto {
	private int csno;
	private String cmsubject;
	private String cmcontent;
	private Date cmrdate;
	private int cno;
	private String mgid;
	
	
	public Cmmg_comment_dto() {
		super();
	}
	public Cmmg_comment_dto(int csno, String cmsubject, String cmcontent, Date cmrdate, int cno, String mgid) {
		super();
		this.csno = csno;
		this.cmsubject = cmsubject;
		this.cmcontent = cmcontent;
		this.cmrdate = cmrdate;
		this.cno = cno;
		this.mgid = mgid;
	}
	public int getCsno() {
		return csno;
	}
	public void setCsno(int csno) {
		this.csno = csno;
	}
	public String getCmsubject() {
		return cmsubject;
	}
	public void setCmsubject(String cmsubject) {
		this.cmsubject = cmsubject;
	}
	public String getCmcontent() {
		return cmcontent;
	}
	public void setCmcontent(String cmcontent) {
		this.cmcontent = cmcontent;
	}
	public Date getCmrdate() {
		return cmrdate;
	}
	public void setCmrdate(Date cmrdate) {
		this.cmrdate = cmrdate;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMgid() {
		return mgid;
	}
	public void setMgid(String mgid) {
		this.mgid = mgid;
	}
	
	
}

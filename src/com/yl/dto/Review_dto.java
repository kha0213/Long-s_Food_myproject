package com.yl.dto;

import java.sql.Date;

public class Review_dto {
	private int rno;
	private String pcode;
	private String pname;
	private String mid;
	private String rimage1;
	private String rimage2;
	private String rimage3;
	private int rgood;
	private int rstar;
	private String rcontent;
	private Date rdate;
	private boolean rcexist;
	public Review_dto() {
		super();
	}
	
	
	public Review_dto(int rno, String pcode, String pname, String mid, String rimage1, String rimage2, String rimage3,
			int rgood, int rstar, String rcontent, Date rdate, boolean rcexist) {
		super();
		this.rno = rno;
		this.pcode = pcode;
		this.pname = pname;
		this.mid = mid;
		this.rimage1 = rimage1;
		this.rimage2 = rimage2;
		this.rimage3 = rimage3;
		this.rgood = rgood;
		this.rstar = rstar;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rcexist = rcexist;
	}


	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getRimage1() {
		return rimage1;
	}
	public void setRimage1(String rimage1) {
		this.rimage1 = rimage1;
	}
	public String getRimage2() {
		return rimage2;
	}
	public void setRimage2(String rimage2) {
		this.rimage2 = rimage2;
	}
	public String getRimage3() {
		return rimage3;
	}
	public void setRimage3(String rimage3) {
		this.rimage3 = rimage3;
	}
	public int getRgood() {
		return rgood;
	}
	public void setRgood(int rgood) {
		this.rgood = rgood;
	}
	public int getRstar() {
		return rstar;
	}
	public void setRstar(int rstar) {
		this.rstar = rstar;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public boolean isRcexist() {
		return rcexist;
	}
	public void setRcexist(boolean rcexist) {
		this.rcexist = rcexist;
	}
	
	
	

	


	
}

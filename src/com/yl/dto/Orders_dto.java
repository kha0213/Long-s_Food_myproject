package com.yl.dto;

import java.sql.Date;

public class Orders_dto {
	private String ono;
	private Date odate;
	private Date parrive_date;
	private String dno;
	private String mid;
	public Orders_dto(String ono, Date odate, Date parrive_date, String dno, String mid) {
		super();
		this.ono = ono;
		this.odate = odate;
		this.parrive_date = parrive_date;
		this.dno = dno;
		this.mid = mid;
	}
	public Orders_dto() {
		super();
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public Date getParrive_date() {
		return parrive_date;
	}
	public void setParrive_date(Date parrive_date) {
		this.parrive_date = parrive_date;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
	
}

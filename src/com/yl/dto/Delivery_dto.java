package com.yl.dto;

import java.sql.Date;

public class Delivery_dto {
	private int dno;
	private int dprice;
	private String dcompany;
	private Date odate;
	private Date parrive_date;
	
	public Delivery_dto(int dno, int dprice, String dcompany, Date odate, Date parrive_date) {
		super();
		this.dno = dno;
		this.dprice = dprice;
		this.dcompany = dcompany;
		this.odate = odate;
		this.parrive_date = parrive_date;
	}

	public Delivery_dto() {
		super();
	}
	
	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public String getDcompany() {
		return dcompany;
	}
	public void setDcompany(String dcompany) {
		this.dcompany = dcompany;
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
	
	
}

package com.yl.dto;

import java.sql.Date;

public class Orders_dto {
	private int ono;
	private Date odate;
	private Date parrive_date;
	private String pname; // JOIN해서 출력
	private String pimage; // JOIN해서 출력
	private int purchase_amount; // JOIN해서 출력
	private int dno;
	private String mid;
	
	public Orders_dto() {
		super();
	}

	public Orders_dto(int ono, Date odate, Date parrive_date, String pname, String pimage, int purchase_amount, int dno,
			String mid) {
		super();
		this.ono = ono;
		this.odate = odate;
		this.parrive_date = parrive_date;
		this.pname = pname;
		this.pimage = pimage;
		this.purchase_amount = purchase_amount;
		this.dno = dno;
		this.mid = mid;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPurchase_amount() {
		return purchase_amount;
	}

	public void setPurchase_amount(int purchase_amount) {
		this.purchase_amount = purchase_amount;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

}

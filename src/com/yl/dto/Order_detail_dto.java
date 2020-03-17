package com.yl.dto;

public class Order_detail_dto {
	private int odno;
	private int ono;
	private String pcode;
	private String pname;
	private String pimage;
	private int pcnt;
	private int pprice;
	public Order_detail_dto() {
		super();
	}
	
	
	public Order_detail_dto(int odno, int ono, String pcode, String pname, String pimage, int pcnt, int pprice) {
		super();
		this.odno = odno;
		this.ono = ono;
		this.pcode = pcode;
		this.pname = pname;
		this.pimage = pimage;
		this.pcnt = pcnt;
		this.pprice = pprice;
	}


	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public int getOdno() {
		return odno;
	}
	public void setOdno(int odno) {
		this.odno = odno;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	
	
}

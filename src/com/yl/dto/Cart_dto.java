package com.yl.dto;

public class Cart_dto {
	private int ctno;
	private String mid;
	private String pcode;
	private int pcnt;
	private int pprice;
	public Cart_dto(int ctno, String mid, String pcode, int pcnt, int pprice) {
		super();
		this.ctno = ctno;
		this.mid = mid;
		this.pcode = pcode;
		this.pcnt = pcnt;
		this.pprice = pprice;
	}
	public Cart_dto() {
		super();
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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

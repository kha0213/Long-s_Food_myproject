package com.yl.dto;

public class Order_detail_dto {
	private int odno;
	private int ono;
	private String pcode;
	private int pcnt;
	private int pprice;
	public Order_detail_dto() {
		super();
	}
	public Order_detail_dto(int odno, int ono, String pcode, int pcnt, int pprice) {
		super();
		this.odno = odno;
		this.ono = ono;
		this.pcode = pcode;
		this.pcnt = pcnt;
		this.pprice = pprice;
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

package com.yl.dto;

public class Payment_dto {
	private int pano;
	private int ono;
	private int product_all_pay;
	private int discount;
	private int coupondiscount;
	private int usepoint;
	private int purchase_amount;
	public Payment_dto() {
		super();
	}
	public Payment_dto(int pano, int ono, int product_all_pay, int discount, int coupondiscount, int usepoint,
			int purchase_amount) {
		super();
		this.pano = pano;
		this.ono = ono;
		this.product_all_pay = product_all_pay;
		this.discount = discount;
		this.coupondiscount = coupondiscount;
		this.usepoint = usepoint;
		this.purchase_amount = purchase_amount;
	}
	public int getPano() {
		return pano;
	}
	public void setPano(int pano) {
		this.pano = pano;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getProduct_all_pay() {
		return product_all_pay;
	}
	public void setProduct_all_pay(int product_all_pay) {
		this.product_all_pay = product_all_pay;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCoupondiscount() {
		return coupondiscount;
	}
	public void setCoupondiscount(int coupondiscount) {
		this.coupondiscount = coupondiscount;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getPurchase_amount() {
		return purchase_amount;
	}
	public void setPurchase_amount(int purchase_amount) {
		this.purchase_amount = purchase_amount;
	}
	
	
}

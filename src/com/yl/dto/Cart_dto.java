package com.yl.dto;

public class Cart_dto {
	private int ctno;
	private String mid;
	private String pname;
	private String pcode;
	private String pimage;
	private int pcnt;
	private int pprice;
	private int pstock;
	private int pdiscount;

	public Cart_dto(int ctno, String mid, String pname, String pcode, String pimage, int pcnt, int pprice, int pstock,
			int pdiscount) {
		super();
		this.ctno = ctno;
		this.mid = mid;
		this.pname = pname;
		this.pcode = pcode;
		this.pimage = pimage;
		this.pcnt = pcnt;
		this.pprice = pprice;
		this.pstock = pstock;
		this.pdiscount = pdiscount;
	}

	public Cart_dto() {
		super();
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public int getPdiscount() {
		return pdiscount;
	}

	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}

}

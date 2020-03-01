package com.yl.dto;

import java.sql.Date;

public class Product_dto {
	private String pcode;
	private String pname;
	private int pprice;
	private String pimage;
	private int pstock;
	private String pdescription;
	private int pdiscount;
	private Date pregist;
	private int pcumulative_sales;
	private int preview_count;
	public Product_dto() {
		super();
	}
	public Product_dto(String pcode, String pname, int pprice, String pimage, int pstock, String pdescription,
			int pdiscount, Date pregist, int pcumulative_sales, int preview_count) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.pprice = pprice;
		this.pimage = pimage;
		this.pstock = pstock;
		this.pdescription = pdescription;
		this.pdiscount = pdiscount;
		this.pregist = pregist;
		this.pcumulative_sales = pcumulative_sales;
		this.preview_count = preview_count;
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
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public String getPdescription() {
		return pdescription;
	}
	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}
	public int getPdiscount() {
		return pdiscount;
	}
	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}
	public Date getPregist() {
		return pregist;
	}
	public void setPregist(Date pregist) {
		this.pregist = pregist;
	}
	public int getPcumulative_sales() {
		return pcumulative_sales;
	}
	public void setPcumulative_sales(int pcumulative_sales) {
		this.pcumulative_sales = pcumulative_sales;
	}
	public int getPreview_count() {
		return preview_count;
	}
	public void setPreview_count(int preview_count) {
		this.preview_count = preview_count;
	}
	
	
}

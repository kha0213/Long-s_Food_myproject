package com.yl.dto;

import java.sql.Date;

public class Member_dto {
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private String maddress;
	private Date mbirth;
	private String memail;
	private String mgender;
	private int mpoint;
	private int mcumulative_buy;
	private Date mjoindate;
	private int gno;
	private int ad_email;
	private int ad_phone;
	private int ad_call;
	
	
	public Member_dto() {
		super();
	}


	public Member_dto(String mid, String mpw, String mname, String mphone, String maddress, Date mbirth, String memail,
			String mgender, int mpoint, int mcumulative_buy, Date mjoindate, int gno, int ad_email, int ad_phone,
			int ad_call) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
		this.maddress = maddress;
		this.mbirth = mbirth;
		this.memail = memail;
		this.mgender = mgender;
		this.mpoint = mpoint;
		this.mcumulative_buy = mcumulative_buy;
		this.mjoindate = mjoindate;
		this.gno = gno;
		this.ad_email = ad_email;
		this.ad_phone = ad_phone;
		this.ad_call = ad_call;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getMpw() {
		return mpw;
	}


	public void setMpw(String mpw) {
		this.mpw = mpw;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMphone() {
		return mphone;
	}


	public void setMphone(String mphone) {
		this.mphone = mphone;
	}


	public String getMaddress() {
		return maddress;
	}


	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}


	public Date getMbirth() {
		return mbirth;
	}


	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}


	public String getMemail() {
		return memail;
	}


	public void setMemail(String memail) {
		this.memail = memail;
	}


	public String getMgender() {
		return mgender;
	}


	public void setMgender(String mgender) {
		this.mgender = mgender;
	}


	public int getMpoint() {
		return mpoint;
	}


	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}


	public int getMcumulative_buy() {
		return mcumulative_buy;
	}


	public void setMcumulative_buy(int mcumulative_buy) {
		this.mcumulative_buy = mcumulative_buy;
	}


	public Date getMjoindate() {
		return mjoindate;
	}


	public void setMjoindate(Date mjoindate) {
		this.mjoindate = mjoindate;
	}


	public int getGno() {
		return gno;
	}


	public void setGno(int gno) {
		this.gno = gno;
	}


	public int getAd_email() {
		return ad_email;
	}


	public void setAd_email(int ad_email) {
		this.ad_email = ad_email;
	}


	public int getAd_phone() {
		return ad_phone;
	}


	public void setAd_phone(int ad_phone) {
		this.ad_phone = ad_phone;
	}


	public int getAd_call() {
		return ad_call;
	}


	public void setAd_call(int ad_call) {
		this.ad_call = ad_call;
	}



	
	
	
}

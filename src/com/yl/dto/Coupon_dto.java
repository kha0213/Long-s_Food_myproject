package com.yl.dto;

import java.sql.Date;

public class Coupon_dto {
	private int cono;
	private String cname;
	private int ccondition;
	private int cdisper;
	private int cdiscash;
	private Date cordate;
	private Date cvalidity;
	private String mid;
	public Coupon_dto() {
		super();
	}
	public Coupon_dto(int cono, String cname, int ccondition, int cdisper, int cdiscash, Date cordate, Date cvalidity,
			String mid) {
		super();
		this.cono = cono;
		this.cname = cname;
		this.ccondition = ccondition;
		this.cdisper = cdisper;
		this.cdiscash = cdiscash;
		this.cordate = cordate;
		this.cvalidity = cvalidity;
		this.mid = mid;
	}
	public int getCono() {
		return cono;
	}
	public void setCono(int cono) {
		this.cono = cono;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCcondition() {
		return ccondition;
	}
	public void setCcondition(int ccondition) {
		this.ccondition = ccondition;
	}
	public int getCdisper() {
		return cdisper;
	}
	public void setCdisper(int cdisper) {
		this.cdisper = cdisper;
	}
	public int getCdiscash() {
		return cdiscash;
	}
	public void setCdiscash(int cdiscash) {
		this.cdiscash = cdiscash;
	}
	public Date getCordate() {
		return cordate;
	}
	public void setCordate(Date cordate) {
		this.cordate = cordate;
	}
	public Date getCvalidity() {
		return cvalidity;
	}
	public void setCvalidity(Date cvalidity) {
		this.cvalidity = cvalidity;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
	
}

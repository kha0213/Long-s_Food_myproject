package com.yl.dto;

public class Customer_service_dto {
	private int cno;
	private String mid;
	private String ccontent;
	private int csecret;
	private int chit;
	private int cgroup;
	private int cgroup_outnum;
	private int cindent;
	private String ono;
	public Customer_service_dto(int cno, String mid, String ccontent, int csecret, int chit, int cgroup,
			int cgroup_outnum, int cindent, String ono) {
		super();
		this.cno = cno;
		this.mid = mid;
		this.ccontent = ccontent;
		this.csecret = csecret;
		this.chit = chit;
		this.cgroup = cgroup;
		this.cgroup_outnum = cgroup_outnum;
		this.cindent = cindent;
		this.ono = ono;
	}
	public Customer_service_dto() {
		super();
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public int getCsecret() {
		return csecret;
	}
	public void setCsecret(int csecret) {
		this.csecret = csecret;
	}
	public int getChit() {
		return chit;
	}
	public void setChit(int chit) {
		this.chit = chit;
	}
	public int getCgroup() {
		return cgroup;
	}
	public void setCgroup(int cgroup) {
		this.cgroup = cgroup;
	}
	public int getCgroup_outnum() {
		return cgroup_outnum;
	}
	public void setCgroup_outnum(int cgroup_outnum) {
		this.cgroup_outnum = cgroup_outnum;
	}
	public int getCindent() {
		return cindent;
	}
	public void setCindent(int cindent) {
		this.cindent = cindent;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	
	
}

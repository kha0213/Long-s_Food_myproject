package com.yl.dto;

import java.sql.Date;

public class Customer_service_dto {
	private int cno;
	private String mid;
	private String mname; // join해서 쓸 이름
	private String csubject;
	private String ccontent;
	private int csecret;
	private String cimage;
	private int chit;
	private int cgroup;
	private int cgroup_outnum;
	private int cindent;
	private Date crdate;
	private boolean cmexist;
	private String ono;

	


	public Customer_service_dto(int cno, String mid, String mname, String csubject, String ccontent, int csecret,
			String cimage, int chit, int cgroup, int cgroup_outnum, int cindent, Date crdate, boolean cmexist,
			String ono) {
		super();
		this.cno = cno;
		this.mid = mid;
		this.mname = mname;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.csecret = csecret;
		this.cimage = cimage;
		this.chit = chit;
		this.cgroup = cgroup;
		this.cgroup_outnum = cgroup_outnum;
		this.cindent = cindent;
		this.crdate = crdate;
		this.cmexist = cmexist;
		this.ono = ono;
	}

	public Customer_service_dto() {
		super();
	}

	public boolean isCmexist() {
		return cmexist;
	}

	public void setCmexist(boolean cmexist) {
		this.cmexist = cmexist;
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

	public Date getCrdate() {
		return crdate;
	}

	public void setCrdate(Date crdate) {
		this.crdate = crdate;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
	
}

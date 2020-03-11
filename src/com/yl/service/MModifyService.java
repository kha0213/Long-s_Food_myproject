package com.yl.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Member_dao;

public class MModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		if(mpw == null || mpw.equals("")) {
			mpw = request.getParameter("mpwSe");
		}
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String maddress_basic = request.getParameter("maddress_basic");
		String maddress_detail = request.getParameter("maddress_detail");
		String maddress = null;
		if(maddress_basic != null) {
			maddress = maddress_basic+" "+maddress_detail;
		}
		Date mbirth = null;
		String mbirthStr = request.getParameter("mbirth");
		if(mbirthStr!=null) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		
		int ad_email = 1;
		int ad_phone = 1;
		int ad_call = 1;
		String ad_email_str = request.getParameter("ad_email");
		String ad_phone_str = request.getParameter("ad_phone");
		String ad_call_str = request.getParameter("ad_call");
		
		if(ad_email_str==null) ad_email = 0;
		if(ad_phone_str==null) ad_phone = 0;
		if(ad_call_str==null) ad_call = 0;
		
		Member_dao mDao = Member_dao.getInstance();
		
		
		
	}

}

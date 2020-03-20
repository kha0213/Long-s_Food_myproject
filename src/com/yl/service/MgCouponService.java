package com.yl.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Coupon_dao;
import com.yl.dao.Member_dao;

public class MgCouponService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String[] grades = request.getParameterValues("grades");
		String cname = request.getParameter("cname");
		int ccondition = Integer.parseInt(request.getParameter("ccondition"));
		int cvalidity = Integer.parseInt(request.getParameter("cvalidity"));
		int cdisper =0, cdiscash=0;
		String cdisperStr = request.getParameter("cdisper");
		if(cdisperStr != null && !cdisperStr.equals("")) cdisper=Integer.parseInt(cdisperStr);
		String cdiscashStr = request.getParameter("cdiscash");
		if(cdiscashStr != null && !cdiscashStr.equals("")) cdiscash=Integer.parseInt(cdiscashStr);
		
		Coupon_dao coDao = Coupon_dao.getInstance();
		Member_dao mDao = Member_dao.getInstance();
		boolean result = true;
		for(int i=0;i<grades.length;i++) {
			ArrayList<String> mids = mDao.getMemberListGrades(grades[i]);
			for(int j=0;j<mids.size();j++) {
				if(!coDao.addCoupon(cname, ccondition, cdisper, cdiscash, cvalidity, mids.get(j))) {
					result = false;
				}
			}
			mids.clear();
		}
		if(result) {
			request.setAttribute("addCouponResult", "쿠폰발행에 성공하셨습니다.");
		}
	}

}

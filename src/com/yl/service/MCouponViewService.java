package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Coupon_dao;

public class MCouponViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		Coupon_dao coDao = Coupon_dao.getInstance();
		request.setAttribute("coupons", coDao.getMemberCoupon(mid));
	}

}

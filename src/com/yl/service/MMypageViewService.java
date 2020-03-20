package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Coupon_dao;
import com.yl.dao.Order_detail_dao;
import com.yl.dto.Member_dto;

public class MMypageViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Order_detail_dao oDao = Order_detail_dao.getInstance();
		String mModifyView = request.getParameter("mModifyView");
		HttpSession session = request.getSession();
		Member_dto member = (Member_dto)session.getAttribute("member");
		String mid = member.getMid();
		if(mModifyView!=null) {
			request.setAttribute("modify", true);
		}
		request.setAttribute("deliveryCnt", oDao.getDeliveryNotArrive(mid).size());
		Coupon_dao coDao = Coupon_dao.getInstance();
		request.setAttribute("mCouponCnt", coDao.getMCouponCnt(mid));
	}

}

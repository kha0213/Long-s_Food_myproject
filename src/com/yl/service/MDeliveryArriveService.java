package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Delivery_dao;
import com.yl.dao.Orders_dao;

public class MDeliveryArriveService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int ono = Integer.parseInt(request.getParameter("ono"));
		Orders_dao oDao = Orders_dao.getInstance();
		Delivery_dao dDao = Delivery_dao.getInstance();
		if(oDao.finishDeliveryToday(ono) && dDao.finishDelivery(oDao.getDao(ono), true)) {
			request.setAttribute("finishDeliveryToday", "오늘 날짜로 배송완료 처리되었습니다.");
		}
	}

}

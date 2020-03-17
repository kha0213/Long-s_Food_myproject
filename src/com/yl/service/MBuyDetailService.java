package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Delivery_dao;
import com.yl.dao.Order_detail_dao;
import com.yl.dao.Orders_dao;
import com.yl.dto.Orders_dto;

public class MBuyDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int ono = Integer.parseInt(request.getParameter("ono"));
		Order_detail_dao odDao = Order_detail_dao.getInstance();
		Orders_dao oDao = Orders_dao.getInstance();
		Delivery_dao dDao = Delivery_dao.getInstance();
		Orders_dto order = oDao.getOrder(ono);
		request.setAttribute("order", order);
		request.setAttribute("ods", odDao.getOrderDetail(ono));
		request.setAttribute("delivery", dDao.getDelivery(order.getDno()));
		
	}

}

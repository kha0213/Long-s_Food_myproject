package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Delivery_dao;
import com.yl.dao.Order_detail_dao;

public class MDeliveryService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Order_detail_dao oDao = Order_detail_dao.getInstance();
		request.setAttribute("oNoArrive", oDao.getDeliveryNotArrive());
	}

}

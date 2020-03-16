package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Cart_dao;

public class CartViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		Cart_dao cDao = Cart_dao.getInstance();
		request.setAttribute("carts", cDao.getCart(mid));
	}

}

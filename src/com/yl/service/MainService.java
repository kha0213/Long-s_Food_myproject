package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Product_dao pDao = Product_dao.getInstance();
		request.setAttribute("products", pDao.getProductTOPN(4));
	}

}

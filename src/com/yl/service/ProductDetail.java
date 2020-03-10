package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;

public class ProductDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		Manager_dao mgDao = Manager_dao.getInstance();
		request.setAttribute("product", mgDao.productDetail(pcode));
		
	}

}

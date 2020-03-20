package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;

public class ProductModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		Product_dao pDao = Product_dao.getInstance();
		request.setAttribute("product", pDao.productDetail(pcode));
	}

}

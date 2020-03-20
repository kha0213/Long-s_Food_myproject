package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;

public class MgAddStockProductService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Product_dao pDao = Product_dao.getInstance();
		String pcode = request.getParameter("pcode");
		int pcnt = Integer.parseInt(request.getParameter("pcnt"));
		if(pDao.productStockPlus(pcode, pcnt)) {
			request.setAttribute("addStockResult", true);
		}
	}

}

package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;
import com.yl.dto.Product_dto;

public class ProductPurchaseConfirm implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		String pcnt = request.getParameter("pcnt");
		String mid = request.getParameter("mid");
		Product_dao pDao = Product_dao.getInstance();
		Product_dto product = pDao.productDetail(pcode);
		
		
	}

}

package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductPurchaseConfirm implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		String pcnt = request.getParameter("pcnt");
		
	}

}

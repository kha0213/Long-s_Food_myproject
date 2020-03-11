package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Customer_service_dao;

public class CsBoardsDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		Customer_service_dao csDao = Customer_service_dao.getInstance();
		request.setAttribute("csBoard", csDao.getCsBoard(cno));
	}

}

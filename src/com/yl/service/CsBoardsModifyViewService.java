package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Customer_service_dao;
import com.yl.dao.Member_dao;
import com.yl.dto.Customer_service_dto;

public class CsBoardsModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		String mid = request.getParameter("mid");
		Customer_service_dao csDao = Customer_service_dao.getInstance();
		Member_dao mDao = Member_dao.getInstance();
		request.setAttribute("orders", mDao.getOrdersAll(mid));
		request.setAttribute("csBoard", csDao.getCsBoard(cno));
	}

}

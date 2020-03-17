package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Member_dao;

public class CsBoardWriteView implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		Member_dao mDao = Member_dao.getInstance();
		request.setAttribute("orders", mDao.getOrdersAll(mid));
	}

}

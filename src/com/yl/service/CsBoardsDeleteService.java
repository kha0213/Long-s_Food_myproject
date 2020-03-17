package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Customer_service_dao;

public class CsBoardsDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		Customer_service_dao cDao = Customer_service_dao.getInstance();
		if(cDao.deleteCsBoardMember(cno)) {
			request.setAttribute("csBoardsDeleteResult", cno+"번 글 삭제 성공하셨습니다.");
		}
		
	}

}

package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Review_dao;

public class RCommentViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		Review_dao rDao = Review_dao.getInstance();
		request.setAttribute("rc", rDao.getRc(rno));
		
	}

}

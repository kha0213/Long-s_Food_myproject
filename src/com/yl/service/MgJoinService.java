package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;

public class MgJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mgid = request.getParameter("mgid");
		String mgpw = request.getParameter("mgpw");
		String mgname = request.getParameter("mgname");
		String mgpartname = request.getParameter("mgpartname");
		
		Manager_dao mgDao = Manager_dao.getInstance();
		int result = mgDao.joinManager(mgid, mgpw, mgname, mgpartname);
		request.setAttribute("mgjoinResult", result);
	}

}

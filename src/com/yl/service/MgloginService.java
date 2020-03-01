package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Manager_dao;
import com.yl.dao.Member_dao;
import com.yl.dto.Manager_dto;
import com.yl.dto.Member_dto;

public class MgloginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mgid = request.getParameter("mgid");
		String mgpw = request.getParameter("mgpw");
		
		Manager_dao mgDao = Manager_dao.getInstance();
		Manager_dto manager = mgDao.loginManager(mgid, mgpw);
		if(manager==null) request.setAttribute("mgloginResult", false);
		else {
			request.setAttribute("mgloginResult", true);
			HttpSession session = request.getSession();
			session.setAttribute("manager", manager);
		}

	}

}

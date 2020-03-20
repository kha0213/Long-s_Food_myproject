package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;

public class MgModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mgid = request.getParameter("mgid");
		Manager_dao mgDao = Manager_dao.getInstance();
		request.setAttribute("mgView", mgDao.getManager(mgid));
	}

}

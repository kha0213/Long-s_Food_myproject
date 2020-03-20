package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;
import com.yl.dao.Member_dao;

public class MemberLookUpService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao mDao = Member_dao.getInstance();
		request.setAttribute("members", mDao.getAllMember());
	}
}

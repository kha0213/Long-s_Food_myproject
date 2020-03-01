package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Member_dao;
import com.yl.dto.Member_dto;

public class LoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		Member_dao mDao = Member_dao.getInstance();
		Member_dto member = mDao.loginMember(mid, mpw);
		if(member==null) request.setAttribute("loginResult", false);
		else {
			request.setAttribute("loginResult", true);
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
		}
		
		
	}

}

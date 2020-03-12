package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Member_dao;

public class MDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao mDao = Member_dao.getInstance();
		String mid = request.getParameter("mid");
		if(mDao.deleteMember(mid,false)) {//false는 탈퇴
			request.setAttribute("mDeleteResult", "회원탈퇴에 성공하셨습니다. 이용해주셔서 감사합니다.");
			HttpSession session = request.getSession();
			session.invalidate();
		}
		
	}

}

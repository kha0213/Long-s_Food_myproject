package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Member_dao;

public class MidDuplicationCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		Member_dao mDao = Member_dao.getInstance();
		if(mDao.midConfirm(mid)) {
			request.setAttribute("idConfirmResult", "중복된 아이디가 존재합니다.");
		}else {
			request.setAttribute("idConfirmResult", "사용 가능한 아이디입니다.");
		}
	}

}

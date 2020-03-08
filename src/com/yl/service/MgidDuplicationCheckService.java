package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;
import com.yl.dao.Member_dao;

public class MgidDuplicationCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mgid = request.getParameter("mgid");
		Manager_dao mgDao = Manager_dao.getInstance();
		if(mgDao.mgidConfirm(mgid)) {
			request.setAttribute("mgidConfirmResult", "중복된 아이디가 존재합니다.");
		}else {
			request.setAttribute("mgidConfirmResult", "사용 가능한 아이디입니다.");
		}
	}

}

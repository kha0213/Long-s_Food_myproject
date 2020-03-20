package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Manager_dao;

public class MgModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mgid = request.getParameter("mgid");
		String mgpw = request.getParameter("mgpw");
		String mgname = request.getParameter("mgname");
		String mgpartname = request.getParameter("mgpartname");
		if(mgpartname == null) mgpartname="상품MD";
		Manager_dao mgDao = Manager_dao.getInstance();
		if(mgDao.mgModify(mgid, mgpw, mgname, mgpartname)) {
			request.setAttribute("mgModifyResult", "관리자 수정에 성공하셨습니다.");
		}
	}

}

package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Review_dao;

public class RGoodPlusService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int rno = Integer.parseInt(request.getParameter("rno"));
		Review_dao rDao = Review_dao.getInstance();
		if(rDao.rGoodMemberChk(mid,rno)) {
			if(rDao.rGoodUp(rno, mid)) {//성공
				request.setAttribute("rGoodResult", true);
			}else {//실패
				request.setAttribute("rGoodResult", false); //여긴 오류
			}
		}else {//실패
			request.setAttribute("rGoodResult", false);
		}
		
	}

}

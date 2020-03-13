package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Review_dao;

public class RCommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String mgid = request.getParameter("mgid");
		String rccontent = request.getParameter("rccontent");
		String pcode = request.getParameter("pcode");
		request.setAttribute("pcode", pcode);
		Review_dao rDao = Review_dao.getInstance();
		if(rDao.rcWrite(rno, mgid, rccontent)) {
			request.setAttribute("rcWriteResult", "댓글작성에 성공하셨습니다.");
		}
		
	}

}

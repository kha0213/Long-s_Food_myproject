package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.CMMg_comment_dao;
import com.yl.dao.Customer_service_dao;

public class CmCommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CMMg_comment_dao cmDao = CMMg_comment_dao.getInstance();
		Customer_service_dao csDao = Customer_service_dao.getInstance();
		
		String cmsubject = request.getParameter("cmsubject");
		String cmcontent = request.getParameter("cmcontent");
		int cno = Integer.parseInt(request.getParameter("cno"));
		request.setAttribute("cno", cno);
		String mgid = request.getParameter("mgid");
		if(cmDao.writeCsComment(cmsubject, cmcontent, cno, mgid)) {
			csDao.existCsComment(cno, true);
			request.setAttribute("cmCommentWriteResult", cno+"번 관리자 코멘트쓰기 성공");
		}
		
	}

}

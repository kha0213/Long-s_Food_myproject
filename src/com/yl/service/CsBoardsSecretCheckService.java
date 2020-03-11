package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Customer_service_dao;
import com.yl.dto.Member_dto;

public class CsBoardsSecretCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member_dto member = (Member_dto) session.getAttribute("member");
		Customer_service_dao csDao = Customer_service_dao.getInstance();
		int cno = Integer.parseInt(request.getParameter("cno"));
		String pageNum = request.getParameter("pageNum");
		
		if(csDao.getCsBoard(cno).getCsecret() == 1) {//비밀글 일때
			if(member!=null) {//member
				String mid = member.getMid();
				
				if(csDao.getCsBoard(cno).getMid().equals(mid)) {// 비밀 글 열람 성공
					secretResult(true, request,pageNum,cno);
				}
			}else if(session.getAttribute("manager")!=null){//비밀 글 열람 성공
				secretResult(true, request,pageNum,cno);
			}else { //열람 실패
				secretResult(false, request);
			}
		}else {//비밀글 아닐때
			secretResult(true, request,pageNum,cno);
		}
		
	}
	
	private void secretResult(boolean result,HttpServletRequest request,String pageNum,int cno) {
		if(result == true) {
			request.setAttribute("secretResult", true);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("cno", cno);
		}else {
			request.setAttribute("secretResult", false);
		}
	}
	private void secretResult(boolean result,HttpServletRequest request) {
		if(result == true) {
			request.setAttribute("secretResult", true);
		}else {
			request.setAttribute("secretResult", false);
		}
	}

}


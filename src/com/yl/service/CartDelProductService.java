package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Cart_dao;
import com.yl.dao.Member_dao;

public class CartDelProductService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String[] pcodeArr = request.getParameterValues("pcode");
		String mid = request.getParameter("mid");
				
		Cart_dao cDao = Cart_dao.getInstance();
		boolean cartDelProductResult = true;
		for(int i=0;i<pcodeArr.length;i++) {
			if(!cDao.cartDelProduct(mid, pcodeArr[i])) {
				cartDelProductResult = false;
			}
		}
		if(cartDelProductResult) {
			request.setAttribute("cartDelProductResult", "장바구니에 물품 삭제 성공");
			HttpSession session = request.getSession();
			Member_dao mDao = Member_dao.getInstance();
			session.setAttribute("member", mDao.getMember(mid));
		}else {
			request.setAttribute("cartDelProductResult", "오류 관리자에게 문의하세요");
		}
		
	}

}

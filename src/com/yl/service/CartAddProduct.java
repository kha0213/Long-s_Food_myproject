package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Cart_dao;
import com.yl.dao.Member_dao;

public class CartAddProduct implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String pcode = request.getParameter("pcode");
		int pcnt = Integer.parseInt(request.getParameter("pcnt"));
		Cart_dao cDao = Cart_dao.getInstance();
		if(cDao.cartProductExist(mid, pcode)) {
			request.setAttribute("cartAddProductResult", "장바구니에 이미 추가한 상품입니다.");
		}else {
			if(cDao.cartAddProduct(mid, pcode, pcnt)) {
				HttpSession session = request.getSession();
				Member_dao mDao = Member_dao.getInstance();
				session.setAttribute("member", mDao.getMember(mid));
				request.setAttribute("cartAddProductResult", "장바구니에 상품 추가 성공!");
			}else {
				request.setAttribute("cartAddProductResult", "장바구니에 상품 추가 실패하셨습니다.");
			}
		}
	}

}

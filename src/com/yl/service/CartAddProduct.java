package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Cart_dao;

public class CartAddProduct implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String pcode = request.getParameter("pcode");
		int pcnt = Integer.parseInt(request.getParameter("pcnt"));
		int pprice = (int)Math.round(Double.parseDouble(request.getParameter("pprice")));
		Cart_dao cDao = Cart_dao.getInstance();
		if(cDao.cartAddProduct(mid, pcode, pcnt, pprice)) {
			HttpSession session = request.getSession();
			session.setAttribute("cart", cDao.getCart(mid));
			request.setAttribute("cartAddProductResult", "장바구니에 상품 추가 성공하셨습니다.");
		}else {
			request.setAttribute("cartAddProductResult", "장바구니에 상품 추가 실패하셨습니다.");
		}
	}

}

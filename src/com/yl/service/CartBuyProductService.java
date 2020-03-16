package com.yl.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Cart_dao;
import com.yl.dao.Member_dao;
import com.yl.dao.Product_dao;
import com.yl.dto.Cart_dto;
import com.yl.dto.Member_dto;
import com.yl.dto.Product_dto;

public class CartBuyProductService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Cart_dao cDao = Cart_dao.getInstance();
		ArrayList<Cart_dto> carts = new ArrayList<Cart_dto>();
		String mid = null;
		if(request.getParameter("pBuyNow")!=null) {
			mid = request.getParameter("mid");
			String pcode = request.getParameter("pcode");
			Product_dao pDao = Product_dao.getInstance();
			Product_dto product = pDao.productDetail(pcode);
			int pcnt = Integer.parseInt(request.getParameter("pcnt"));
				cDao.cartDelProduct(mid, pcode);
				if(cDao.cartAddProduct(mid, pcode, pcnt)){
					request.setAttribute("ppriceAll", product.getPprice()*pcnt);
					request.setAttribute("pdiscountAll", product.getPprice()*pcnt/100*product.getPdiscount());
					carts.add(cDao.buyInCart(mid, pcode));
					request.setAttribute("carts", carts);
					cDao.cartDelProduct(mid, pcode);
				}
			
			
		}else {
			String[] pcodeArr = request.getParameterValues("pcode");
			mid = request.getParameter("mid");
			request.setAttribute("ppriceAll", request.getParameter("ppriceAll"));
			request.setAttribute("pdiscountAll", request.getParameter("pdiscount"));
			
			for(int i=0;i<pcodeArr.length;i++) {
				carts.add(cDao.buyInCart(mid, pcodeArr[i]));
			}
			request.setAttribute("carts", carts);
		}
	}
}

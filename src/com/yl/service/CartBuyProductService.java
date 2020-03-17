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
		if(request.getParameter("pBuyNow")!=null) {//제품 하나 바로구매
			mid = request.getParameter("mid");
			String pcode = request.getParameter("pcode");
			Product_dao pDao = Product_dao.getInstance();
			Product_dto product = pDao.productDetail(pcode);
			int pcnt = Integer.parseInt(request.getParameter("pcnt"));
				if(cDao.cartAddProduct(mid, pcode, pcnt)){
					request.setAttribute("ppriceAll", product.getPprice()*pcnt);
					request.setAttribute("pdiscountAll", product.getPprice()*pcnt/100*product.getPdiscount());
					carts.add(cDao.buyInCart(mid, pcode));
					request.setAttribute("carts", carts);
					cDao.cartDelProduct(mid, pcode);
				}
			
			
		}else {//장바구니 구매
			String[] pcodeArr = request.getParameterValues("pcode");
			String[] pcntStr = request.getParameterValues("pcnt");
			mid = request.getParameter("mid");
			request.setAttribute("ppriceAll", request.getParameter("ppriceAll"));
			request.setAttribute("pdiscountAll", request.getParameter("pdiscount"));
			
			for(int i=0;i<pcodeArr.length;i++) {
				int tempPcnt = Integer.parseInt(pcntStr[i]);
				cDao.cartPcntModify(mid, pcodeArr[i], tempPcnt);
				carts.add(cDao.buyInCart(mid, pcodeArr[i]));
			}
			request.setAttribute("carts", carts);
		}
	}
}

package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Delivery_dao;
import com.yl.dao.Member_dao;
import com.yl.dao.Order_detail_dao;
import com.yl.dao.Orders_dao;
import com.yl.dao.Product_dao;

public class PBuyNowService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pcnt = Integer.parseInt(request.getParameter("pcnt"));
		String pcode = request.getParameter("pcode");
		String mid = request.getParameter("mid");
		
		Product_dao pDao = Product_dao.getInstance();
		int pprice = pDao.productDetail(pcode).getPprice();
		int mpoint = pprice/20*pcnt;
		
		
		Delivery_dao dDao = Delivery_dao.getInstance();
		int dno = dDao.addDelivery(2500, "한진택배"); // 1.delivery 생성
		Orders_dao oDao = Orders_dao.getInstance();
		int ono = oDao.addOrders(dno, mid); // 2.orders생성
		Order_detail_dao odDao = Order_detail_dao.getInstance();
		boolean addOrderDetail= odDao.addOrderDetail(ono, pcode, pcnt, pprice); // 3.odetail생성
		boolean productStockMinus = pDao.productStockMinus(pcode,pcnt); // 4.재고 감소
		boolean pcumulative_sales_plus = pDao.pcumulative_sales_plus(pcode, pcnt); //5. 누적판매량 증가
		int purchase_amount = oDao.get_set_purchase_amount(ono); // 6. orders에 구매금액 넣고
		Member_dao mDao = Member_dao.getInstance();
		boolean mcumulative_buy_plus = mDao.mcumulative_buy_plus(purchase_amount, mid); // 7.member에 누적구매금액 증가
		boolean mPointPlus = mDao.mPointPlus(mpoint, mid); // 8.member에 포인트적립
		 // 9.member 등급 정리 - 자동
		
		if(addOrderDetail && productStockMinus && pcumulative_sales_plus && mcumulative_buy_plus && mPointPlus) {
			request.setAttribute("pbuyNowResult", "주문 성공하셨습니다. 주문금액 : "+purchase_amount+"원 포인트 "+mpoint+"점 적립되었습니다.");
			HttpSession session = request.getSession();
			session.setAttribute("member", mDao.getMember(mid));
		}else {
			request.setAttribute("pbuyNowResult", "주문 실패하셨습니다. 관리자에게 문의해주세요");
		}
		
	}

}

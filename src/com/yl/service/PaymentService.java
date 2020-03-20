package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Cart_dao;
import com.yl.dao.Coupon_dao;
import com.yl.dao.Delivery_dao;
import com.yl.dao.Member_dao;
import com.yl.dao.Order_detail_dao;
import com.yl.dao.Orders_dao;
import com.yl.dao.Payment_dao;
import com.yl.dao.Product_dao;

public class PaymentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String dname = request.getParameter("dname");
		String dphone = request.getParameter("dphone");
		String daddress_basic = request.getParameter("daddress_basic");
		String daddress_detail = request.getParameter("daddress_detail");
		String daddress = daddress_basic+daddress_detail;
		String dcompany = "한진택배"; //현재 계약중인 택배사 하나
		int dprice = 2500; //택배비 고정
		
		String[] pcodeArr = request.getParameterValues("pcodeArr");
		String[] pcntArr = request.getParameterValues("pcntArr");
		int[] pcntIntArr = new int[pcntArr.length];
		for(int i=0;i<pcntArr.length;i++) {
			pcntIntArr[i]=Integer.parseInt(pcntArr[i]);
		}
		
		int product_all_pay = Integer.parseInt(request.getParameter("purchaseMoney"));
		int purchase_amount = Integer.parseInt(request.getParameter("finalPay"));
		String usempStr = request.getParameter("usemp");
		int usemp = 0;
		if(usempStr!=null) usemp = Integer.parseInt(usempStr);
		int mpoint = purchase_amount/20;
		int discount = 0;
		String discountStr = request.getParameter("discount");
		if(discountStr!=null) discount = Integer.parseInt(discountStr);
		int couponDiscount=0;
		String conoStr = request.getParameter("cono");
		int cono=-1;
		if(!conoStr.equals("") && !conoStr.equals("NaN")) cono = Integer.parseInt(conoStr);
		String couponDiscountStr = request.getParameter("couponDiscount");
		if(!couponDiscountStr.equals("") && !couponDiscountStr.equals("NaN")) couponDiscount = Integer.parseInt(couponDiscountStr);
		
		String mid = request.getParameter("mid");
		Product_dao pDao = Product_dao.getInstance();
		
		
		Delivery_dao dDao = Delivery_dao.getInstance();
		int dno = dDao.addDelivery(dname, dphone, dprice, dcompany, daddress); // 1.delivery 생성
		Orders_dao oDao = Orders_dao.getInstance();
		int ono = oDao.addOrders(purchase_amount,dno, mid); // 2.orders생성
		Order_detail_dao odDao = Order_detail_dao.getInstance();
		
		Cart_dao cDao = Cart_dao.getInstance();
		boolean productPurchase = true;
		for(int i=0;i<pcodeArr.length;i++) {
			String tempPcode = pcodeArr[i];
			int tempPcnt = pcntIntArr[i];
			int pstock = pDao.productDetail(tempPcode).getPstock();
			if(pstock<tempPcnt) {
				productPurchase = false;
			}else {
				pDao.productStockMinus(tempPcode,tempPcnt); // 4.재고 감소
				odDao.addOrderDetail(ono, tempPcode, tempPcnt); // 3.odetail생성
				pDao.pcumulative_sales_plus(tempPcode, tempPcnt); //5. 누적판매량 증가
				cDao.cartDelProduct(mid, tempPcode); //6. 장바구니에서 물품 삭제
			}
		}
		Member_dao mDao = Member_dao.getInstance();
		Coupon_dao coDao = Coupon_dao.getInstance();
		Payment_dao paDao = Payment_dao.getInstance();
		boolean mcumulative_buy_plus = mDao.mcumulative_buy_plus(purchase_amount, mid); // 7.member에 누적구매금액 증가
		boolean mPointMinus = mDao.mPointMinus(usemp, mid); //8.쓴 포인트 마이너스
		boolean mPointPlus = mDao.mPointPlus(mpoint, mid); // 9.member에 포인트적립
		coDao.deleteCoupon(cono); // 10. 쓴 쿠폰 삭제
		paDao.addPayment(ono, product_all_pay, discount, couponDiscount, usemp, purchase_amount); //결제정보등록
		 // 11.member 등급 정리 - 자동
		if(productPurchase && mPointMinus && mcumulative_buy_plus && mPointPlus) {
			request.setAttribute("pbuyNowResult", "주문 성공하셨습니다. 주문금액 : "+purchase_amount+"원 포인트 "+mpoint+"점 적립되었습니다.");
			HttpSession session = request.getSession();
			session.setAttribute("member", mDao.getMember(mid));
			request.setAttribute("order_detail", odDao.getOrderDetail(ono));
			request.setAttribute("delivery", dDao.getDelivery(dno));
			request.setAttribute("payment", paDao.getPaymentOno(ono));
			request.setAttribute("addmp", mpoint);
			
		}else {
			request.setAttribute("pbuyNowResult", "품절로 인한 주문 실패하셨습니다. 주문 목록을 확인하여주세요");
		}

	}

}

package com.yl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.service.*;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		
		
		//Main
		if(command.equals("/main.do")) {
			service = new MainService();
			service.execute(request, response);
			viewPage="main/mainpage.jsp";
		}else if(command.equals("/longfoodIntro.do")) {// longfood 소개
//			service = new ProductAll();
//			service.execute(request, response);
			viewPage = "main/longfoodIntro.jsp";
		}
		
		
		//Member
		else if(command.equals("/joinView.do")) {
			request.setAttribute("joinView", true);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/idConfirm.do")) {
			service = new MidDuplicationCheckService();
			service.execute(request, response);
			viewPage = "message/idConfirm.jsp";
		}else if(command.equals("/join.do")) {
			service = new JoinService();
			service.execute(request, response);
			viewPage = "index.jsp";
		}else if(command.equals("/loginView.do")) {
			request.setAttribute("loginView", true);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/login.do")) {
			service = new LoginService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}
		
		// member mypage
		else if(command.equals("/mMypage.do")) {// 미완성
			service = new MMypageViewService();
			service.execute(request, response);
			viewPage = "member/mypage.jsp";
		}else if(command.equals("/mPoint.do")) {
			service = new MPointService();
			service.execute(request, response);
			viewPage = "member/mPoint.jsp";
		}else if(command.equals("/mModify.do")) {
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "mMypage.do";
		}else if(command.equals("/mDelete.do")) {
			service = new MDeleteService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/logout.do")) {//session초기화
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/mBuyHistory.do")) {
			service = new MBuyHistoryService();
			service.execute(request, response);
			viewPage = "member/mBuyHistory.jsp";
		}else if(command.equals("/mBuyDetail.do")) {// 구매 상세
			service = new MBuyDetailService();
			service.execute(request, response);
			viewPage = "member/mBuyDetail.jsp";
		}else if(command.equals("/mDelivery.do")) {
			service = new MDeliveryService();
			service.execute(request, response);
			viewPage = "member/mDelivery.jsp";
		}else if(command.equals("/mDeliveryArrive.do")) {
			service = new MDeliveryArriveService();
			service.execute(request, response);
			viewPage = "mMypage.do";
		}
		
		
		
		//Manager
		else if(command.equals("/mgjoinView.do")) {
			viewPage = "manager/mgjoin.jsp";
		}else if(command.equals("/mgjoin.do")) {
			service = new MgJoinService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/mgidConfirm.do")) {
			service = new MgidDuplicationCheckService();
			service.execute(request, response);
			viewPage = "message/mgidConfirm.jsp";
		}else if(command.equals("/mgloginView.do")) {
			viewPage = "manager/mglogin.jsp";
		}else if(command.equals("/mglogin.do")) {
			service = new MgloginService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/mgPage.do")) {
			service = new MgPageService();
			service.execute(request, response);
			viewPage = "manager/mgPage.jsp";
		}else if(command.equals("/registProductView.do")) {// 매니저 상품등록
			viewPage = "manager/registProduct.jsp";
		}
		
		
		//Product
		else if(command.equals("/registProduct.do")) {
			service = new RegistProduct();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/productAll.do")) {//전체 제품 보기
			service = new ProductAll();
			service.execute(request, response);
			viewPage = "board_product/productAll.jsp";
		}else if(command.equals("/productDetail.do")) {//제품 상세 보기 + 리뷰
			service = new ProductDetail();
			service.execute(request, response);
			viewPage = "board_product/productDetail.jsp";
		}else if(command.equals("/cartAddProduct.do")) {//장바구니 제품 추가
			service = new CartAddProduct();
			service.execute(request, response);
			viewPage = "board_product/productAddCartMessage.jsp";
		}
		
		// 카트
		else if(command.equals("/cartView.do")) {//카트보기
			service = new CartViewService();
			service.execute(request, response);
			viewPage = "cart/cartView.jsp";
		}else if(command.equals("/cartDelProduct.do")) {//카트에서 물품 삭제
			service = new CartDelProductService();
			service.execute(request, response);
			viewPage = "cartView.do";
		}else if(command.equals("/cartBuyProduct.do")) {//카트에서 물품 구매
			service = new CartBuyProductService();
			service.execute(request, response);
			viewPage = "board_product/productPurchaseConfirm.jsp";
		}
		
		//결제
		else if(command.equals("/payment.do")) {//결제 이동페이지 안만듬
			service = new PaymentService();
			service.execute(request, response);
			viewPage = "board_product/productPurchaseAfter.jsp";
		}
		
		//리뷰
		else if(command.equals("/rGoodPlus.do")) {//좋아요
			service = new RGoodPlusService();
			service.execute(request, response);
			viewPage = "board_review/pRGoodMessage.jsp";
		}else if(command.equals("/rCommentWrite.do")) {//관리자 리뷰 댓글 작성
			service = new RCommentWriteService();
			service.execute(request, response);
			viewPage = "productDetail.do?pcode="+(String)request.getAttribute("pcode").toString();
		}else if(command.equals("/rCommentView.do")) {//리뷰 댓글 보기
			service = new RCommentViewService();
			service.execute(request, response);
			viewPage = "board_review/pRcMessage.jsp";
		}else if(command.equals("/rWrite.do")) {//리뷰쓰기
			service = new RWriteService();
			service.execute(request, response);
			viewPage = "productDetail.do?pcode="+(String)request.getAttribute("pcode").toString();
		}
		
		
		
		//csBoards
		else if(command.equals("/csBoardsListService.do")) {//고객센터리스트
			service = new CsBoardsListService();
			service.execute(request, response);
			viewPage = "board_cs/customerService.jsp";
		}else if(command.equals("/csBoardWriteView.do")) {//고객센터글쓰기 ono추가
			service = new CsBoardWriteView();
			service.execute(request, response);
			viewPage = "board_cs/customerServiceWrite.jsp";
		}else if(command.equals("/csBoardWrite.do")) {//고객센터글쓰기
			service = new CsBoardWrite();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/csBoardsSecretCheck.do")) {//비밀글 확인
			service = new CsBoardsSecretCheckService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsSecretCheck.jsp";
		}else if(command.equals("/csBoardsDetail.do")) {//cs글 상세보기
			service = new CsBoardsDetailService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsDetail.jsp";
		}else if(command.equals("/csBoardModifyView.do")) {//수정화면
			service = new CsBoardsModifyViewService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsModify.jsp";
		}else if(command.equals("/csBoardModify.do")) {//수정실행
			service = new CsBoardsModifyService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/csBoardsDelete.do")) {//삭제실행
			service = new CsBoardsDeleteService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/cmCommentWrite.do")) {//관리자 코멘트작성
			service = new CmCommentWriteService();
			service.execute(request, response);
			viewPage = "csBoardsDetail.do?cno="+(String)request.getAttribute("cno").toString();
		}else if(command.equals("/csBoardsReplyView.do")) {
			service = new CsBoardReplyViewService();
			service.execute(request, response);
			viewPage = "board_cs/csBoardsReply.jsp";
		}else if(command.equals("/csBoardsReply.do")) {//답변 실행
			service = new CsBoardReplyService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}

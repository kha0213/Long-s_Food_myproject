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
		}else if(command.equals("/mMypage.do")) {// 미완성
			service = new MMypageViewService();
			service.execute(request, response);
			viewPage = "member/mypage.jsp";
		}else if(command.equals("/mPoint.do")) {// 미완성
			service = new MPointService();
			service.execute(request, response);
			viewPage = "member/mPoint.jsp";
		}else if(command.equals("/mModify.do")) {
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "member/mypage.jsp";
		}else if(command.equals("/mDelete.do")) {//미완성
			service = new MDeleteService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/logout.do")) {//session초기화
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
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
		}
		
		
		//Product
		else if(command.equals("/registProductView.do")) {
			viewPage = "manager/registProduct.jsp";
		}else if(command.equals("/registProduct.do")) {
			service = new RegistProduct();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/productAll.do")) {//전체 제품 보기
			service = new ProductAll();
			service.execute(request, response);
			viewPage = "board/productAll.jsp";
		}else if(command.equals("/productDetail.do")) {//제품 상세 보기 + 리뷰
			service = new ProductDetail();
			service.execute(request, response);
			viewPage = "board/productDetail.jsp";
		}else if(command.equals("/pBuyNow.do")) {//제품 바로 구매
			service = new PBuyNowService();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/cartAddProduct.do")) {//장바구니 제품 구매
			service = new CartAddProduct();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/rGoodPlus.do")) {//좋아요
			System.out.println("들어");
			service = new RGoodPlusService();
			service.execute(request, response);
			viewPage = "productAll.do";
		}
		
		
		
		//csBoards
		else if(command.equals("/csBoardsListService.do")) {//고객센터리스트
			service = new CsBoardsListService();
			service.execute(request, response);
			viewPage = "board/customerService.jsp";
		}else if(command.equals("/csBoardWriteView.do")) {//고객센터글쓰기 ono추가
			service = new CsBoardWriteView();
			service.execute(request, response);
			viewPage = "board/customerServiceWrite.jsp";
		}else if(command.equals("/csBoardWrite.do")) {//고객센터글쓰기
			service = new CsBoardWrite();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}else if(command.equals("/csBoardsSecretCheck.do")) {//비밀글 확인
			service = new CsBoardsSecretCheckService();
			service.execute(request, response);
			viewPage = "board/csBoardsSecretCheck.jsp";
		}else if(command.equals("/csBoardsDetail.do")) {//cs글 상세보기
			service = new CsBoardsDetailService();
			service.execute(request, response);
			viewPage = "board/csBoardsDetail.jsp";
		}else if(command.equals("/csBoardModifyView.do")) {//수정화면
			service = new CsBoardsModifyViewService();
			service.execute(request, response);
			viewPage = "board/csBoardsModify.jsp";
		}else if(command.equals("/csBoardModify.do")) {//수정실행
			service = new CsBoardsModifyService();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}

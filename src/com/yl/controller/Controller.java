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
		
		/* service순서
		 * 1.main.do 메인
		 * 2.joinView.do
		 * 3.idChk.do (미완성)
		 * 4.join.do
		 * 5.loginView.do
		 * 6.login.do
		 * 7.logout.do
		 * 8.mgjoinView.do
		 * 9.mgjoin.do
		 * 10.mgloginView.do
		 * 11.mglogin.do
		 * 12.registProduct.do
		 */
		
		
		if(command.equals("/main.do")) {
			viewPage="main/mainpage.jsp";
		}else if(command.equals("/joinView.do")) {
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
		}else if(command.equals("/logout.do")) {
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/mgjoinView.do")) {
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
		}else if(command.equals("/registProductView.do")) {
			viewPage = "manager/registProduct.jsp";
		}else if(command.equals("/registProduct.do")) {
			service = new RegistProduct();
			service.execute(request, response);
			viewPage = "productAll.do";
		}else if(command.equals("/productAll.do")) {//전체 제품 보기
			service = new ProductAll();
			service.execute(request, response);
			viewPage = "board/productAll.jsp";
		}else if(command.equals("/productDetail.do")) {//제품 상세 보기
			service = new ProductDetail();
			service.execute(request, response);
			viewPage = "board/productDetail.jsp";
		}else if(command.equals("/longfoodIntro.do")) {// longfood 소개
//			service = new ProductAll();
//			service.execute(request, response);
			viewPage = "main/longfoodIntro.jsp";
		}
		
		
		
		
		
		else if(command.equals("/csBoardsListService.do")) {//고객센터리스트
			service = new CsBoardsListService();
			service.execute(request, response);
			viewPage = "board/customerService.jsp";
		}else if(command.equals("/writeCsBoardView.do")) {//고객센터글쓰기
			viewPage = "board/customerServiceWrite.jsp";
		}else if(command.equals("/writeCsBoard.do")) {//고객센터글쓰기
			service = new WriteCsBoard();
			service.execute(request, response);
			viewPage = "csBoardsListService.do";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}

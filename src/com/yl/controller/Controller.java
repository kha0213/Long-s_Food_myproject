package com.yl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.service.JoinService;
import com.yl.service.LoginService;
import com.yl.service.LogoutService;
import com.yl.service.MgJoinService;
import com.yl.service.MgloginService;
import com.yl.service.Service;

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
		}else if(command.equals("/idChk.do")) {
			// 미완성~~!!
			viewPage = "main.do";
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
		}else if(command.equals("/mgidChk.do")) {
			// 미완성~~!!
			viewPage = "main.do";
		}else if(command.equals("/mgloginView.do")) {
			viewPage = "manager/mglogin.jsp";
		}else if(command.equals("/mglogin.do")) {
			service = new MgloginService();
			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}else if(command.equals("/registProductView.do")) {
			viewPage = "manager/registProduct.jsp";
		}else if(command.equals("/registProduct.do")) {
//			service = new RegistProduct();
//			service.execute(request, response);
			viewPage = "main/mainpage.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}

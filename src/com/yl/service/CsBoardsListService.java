package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Customer_service_dao;
import com.yl.dao.Manager_dao;

public class CsBoardsListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		final int PAGESIZE = 12;
		final int BLOCKSIZE = 10;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;

		Customer_service_dao csDao = Customer_service_dao.getInstance();
		

		request.setAttribute("csBoards", csDao.getCustomer_serviceList(startRow, endRow));

		int totalPage = (csDao.getTotalCsBoardsCnt() - 1) / PAGESIZE + 1;
		int startPage = (currentPage - 1) / BLOCKSIZE * BLOCKSIZE + 1;
		int endPage = Math.min(startPage + BLOCKSIZE - 1, totalPage);

		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);

	}

}

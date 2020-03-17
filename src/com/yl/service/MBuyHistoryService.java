package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Member_dao;
import com.yl.dao.Product_dao;

public class MBuyHistoryService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		final int PAGESIZE = 10;
		final int BLOCKSIZE = 5;
		String mid = request.getParameter("mid");
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		Member_dao mDao = Member_dao.getInstance();
		request.setAttribute("orders", mDao.getOrdersPaging(mid, startRow, endRow));
		
		int totalPage = (mDao.getTotalOrders(mid) - 1) / PAGESIZE + 1;
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

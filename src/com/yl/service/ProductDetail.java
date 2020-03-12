package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;
import com.yl.dao.Review_dao;

public class ProductDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		Product_dao pDao = Product_dao.getInstance();
		request.setAttribute("product", pDao.productDetail(pcode));
		
		
		//review paging
		final int PAGESIZE = 10;
		final int BLOCKSIZE = 10;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		Review_dao rDao = Review_dao.getInstance();

		request.setAttribute("reviews", rDao.getReviewList(startRow, endRow));
		int totalPage = (rDao.getTotalReviewsCnt() - 1) / PAGESIZE + 1;
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

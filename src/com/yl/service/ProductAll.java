package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Product_dao;

public class ProductAll implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		final int PAGESIZE = 12;
		final int BLOCKSIZE = 5;

		String pageNum = request.getParameter("pageNum");
		String sortingCriteria = request.getParameter("sortingCriteria");
		String searchPname = request.getParameter("searchPname");
		if(searchPname == null) searchPname="";
		if (sortingCriteria == null || sortingCriteria.equals(""))
			sortingCriteria = "preview_count";
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;

		Product_dao pDao = Product_dao.getInstance();
		
		request.setAttribute("products", pDao.getProductListSort(startRow, endRow, sortingCriteria,searchPname));

		int totalPage = (pDao.getTotalNumberProductSearch(searchPname) - 1) / PAGESIZE + 1;
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

package com.yl.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yl.dao.Product_dao;
import com.yl.dao.Review_dao;
import com.yl.dto.Member_dto;
import com.yl.dto.Review_dto;

public class ProductDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		Product_dao pDao = Product_dao.getInstance();
		request.setAttribute("product", pDao.productDetail(pcode));
		// 리뷰쓰기 가능한지 확인
		Review_dao rDao = Review_dao.getInstance();
		HttpSession session = request.getSession();
		Member_dto member = (Member_dto) session.getAttribute("member");
		if(member !=null) {
			String mid = member.getMid();
			if(rDao.reviewWriteCheck(mid,pcode)) {
				request.setAttribute("reviewWriteCheck", true);
			}
		}
		
		//review paging
		final int PAGESIZE = 10;
		final int BLOCKSIZE = 10;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		ArrayList<Review_dto> reviews = rDao.getReviewListProduct(pcode,startRow, endRow);
		int[] rnos = new int[reviews.size()];
		for(int i=0;i<rnos.length;i++) {
			int rno = reviews.get(i).getRno();
			if(rDao.rcExist(rno)) {//comment있으면 가져와
				request.setAttribute("rc"+rno, rDao.getRc(rno)); 
			}
		}
		request.setAttribute("reviews", reviews);
		int totalPage = (rDao.getTotalProductReviewsCnt(pcode) - 1) / PAGESIZE + 1;
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

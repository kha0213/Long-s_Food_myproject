package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Order_detail_dao;

public class MMypageViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Order_detail_dao oDao = Order_detail_dao.getInstance();
		String mModifyView = request.getParameter("mModifyView");
		if(mModifyView!=null) {
			request.setAttribute("modify", true);
		}
		request.setAttribute("deliveryCnt", oDao.getDeliveryNotArrive().size());
		
	}

}

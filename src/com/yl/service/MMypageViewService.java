package com.yl.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MMypageViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mModifyView = request.getParameter("mModifyView");
		if(mModifyView!=null) {
			request.setAttribute("modify", true);
		}
		
		
	}

}

package com.yl.service;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yl.dao.Orders_dao;

public class MgCalendarService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String yearStr = request.getParameter("year");
		String monthStr = request.getParameter("month");
		String dateStr = request.getParameter("date");
		Calendar cal = Calendar.getInstance();
		int year,month,date;
		if(yearStr == null) {
			year = cal.get(Calendar.YEAR);
		}else {
			year = Integer.parseInt(yearStr);
		}
		if(monthStr == null) {
			month = cal.get(Calendar.MONTH)+1;
		}else {
			month = Integer.parseInt(monthStr);
		}
		if(dateStr == null) {
			date = cal.get(Calendar.DATE);
		}else {
			date = Integer.parseInt(dateStr);
		}
		Orders_dao oDao = Orders_dao.getInstance();
		cal.set(year, month-1, 1);
		int startDate = cal.get(Calendar.DAY_OF_WEEK);
		boolean yunYear = year%4==0; //true 가 윤년
		if(yunYear) yunYear = (year%100!=0);
		int[] maxDate = {31,yunYear?29:28,31,30,31,30,31,31,30,31,30,31};
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("date", date);
		request.setAttribute("maxDate", maxDate[month-1]);
		request.setAttribute("startDate", startDate);
		request.setAttribute("salesDate", oDao.salesDate(year, month, date));
		request.setAttribute("dateOrders", oDao.getDateOrders(year, month, date));
		request.setAttribute("salesMonth", oDao.salesMonth(year, month));
		
	}
	
}

package com.ksense.service;

import javax.servlet.http.HttpServletRequest;

import com.ksense.dao.PhoneDAO;

public class PhoneService {

	public static String processRequest(HttpServletRequest request){
		String respmessage = null;
		PhoneDAO phoneDAO = new PhoneDAO();
		
		String type = request.getParameter("type");
		if("load".equals(type)){
			respmessage = phoneDAO.getBrandList();
		}
		return respmessage;
	}
	
}

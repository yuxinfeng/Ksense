package com.ksense.service;

import javax.servlet.http.HttpServletRequest;

import com.ksense.dao.NoticeDAO;

public class NoticeService {
	public static String processRequest(HttpServletRequest request){
		String respmessage = null;
		
		NoticeDAO noticeDAO = new NoticeDAO();
		
		String type = request.getParameter("type");
		if("load".equals(type)){
			respmessage = noticeDAO.loadNotice();
		}
		
		return respmessage;
	}
}

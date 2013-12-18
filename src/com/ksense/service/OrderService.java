package com.ksense.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ksense.dao.OrderDAO;
import com.ksense.model.Order;
import com.ksense.model.User;

/**
 * @author Gavei
 * @date : 2013-12-15 ÏÂÎç10:30:51
 */

public class OrderService {
	public static String processRequest(HttpServletRequest request){
		String respmessage = null;
		OrderDAO orderDAO = new OrderDAO();
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("LoginUser");
		if(obj == null){
			respmessage = "Erro";
		}else{
			User user = (User)obj;
		
			if("insert".equals(type)){
				Order order = new Order();
				order.setUsername(request.getParameter("username"));
				order.setBank(request.getParameter("bank"));
				order.setBank_no(request.getParameter("bank_no"));
				order.setTran_type(request.getParameter("tran_type"));
				order.setTran_contact(request.getParameter("tran_contact"));
				order.setTran_phone(request.getParameter("tran_phone"));
				order.setAddress(request.getParameter("address"));
				order.setOrder_sum(Integer.parseInt(request.getParameter("sumMonery")));
				order.setOrder_mon(Double.parseDouble(request.getParameter("sumCount")));
				int effectRow = orderDAO.orderInsert(order);
				if(effectRow == 0){
					respmessage = "insertFail";
				}else{
					respmessage = "insertSuccess";
				}
			}
		}
		return respmessage;
	}
}

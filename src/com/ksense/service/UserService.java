package com.ksense.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.ksense.dao.UserDAO;
import com.ksense.model.User;

public class UserService {
	public static String processRequest(HttpServletRequest request){
		String respmessage = null;
		UserDAO userDAO = new UserDAO();
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("LoginUser");
		if(obj == null){
			respmessage = "Erro";
		}else{
			User user = (User)obj;
		
			if("load".equals(type)){
				respmessage = userDAO.loadUser(user.getUsername());
			}else if("baseupdate".equals(type)){
				User users = new User();
				users.setUsername(request.getParameter("username"));
				users.setName(request.getParameter("name"));
				users.setQq(request.getParameter("qq"));
				users.setEmail(request.getParameter("email"));
				users.setContact(request.getParameter("contact"));
				users.setRemark(request.getParameter("remark"));
				users.setBank(request.getParameter("bank"));
				users.setBank_no(request.getParameter("bank_no"));
				users.setTran_type(request.getParameter("tran_type"));
				users.setTran_contact(request.getParameter("tran_contact"));
				users.setTran_phone(request.getParameter("tran_phone"));
				users.setAddress(request.getParameter("address"));
				int effectRow = userDAO.baseUpdate(users);
				if(effectRow == 0){
					respmessage = "updateFail";
				}else{
					respmessage = "updateSuccess";
				}
			}else if("passwordupdate".equals(type)){
			
				String password = user.getPassword();
				if(password.equals(request.getParameter("password"))){
					String username = user.getUsername();
					int effectRow = userDAO.passwordUpdate(username,request.getParameter("password"));
					if(effectRow == 0){
						respmessage = "updateFail";
					}else{
						respmessage = "updateSuccess";
					}
					
				}else{
					respmessage = "passwordErro";
				}
			}
		}
		return respmessage;
	}
}

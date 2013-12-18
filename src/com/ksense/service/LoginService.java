package com.ksense.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ksense.dao.UserDAO;
import com.ksense.model.User;

/**
 * @author Gavei
 * @date : 2013-12-11 下午11:32:24
 */

public class LoginService {
	public static String doLogin(HttpServletRequest request) {
		
		String respMessage = null;
		String type = request.getParameter("type");
		UserDAO userDAO = new UserDAO();
		
		if("login".equals(type)){
			
			HttpSession session = request.getSession();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			User user = userDAO.getUser(username, password);
			
			if(user == null){
				respMessage = "loginFail";
				
			}else{
				if("新建".equals(user.getStatus())){
					respMessage = "accountFail";
				}else{
					session.setAttribute("LoginUser", user);
					respMessage = "loginSuccess";
				}
			}
		}else if("reg".equals(type)){
			String username = request.getParameter("username");
			if(userDAO.userCount(username)!= 0){
				respMessage = "accountFail";
			}else{
				User user = new User();
				user.setUsername(username);
				user.setPassword(request.getParameter("password"));
				user.setName(request.getParameter("name"));
				user.setQq(request.getParameter("qq"));
				user.setEmail(request.getParameter("email"));
				user.setContact(request.getParameter("contact"));
				user.setStatus("新建");
				int effectRow = userDAO.userInsert(user);
				if(effectRow == 0){
					respMessage = "regFail";
				}else{
					respMessage = "regSuccess";
				}
			}
		}

		return respMessage;
	}
}

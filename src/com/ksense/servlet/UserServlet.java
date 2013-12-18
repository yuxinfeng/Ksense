package com.ksense.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ksense.service.UserService;

/**
 * @author Gavei
 * @date : 2013-12-12 下午01:52:37
 */

public class UserServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String respmessage = UserService.processRequest(request);
		
		PrintWriter out = response.getWriter();
		out.print(respmessage);
		out.close();
	}
	
}

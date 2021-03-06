package com.ksense.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ksense.service.PhoneService;

/**
 * @author Gavei
 * @date : 2013-12-14 下午03:46:58
 */

public class PhoneServlet extends HttpServlet{
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String respmessage = PhoneService.processRequest(request);
			
			PrintWriter out = response.getWriter();
			out.print(respmessage);
			out.close();
		}
		
}

package com.ksense.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ksense.service.OrderService;

/**
 * @author Gavei
 * @date : 2013-12-15 ����10:27:33
 */

public class OrderServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4540159912077541710L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��������Ӧ�ı��������ΪUTF-8����ֹ�������룩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String respmessage = OrderService.processRequest(request);
		
		PrintWriter out = response.getWriter();
		out.print(respmessage);
		out.close();
	}
}

<%@ page language="java"  pageEncoding="gb2312"%>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import= "javax.servlet.http.HttpServletResponse" %>

	<%
		Object obj = session.getAttribute("LoginUser");
		if(obj != null){
			session.invalidate();
		}
		response.sendRedirect("../index.jsp");
		
	%>
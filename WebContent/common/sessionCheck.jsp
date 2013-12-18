<%@ page language="java"  pageEncoding="GB2312"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.ksense.model.User" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import= "javax.servlet.http.HttpServletResponse" %>

	<%
		Object obj = session.getAttribute("LoginUser");
		if(obj == null){
			response.sendRedirect("index.jsp");
		}
	%>
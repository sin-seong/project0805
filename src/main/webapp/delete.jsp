<%@page import="module.SocialDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = request.getParameter("id");
request.setCharacterEncoding("UTF-8");
SocialDAO dao = new SocialDAO();
dao.deleteSc(Integer.parseInt(id));
response.sendRedirect("comyu.jsp");

%>
    


<%@page import="module.SocialDTO"%>
<%@page import="module.SocialDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String title = request.getParameter("title");
String name = request.getParameter("name");
String text = request.getParameter("text");
SocialDAO dao = new SocialDAO();
SocialDTO dto = new SocialDTO(Integer.parseInt(id),name,title ,text , null, 0);
dao.updateSc(dto);
response.sendRedirect("comyu.jsp");

%>
    

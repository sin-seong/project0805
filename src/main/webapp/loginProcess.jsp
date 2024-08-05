<%@page import="module.PlayerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	PlayerDAO dao = new PlayerDAO();
	
	if(dao.checkLogin(username, password)) {
		
		Cookie lgCookie = new Cookie("username", username);
		lgCookie.setMaxAge(60*60);
		response.addCookie(lgCookie);
		out.println("<script type='text/javascript'>");
        out.println("alert('환영합니다" + username + "님!');");
        out.println("window.location.href = 'syHome.jsp';");
        out.println("</script>");
	}else {
    	out.println("<script type='text/javascript'>");
        out.println("alert('로귄실패 !');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    	
    }
	

%>


</body>
</html>
<%@page import="module.PlayerDTO"%>
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
String tel = request.getParameter("tel");
String email = request.getParameter("email");
PlayerDAO dao = new PlayerDAO();
PlayerDTO newAc = new PlayerDTO(0,username, password, tel, email);
dao.regPl(newAc);

out.println("<script type='text/javascript'>");
out.println("alert(' " + username + "님 회원가입을 환영합니다');");
out.println("window.location.href = 'login.jsp';");
out.println("</script>");

%>

</body>
</html>
<%@page import="module.SocialDTO"%>
<%@page import="module.SocialDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 String id = request.getParameter("id");
 SocialDAO dao = new SocialDAO();
 SocialDTO dto = dao.getOne(Integer.parseInt(id));
 
	Cookie[] cookies = request.getCookies();
	String username	= null;


if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("username")) {
			username = cookie.getValue();
			break;
		}
	}
}
%>   
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
 <!--   <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
    <style>
        table { width:1000px; text-align:center; font-size: 30px; }
        th    { width:100px; background-color:gray; font-size: 30px;}
        .size {width:100px; height: 50px; font-size: 20px;}
        .sis {font-size: 20px;}
        input[type=text], textarea { width:100%; }
    </style>
</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="syHome.jsp">월드 스카이 스트림</a></h1>

            <ul id="gnb">
                <li><a href="#">DEPARTMENT</a></li>
                <li><a href="#">GALLERY</a></li>
                <li><a href="https://www.youtube.com/@LCK">YOUTUBE</a></li>
                <li><a href="comyu.jsp">카뮤니티</a></li>
                <li><a href="#">LOCATION</a></li>
            </ul>

            <ul class="util">
                <li><a href="#">Contact</a></li>
                <li><a href="#">도움말</a></li>
                <%
			        if (username != null){
			    %>
			       <li><a><%=username %></a><il>
			    <li><a href ="logout.jsp">로그아웃</a></li>
			    <%
			    }else{
			    %>
                <li><a href="login.jsp">로그인</a></li>
                <%
			    }
                %>
                <li><a href="#">Join</a></li>
                <li><a href="#">Sitemap</a></li>
            </ul>
        </div>
    </header>


    <form method="post" action="update.jsp">
	<input type = "hidden"name="id" value ="<%=id %>">
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"  maxlength="80"
                       value="<%=dto.getTitle() %>" class = "size">
            </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="name" maxlength="20"
                       value="<%=dto.getName() %>"class = "size">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="text" rows="10" class="sis"><%=dto.getText() %></textarea>
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
</form>

    <section>
        <div class="inner">
            <h1>RECENT NEWS</h1>
            <div class="wrap">
                <article>
                    <div class="pic">
                        <img src="img/news1.jpg" alt="1번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news2.jpg" alt="2번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news3.jpg" alt="3번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news4.jpg" alt="4번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>
            </div>
        </div>
    </section>

    <footer>
        <div class="inner">
            <div class="upper">
                <h1>DCODELAB</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    태평양 186번 지구<br>
                    TEL : 031-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2077 WolrdsMoll &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>




</body>

</html>
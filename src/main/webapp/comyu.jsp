<%@page import="module.SocialDAO"%>
<%@page import="java.util.List"%>
<%@page import="module.SocialDTO"%>
<%@page import="module.PlayerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 SocialDAO dao = new SocialDAO();
 List<SocialDTO> list = dao.getsocialList();

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
    
        table     { width:1220px; text-align:center;
        	     	margin: auto; }
        h1		 {text-align: center ; color: navy;}
        th        { background-color:gray; font-size: 20px;}
       
      	.sis		{font-size: 20px;}
        .num      { width:80px; }
        .title    { width:130px; }
        .writer   { width:240px; }
        .regtime  { width:170px; }
        .hit	  { width:50px;}
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>

<body>

    <header>
    
    <%
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
   
   <h1> 게시판띠</h1>
<table>
	<tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th class="hit"    >조회수  </th>
    </tr>
    <%
    for(SocialDTO dto : list){
    %>
    <tr>
    <td><%=dto.getName() %></td>
    <td style="text-align:left;">
    <a href="view.jsp?id=<%=dto.getId() %>"><%=dto.getTitle() %></a>
    </td>
    <td><%=dto.getName() %></td>
    <td><%=dto.getLivtime() %></td>
    <td><%=dto.getHit() %></td>
    </tr>
    <%
    }
    %>
    <br>
	<td><input type="button" value="글쓰기" onclick="location.href='write.jsp'" class="sis"></td>
    </table>

 
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
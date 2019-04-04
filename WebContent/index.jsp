<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>JSP 실시간 회원제 채팅 서비스</title>
<link rel = "stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/header.css">
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
<style>
	video {
	position: absolute;
	top: 70px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1000;
	overflow: hidden;
	}
</style>
</head>
<body>
<header>
    <div class = "wrapper">
        <h1>R.C Service</h1>
        <nav>
            <ul class = "menu">
                <li><a href="index.jsp">Home</a></li>
                <%
                System.out.println(session.getAttribute("id"));
                if(session.getAttribute("id")!=null){
                %>
                <li><a href="modify.jsp">User</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="">Chat</a></li>
                <li><a href="board_List.jsp">Board</a></li>
                <%
                } else if(session.getAttribute("id") == null){
                %>
                <li><a href="login.jsp">User</a></li>
                <%
                }
                %>
                
                
            </ul>
        </nav>
    </div>
    <div>
    <video src = "space.mp4" autoplay = "autoplay" loop="loop">
	</video>
    </div>


</header>

</body>
</html>
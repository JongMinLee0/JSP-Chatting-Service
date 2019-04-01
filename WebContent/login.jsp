<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/header.css">
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
<title>로그인 페이지 입니다.</title>
<style>
    .container {width: 70%; height: 70%; margin: 40px auto; background: black;}
    .outer {display: table; width: 100%; height: 100%; }
	.inner {display:table-cell; vertical-align: middle; text-align: center;}
	.centered {position: relative; display: inline-block; width: 50%; height: 30%; padding: 1em; background: black; color:black; text-align:center;}
</style>
</head>
<body>
    <header>
    <div class = "wrapper">
        <h1>R.C Service</h1>
        <nav>
            <ul class = "menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">User</a></li>
                <li><a href="">Chat</a></li>
                <li><a href="">Board</a></li>
                <li><a href="">Product</a></li>
            </ul>
        </nav>
    </div>
    </header>
    <div class="container">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<div class = "login">
					    <br />
					    <form action = "FrontController" method = "post">
                        <input type = "text" placeholder = "아이디" name = "id"><br /><br />
                        <input type = "password" placeholder="비밀번호" name = "pw" ><br /><br />
                        <input type = "hidden" name = "what" value = "login">
                        <input type = "hidden" name = "result" value = "result">
                        <input type = "submit" value = "로그인" >&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type = "button" value = "회원가입" onclick = "location.href='register.jsp'">
                        </form>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<%
	String result_login = (String)request.getAttribute("result");
	if(result_login !=null){
	  if(result_login.equals("sucess")){
	%>
	<script>
	    alert("로그인에 성공했습니다.");
	    document.location.href="index.jsp";
	</script>
    <%  
	} else if(result_login.equals("fail")){
	%>
	<script>
	    alert("로그인에 실패했습니다.");
	    document.location.href="login.jsp";
	</script>
    <%
	  }
	}
    %>
	
	
</body>
</html>
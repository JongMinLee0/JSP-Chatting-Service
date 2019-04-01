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
	.centered {position: relative; display: inline-block; width: 50%; 
	           height: 30%; padding: 1em; background: black; color:black; text-align:left;}
	
</style>

<script>
    function checkValue(){
    	if(!document.userInfo.id.value){
    		alert("아이디를 입력하세요.");
    		return false;
    	}
    	if(!document.userInfo.pw.value){
    		alert("비밀번호를 입력하세요.");
    		return false;
    	}
    	if(document.userInfo.pw.value != document.userInfo.pwcheck.value){
    		alert("비밀번호를 동일하게 입력하세요.");
    		return false;
    	}
    }
</script>
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
					    <form action = "FrontController" method = "post" name = "userInfo" onsubmit = "return checkValue()">
                        <span style = "color:white">아이디 :</span>&nbsp;<input type = "text" placeholder = "아이디" name = "id">&ensp;
                        <input type = "button" value ="ID중복검사" onclick = "location.href='register.jsp'">
                        <br /><br />
                        <span style = "color:white">비밀번호 :</span>&nbsp;<input type = "password" placeholder="비밀번호" name = "pw" ><br /><br />
                        <span style = "color:white">비밀번호확인 :</span>&nbsp;<input type = "password" placeholder="비밀번호확인" name = "pwcheck" ><br /><br />
                        <span style = "color:white">전화번호 :</span>&nbsp;<input type = "text" name = "phone1" size = "5"; value = "010">
                                 &nbsp;<span style = "color:white">-</span>&nbsp;
		                         &nbsp;<input type="text" name="phone2" size="5">&nbsp;<span style = "color:white">-</span>&nbsp;
		                         <input type="text" name="phone3" size="5"> <br /><br />
		                <span style = "color:white">닉네임 :</span>&nbsp;<input type = "text" placeholder="닉네임" name = "nick" >&ensp;
		                <input type = "button" value ="닉네임중복검사" onclick = "location.href='register.jsp'">
		                <br /><br /><br />
		                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		                <input type = "hidden" value = "pages" name = "pages">
		                <input type = "hidden" value = "register" name = "what">
		                <input type = "submit" value = "회원가입완료">
		                <input type = "button" value = "취소" onclick="location.href='login.jsp'">
		                </form>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<%
	String result_page = (String)request.getAttribute("pages");
	if(result_page !=null){
	  if(result_page.equals("sucess")){
	%>
	<script>
	    alert("회원가입에 성공했습니다.");
	    document.location.href="login.jsp";
	</script>
    <%  
	} else if(result_page.equals("fail")){
	%>
	<script>
	    alert("회원가입에 실패했습니다.");
	    document.location.href="register.jsp";
	</script>
    <%
	  }
	}
    %>
	

</body>
</html>
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
<title>회원수정 페이지 입니다.</title>
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
                <li><a href="modify.jsp">User</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="">Chat</a></li>
                <li><a href="board_List.jsp">Board</a></li>
            </ul>
        </nav>
    </div>
    <%
    String sessionId = session.getAttribute("id").toString();
    String sessionNick = session.getAttribute("nick").toString();
    String sessionPw = session.getAttribute("pw").toString();
    %>
    </header>
    <div class="container">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<div class = "login" name = "userInfo">
					    <br />
					    <span style = "color:white; font-size:25px;"><%=sessionNick%> 님의 회원정보를 수정하시겠습니까?</span><br /><br /><br />
                        <input type = "text" value ="<%= sessionId %>"><br /><br />
                        <input type = "password" placeholder="비밀번호" name = "pw" ><br /><br />
                        <input type = "hidden" name = "what" value = "modify">
                        <input type = "hidden" name = "result" value = "result">
                        <input type = "button" value = "회원정보수정하기" onclick = "checkValue()">
                    </div>
				</div>
			</div>
		</div>
	</div>
<script>
    function checkValue(){
    	if(!document.getElementsByName("pw")[0].value){
    		alert("비밀번호를 입력하세요.");
    		document.location.href = "modify.jsp";
    	}else{
    		var pw2 = document.getElementsByName("pw")[0].value;
    		var pw = "<%= sessionPw %>";
    		document.write(pw);
    		document.write(pw2);
    		if(pw2 == pw){
    			document.location.href = "modify_2.jsp"
    		}else{
    			alert("비밀번호가 틀렸습니다.");
    			document.location.href = "modify.jsp";
    		}
    	}
    }
        
</script>
	
	
	
</body>
</html>
<%@ page import = "chat.ex.member_DAO" %>
<%@ page import = "chat.ex.member_DTO" %>
<%@ page import = "java.util.*" %>
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
<title>회원수 페이지 입니다.</title>
<style>
    .container {width: 70%; height: 70%; margin: 40px auto; background: black;}
    .outer {display: table; width: 100%; height: 100%; }
	.inner {display:table-cell; vertical-align: middle; text-align: center;}
	.centered {position: relative; display: inline-block; width: 50%; 
	           height: 30%; padding: 1em; background: black; color:black; text-align:left;}
	
</style>

<script>
    /* boolean nickover = false; */
    function checkValue(){
    	
    	if(!document.userInfo.pw.value){
    		alert("비밀번호를 입력하세요.");
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
                <li><a href="modify.jsp">User</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="board_List.jsp">Board</a></li>
            </ul>
        </nav>
    </div>
    </header>
    <%
	String sessionId = session.getAttribute("id").toString();
    String sessionPw = session.getAttribute("pw").toString();
	%>
    <div class="container">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<div class = "login">
					    <br />
					    <form action = "FrontController" method = "post" name = "userInfo" onsubmit = "return checkValue()">
                        <span style = "color:white">아이디 :&nbsp; <%=sessionId %></span>
                        <br /><br />
                        <span style = "color:white">비밀번호 :</span>&nbsp;<input type = "password" placeholder="비밀번호" name = "pw" ><br /><br />
                        <span style = "color:white">전화번호 :</span>&nbsp;<input type = "text" name = "phone1" size = "5"; value = "010">
                                 &nbsp;<span style = "color:white">-</span>&nbsp;
		                         &nbsp;<input type="text" name="phone2" size="5">&nbsp;<span style = "color:white">-</span>&nbsp;
		                         <input type="text" name="phone3" size="5"> <br /><br />
		                <span style = "color:white">닉네임 :</span>&nbsp;<input type = "text" placeholder="닉네임" name = "nick" >&ensp;
		                <input type = "button" value ="닉네임중복검사" onclick = "return checkNick()">
		                <br /><br /><br />
		                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		                <input type = "hidden" value = "pages" name = "pages">
		                <input type = "hidden" value = "modify" name = "what">
		                <input type = "submit" value = "회원수정완료">
		                <input type = "button" value = "취소" onclick="location.href='index.jsp'">
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
	    alert("회원수정에 성공했습니다.");
	    document.location.href="index.jsp";
	</script>
    <%  
	} else if(result_page.equals("fail")){
	%>
	<script>
	    alert("회원수정에 실패했습니다.");
	    document.location.href="modify_2.jsp";
	</script>
    <%
	  }
	}
    %>
	<%
	member_DAO dao = new member_DAO();
	ArrayList<member_DTO> dtos = dao.memberSelect();
	ArrayList<String> nickList = new ArrayList<String>();
	member_DTO dto = new member_DTO();
	for(int i=0; i<dtos.size(); i++){
		dto = dtos.get(i);
		String nick2 = dto.getNick();
		nickList.add(nick2);
	}
	StringBuffer values2 = new StringBuffer();
	for(int i = 0; i<nickList.size(); i++){
		if(values2.length()>0){
			values2.append(',');
		}
		values2.append('"').append(nickList.get(i)).append('"');
	}
	%>
	<script>
	function checkNick(){
		var nickover = false;
		var nick = document.getElementsByName("nick");
		var flag = true;
		/* debugger; */
		var list = [<%=values2.toString()%>];
		for(var i=0; i<list.length; i++){
			if(nick[0].value==list[i]){
				flag = false;
				break;
			}
		}
		if(flag){
			nickover = true;
			alert("사용 가능한 닉네임 입니다.");
		}
		else
			alert("중복된 닉네임 입니다.");
	}
	</script>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/header.css">
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>게시판 입니다.</title>
<style>
    .container{
        left: 18%;
        position: relative;
        top: 30%;
        transform: translateY(-50%);
    }

  #button{
      position: relative;
      left: 49%;
  }

</style>
<script>
function checkValue(){
	if(!document.board_write.board_title.value){
		alert("제목을 입력하세요.");
		return false;
	}
	if(!document.board_write.put_content.value){
		alert("내용을 입력하세요.");
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
                <li><a href="">Chat</a></li>
                <li><a href="board_List.jsp">Board</a></li>
            </ul>
        </nav>
    </div>
    </header>
    <div class="container">
		<div class = "inner-container">
		    <form action = "FrontController" method = "post" name = "board_write" onsubmit = "return checkValue()">
		    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		        <input type="text" name = "board_title" size = "74px" placeholder = "제목">
		        <br /><br />
		        <textarea name="put_content" rows=10 style="width:54%;" placeholder = "내용을 입력하세요."></textarea>
		        <br /><br />
		        <input type = "hidden" value = "board_write" name = "what">
		        <input type = "hidden" value = "pages" name = "pages">
		        <input type = "submit" id = "button" value = "글작성">
		    </form>
		</div>
	</div>
    <%
	String result_page = (String)request.getAttribute("pages");
	if(result_page !=null){
	  if(result_page.equals("sucess")){
	%>
	<script>
	    alert("글이 작성되었습니다.");
	    document.location.href="board_List.jsp";
	</script>
    <%  
	} else if(result_page.equals("fail")){
	%>
	<script>
	    alert("글작성에 실패했습니다.");
	    document.location.href="board_write.jsp";
	</script>
    <%
	  }
	}
    %>

</body>
</html>
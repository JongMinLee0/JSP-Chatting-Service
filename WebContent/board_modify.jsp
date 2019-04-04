<%@ page import = "chat.ex.board_DAO" %>
<%@ page import = "chat.ex.board_DTO" %>
<%@ page import = "java.util.*" %>
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
    <% 
    int index = Integer.parseInt(request.getParameter("answer")); 
    board_DAO dao = new board_DAO();
	ArrayList<board_DTO> dtos = dao.boardSelect();
	board_DTO dto = new board_DTO();
	String title ="";
	String content = "";
	dto = dtos.get(index);
    title = dto.getTitle();
    content = dto.getContent();
		
    %>
    <div class="container">
		<div class = "inner-container">
		    <form action = "FrontController" method = "post" name = "board_write" onsubmit = "return checkValue()">
		    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		        <input type="text" name = "board_title" size = "74px" value = "<%= title %>">
		        <br /><br />
		        <textarea name="put_content" rows=10 style="width:54%;"><%= content %></textarea>
		        <br /><br />
		        <input type = "hidden" value = "board_modify" name = "what">
		        <input type = "hidden" value = "pages" name = "pages">
		        <input type = "hidden" value = "<%=index %>" name = "index">
		        <input type = "button" value = "뒤로" onclick = "location.href='board_show.jsp?answer=<%=index %>'" id ="button">
		        <input type = "submit" id = "button" value = "수정완료">
		    </form>
		</div>
	</div>
</body>
</html>
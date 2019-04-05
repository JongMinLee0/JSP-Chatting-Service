<%@ page import = "chat.ex.board_DAO" %>
<%@ page import = "chat.ex.board_DTO" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
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
    #title{
      width: 400px;
  }
	 table, th, td {
	 text-align: center;
	 color: white;
     border: 1px solid white;
  }
  #title{
      width: 400px;
  }
  #head{
      width: 80px;
  }
  #button{
      position: relative;
      left: 53%;
  }
  td a{line-height: 20px; color: white; display: block; text-decoration: none;}
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
                <li><a href="board_List.jsp">Board</a></li>
            </ul>
        </nav>
    </div>
    </header>
    <div class="container">
		<div class = "inner-container">
		    <table>
		        <thead>
		        <tr>
		            <th id = "head">번호</th>
		            <th id = "title">제목</th>
		            <th id = "head">작성자</th>
		            <th id = "head">조회수</th>
		        </tr>
		        </thead>
		        <tbody>
		        <%
		        board_DAO dao = new board_DAO();
		    	ArrayList<board_DTO> dtos = dao.boardSelect();
		    	ArrayList<board_DTO> dtos2 = new ArrayList<board_DTO>();
		    	board_DTO dto = new board_DTO();
		    	for(int i=0; i<dtos.size(); i++){
		    		dtos2.add(dtos.get(i));
		    	}
		    	for(int k=0; k<dtos.size(); k++){
		    		dto = dtos2.get(dtos.size()-1-k);
		    		String nick = dto.getNick();
		    		String title = dto.getTitle();
		    		String num = dto.getNum();
		    		int index = dtos.size()-1-k;
		    	%>
		            <tr>
		            <td><%= index+1 %></td>
		            <td><a href="board_show.jsp?answer=<%= index %>"><%= title %></a></td>
		            <td><%= nick %></td>
		            <td><%= num %></td>
		            </tr>
		        <%
		    	}
		        %>
		        </tbody>
		    </table>
		    <br />
		          <input type = "button" id = "button" value = "글작성" onclick = "location.href='board_write.jsp?index=<%=dtos.size()+1%>'">
		</div>
	</div>
    

</body>
</html>
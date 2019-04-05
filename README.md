# JSP_BOARD

<br />

## 1. 게시판 기능

<br />

#### 1. 홈페이지 화면(index.jsp)

<img src="./img/바탕화면.png" width ="70%">

<br />

- HOME 버튼을 누르면 Home page로 돌아오게 되고 USER를 클릭하게 되면 로그인 화면으로 전환된다.

<br />

#### 2. 로그인 화면(login.jsp)

<img src="./img/로그인화면.png" width ="70%">

<br />

- 회원가입을 누른뒤 회원가입 page로 넘어가 보자.

<br />

#### 3. 회원가입 화면(register.jsp)

##### 3-1. 아이디 중복확인

<img src="./img/아이디인증.png" width ="70%">
<img src="./img/아이디중복.png" width ="70%">

- 아이디가 중복되지 않으면 인증에 성공하며 중복될 경우 경고창으로 알려준다.

<br />

##### 3-2. 닉네임 중복확인

<img src="./img/닉네임인증.png" width ="70%">

- 아이디와 마찬가지로 중복체크 기능이 있다.

<br />

##### 3-3. 공란으로 회원가입시

<img src="./img/아이디공란.png" width ="70%">
<img src="./img/비밀번호공란.png" width ="70%">

- 아무것도 입력하지 않고 회원가입을 누를 경우 각각의 경고창이 발생한다.

<br />

##### 3-4. 회원가입 성공시

<img src="./img/회원가입성공.png" width ="70%">

- 회원가입성공시 로그인 page로 넘어가게 되며, 실패시 회원가입 page에 머무른다.

<br />

#### 4. 로그인실패와 성공

<img src="./img/로그인실패.png" width ="70%">

- 로그인 실패시 화면에 경고창이 나오며 다시 시도해야한다. 

<br />

<img src="./img/로그인성공.png" width ="70%">

- 로그인성공시 home으로 돌아오며 logout버튼과 board버튼이 생성된다.

<br />

#### 5. 게시판(board_List.jsp)

<img src="./img/초기목록.png" width ="70%">

- 글작성을 누르게되면 글작성 페이지로 넘어간다.

<br />

##### 5-1. 글작성(board_write.jsp)

<img src="./img/글작성화면.png" width ="70%">
<img src="./img/글작성.png" width ="70%">
<img src="./img/글작성완료.png" width ="70%">
<img src="./img/글작성후.png" width ="70%">

<br />

##### 5-2. 조회수

<img src="./img/조회수증가.png" width ="70%">

- 제목을 클릭하여 글을 볼 수 있으며, 조회수가 증가하게 된다.

<br />

##### 5-3. 글 수정(board_modify.jsp)

<img src="./img/제목누른뒤.png" width ="70%">
<img src="./img/수정화면.png" width ="70%">
<img src="./img/수정결과.png" width ="70%">

- 제목을 클릭하여 들어가게 되면 오른쪽 밑에 수정버튼이 생긴다.
- 수정버튼을 클릭하면 수정화면으로 넘어간다.
- 제목과 글을 수정한 후 수정완료를 클릭하면 수정이 완료된다.

<br />

## 2. 소스 코드 및 구조

<br />

### 홈페이지 화면
```jsp
<!-- index.jsp -->
<%
    if(session.getAttribute("id")!=null){
%>
    <li><a href="modify.jsp">User</a></li>
    <li><a href="logout.jsp">Logout</a></li>
    <li><a href="board_List.jsp">Board</a></li>

```
- if조건문을 활용, 세션에 id값이 없으면 로그인 한 것이 아니므로 접근 불가능한 페이지목록을 숨겼다.

<br />

```jsp
<video src = "space.mp4" autoplay = "autoplay" loop="loop">
```
- 비디오 파일을 폴더에 저장하여 홈페이지에서 배경화면으로서 동작하게 하였다.

<br />

### 회원가입

아이디 중복검사와 닉네임 중복검사는 같은 로직으로 구현되었다.
```jsp
<input type = "button" value ="ID중복검사" onclick="return checkOver()" >
```

```javascript
<script>
	function checkOver(){
		var idover = false;
		var id = document.getElementsByName("id");
		var flag = true;
		var list = [<%=values.toString()%>];
		for(var i=0; i<list.length; i++){
			if(id[0].value==list[i]){
				flag = false;
				break;
			}
		}
		if(flag){
			idover = true;
			alert("사용 가능한 아이디 입니다.");
		}
		else
			alert("중복된 아이디 입니다.");
	}
</script>
```
- form tag를 사용하려고 하였으나 회원가입시 input_submit을 이용하였기 때문에 button을 이용하였다.
- onclick을 이용하여 javascript함수를 호출하도록 했다.

```sh
documet.getElementsByName("id")
```
- 입력한 id값과 DB에 저장된 아이디 값을 비교하여 결과를 출력했다.

<br />

아이디와 비밀번호가 공란으로 가입할 경우
```jsp
<form action = "FrontController" method = "post" name = "userInfo" onsubmit = "return checkValue()">
```

```javascript
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
```

- form tag에 onsubmit을 이용하여 함수를 호출하도록 했다.

<br />

##### 이 외에도 있지만 대부분 비슷한 방법으로 설계되었다. 프로젝트를 하면서 가장 크게 느낀점은 각 부분에서 서로간의 값 전달이 가장 중요하다 느꼈으며, DataBase와의 통신이 중요하다고 느겼다.

<br />

### 구조
#### 1. FrontController
jsp파일에서 가장 먼저 값을 보내는 부분이다. jsp파일에서 요청을 하면 모든 요청이 FrontController로 들어오게 되며 그 요청사항을 다른 클래스 파일로 보내어 처리한뒤 뷰페이지로 응답해준다.
들어온 응답을 구분해주기 위해서 hidden type을 이용했다.

```jsp
<input type = "hidden" value = "register" name = "what">
```

```java
String path = request.getParameter("what");
		try {
			if(path.equals("register")) {
				registerAction act = new registerAction();
				act.execute(request, response);
			} else if(path.equals("login")) {
				loginAction act = new loginAction();
				act.execute(request, response);
```
hidden type의 value로써 register를 주었고 이 값은 submit을 통해서 전달된다. 이 값을 읽어드려 조건문을 이용 요청을 다른 class에 전달한다.

<br />

#### 2. Interface
Java class 들을 보면 implements Action이 추가된 것을 볼 수 있다. class들을 Interface로 구현하여 FrontController에서의 작동을 편리하게 만들었다.

```java
public interface Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
```

<br />

#### 3. DTO / DAO
데이터 베이스와의 연결, 수정, 조회 등은 DTO와 DAO를 만들어서 수행했다. 대신 회원들을 관리하는 DTO, DAO와 게시판을 관리하는 DTO, DAO를 따로 만들어 사용했다.

<br />

DTO에서는 데이터베이스에서 사용할 변수들을 선언해 주어 getter, setter를 만들었다.

- DAO 데이터베이스 연결부분

```java
private String url = "jdbc:oracle:thin:@localhost:1521:xe";
private String uid = "jongmin";
private String upw = "******";
	
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection(url, uid, upw);
stmt = con.createStatement();
rs = stmt.executeQuery("select * from chat");
```
데이터베이스는 Oracle을 사용하였는데 가장 애먹었던 부분은 쿼리문을 작성하는 것 이었다.

```java
stmt.executeUpdate("insert into chat values('" + dto.getId() + "','" + dto.getPw() + "','" + dto.getPhone1() + "','"
+ dto.getPhone2() + "','" + dto.getPhone3() + "','" + dto.getNick() + "')");
```
위와 같이 따음표로 인한 오류가 많아 어려움을 겪었으며, Table을 두개 사용하다보니 Table명이나 변수 명이 혼동되어 에러가 발생하는 일이 잦았다.

<br />

#### 4. JSP와 Servlet과의 연결
JSP와 Servlet간의 값 전달은 request.getParameter / request.getAttribute / request.setAttribute 등을 통하여 했다.

```java
request.setAttribute("result", result);
ServletContext context = request.getServletContext();
RequestDispatcher dispatcher = context.getRequestDispatcher("/login.jsp");
dispatcher.forward(request, response);
```
servlet에서 forward로 jsp에 값을 넘겨주는 코드이다. login.jsp로 값을 전달하고 있다.

<br />

#### 5. 기타

게시판을 만들 때 form tag가 아닌 버튼으로써 값을 넘겨줘야 했다. 따라서 url에 값을 추가하는 방식을 사용했다.

```jsp
<input type = "button" id = "button" value = "수정" onclick = 
"location.href='board_modify.jsp?answer=<%=index%>'">
```

answer = index값을 전달하고 있는데 JSP변수 값을 출력해야 해서 <%= %>를 사용했다.

<br />

조회수의 증가는 제목을 클릭해 글에 들어온 경우 그 글의 index에 맞는 DB값을 1씩 증가시켜서 구현했다.

```java
dao.indexUpdate(dto, index);
//-------------------------- 밑의 부분이 indexUpdate에 들어있는 query update부분
result = stmt.executeUpdate("update chat_board set click = '"+ dto.getNum() 
+ "'where seq2 = '" + index3 + "'");
```


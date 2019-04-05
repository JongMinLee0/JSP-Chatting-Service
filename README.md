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

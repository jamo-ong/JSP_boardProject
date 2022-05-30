<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판 PROJECT</title>
<style>
	a{
		color: black;
		text-decoration: none;
	}
	/* header */
	header{
   		top: 0; 
    	left: 0; 
    	width: 100%;
    	background-color: rgba(255, 255, 255, 0.9);
    	z-index: 1000;
	}
	
	/* logo */
	.headA{
   		display: inline-block;
    	line-height: 70px;
    	padding: 0 20px;
    	background-color: var(--main-color);
    	color: var(--text-bright-color);
	    font-family: Montserrat, sans-serif;
	    font-size: 24px;
	    text-decoration: none;
	}


	/* nav menu */
	.headB ul{
	    margin: 0;
	    padding: 0;
	    list-style: none;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	}
	
	.headB a{
	    display: block;
	    padding: 15px;
	    color: inherit;
	    font-size: 14px;
	    text-decoration: none;
	}
	
	.headB a:hover{
	    background-color: rgba(0, 0, 0, 0.3);
	    color: white;
	}
	
	 header .container{
	        display: flex;
	        align-items: center;
	        justify-content: space-between;
	        max-width: var(--large-width);
	        margin-left: auto;
	        margin-right: auto;
	 }
	    
	 .headC {
	       display: none;
	 }
</style>
</head>
<body>

<header>
        <div class="container">
            <div class="container-small">
                <a href="http://localhost:8080/board_project/index.jsp" class="headA">
                REVIEW
                </a>
                <button class="headC"><span class="fa fa-bars" title="MENU"></span></button>
            </div>
            <nav class="headB">
                <ul>
                   <c:if test="${! empty authUser}">
						${authUser.name}님, 안녕하세요.
						<li><a id="logout">로그아웃</a></li>
						<li><a href="changePwd.do">암호변경</a></li>
						<li><a href="article/list.do">리뷰게시판</a></li>
						<li><a href="deleteMember.do">회원탈퇴</a></li>
					</c:if>
					<c:if test="${empty authUser}">
						<li><a href="join.do">회원가입</a></li>
						<li><a href="login.do">로그인</a></li>
						<li><a href="article/list.do">리뷰게시판</a></li>
					</c:if>
                </ul>
            </nav>
        </div>
    </header>

	<form action="join.do" method="post" class="joinForm">
		<p>
			아이디<br/><input type="text" name="id" value="${param.id}">
			<c:if test="${errors.id}">ID를 입력하세요.</c:if>
			<c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
		</p>
		<p>
			이름<br/><input type="text" name="name" value="${param.name}">
			<c:if test="${errors.name}">이름을 입력하세요.</c:if>
		</p>
		<p>
			암호<br/><input type="password" name="password">
			<c:if test="${errors.password}">암호를 입력하세요.</c:if>
		</p>
		<p>
			암호 확인<br/><input type="password" name="confirmPassword">
			<c:if test="${errors.confirmPassword}">확인을 입력하세요.</c:if>
			<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
		</p>
		<p>
			이메일<br/><input type="email" name="email" value="${param.email}">
			<c:if test="${errors.email}">이메일을 입력하세요.</c:if>
		</p>
		<p>
			핸드폰 번호<br/><input type="text" name="phoneNo" value="${param.phoneNo}">
			<c:if test="${errors.phoneNo}">전화번호를 입력하세요.</c:if>
		</p>
		<input type="submit" value="가입">
	</form>
</body>
</html>
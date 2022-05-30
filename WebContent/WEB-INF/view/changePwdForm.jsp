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
</style>
</head>
<body>
	<header>
	        <div class="container">
	            <div class="container-small">
	                <a href="http://localhost:8080/board_project/index.jsp" class="headA">
	                REVIEW
	                </a>
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
	
	<form action="changePwd.do" method="post">
		<p>
			현재 암호:<br/><input type="password" name="curPwd">
			<c:if test="${errors.curPwd}">현재 암호를 입력하세요.</c:if>
			<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
		</p>
		<p>
			새 암호:<br/><input type="password" name="newPwd">
			<c:if test="${errors.newPwd}">새 암호를 입력하세요.</c:if>
			<c:if test="${errors.samePassword}">같은 암호로 변경할 수 없습니다.</c:if>
		</p>
		<p>
			이메일:<br/><input type="email" name="newEmail" value="${authUser.email }">
		</p>
		<p>
			핸드폰 번호:<br/><input type="text" name="newPhoneNo" value="${authUser.phoneNo }">
		</p>
		<input type="submit" value="회원 정보 수정">
	</form>
</body>
</html>
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
	    
	<table  align="center" border="1"  width="80%">
		<tr height="10" align="center"  bgcolor="yellow">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
		<tr height="10" align="center" bgcolor="orange">
			<td colspan="4"><a href="write.do">게시글쓰기</a></td>
		</tr>
	<c:if test="${articlePage.hasNoArticles()}">
		<tr>
			<td colspan="4">
				<p align="center">
            		<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        		</p>
			</td>
		</tr>
	</c:if>
	<c:forEach var="article" items="${articlePage.content}">
		<tr>
			<td>${article.number}</td>
			<td>
			<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}&name=${article.writer.name}">
			<c:out value="${article.title}"/>
			</a>
			</td>
			<td>${article.writer.name}</td>
			<td>${article.readCount}</td>
		</tr>
	</c:forEach>
	<c:if test="${articlePage.hasArticles()}">
		<tr>
			<td colspan="4" align="center" bgcolor="yellow">
				<c:if test="${articlePage.startPage > 5}">
				<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
				</c:if>
				<c:forEach var="pNo" 
						   begin="${articlePage.startPage}" 
						   end="${articlePage.endPage}">
				<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
				</c:forEach>
				<c:if test="${articlePage.endPage < articlePage.totalPages}">
				<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
</body>
</html>
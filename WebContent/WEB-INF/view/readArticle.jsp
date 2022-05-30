<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
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
<form action="modify.do" method="post">
<input type="hidden" name="no" value="${articleData.article.number}">
<table border="1" width="100%">

<tr>
	<td>번호</td>
	<td>${articleData.article.number}</td>
</tr>
<tr>
	<td>작성자</td>
	<td>${articleData.article.writer.name}</td>
</tr>
<tr>
	<td>제목</td>
	<td><input class="title" type="text" name="title" value="<c:out value='${articleData.article.title}'/>" disabled/></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea class="content" name="content" disabled><u:pre value='${articleData.content}'/></textarea> </td>
</tr>
<tr>
	<td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">[목록]</a>
		<c:if test="${authUser.id == articleData.article.writer.id}">
		<%-- <a href="modify.do?no=${articleData.article.number}">[게시글수정]</a> --%>
		<span id="mod">[게시글수정]</span>
		<a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
		</c:if>
	</td>
</tr>
</table>
<input type="submit" value="글 수정" class="mod" style="display:none;">
</form>
<script type="text/javascript">
	
	document.getElementById("mod").addEventListener("click", disabledFalse);
	
	function disabledFalse() {
    	document.querySelector('.title').disabled = false;
    	document.querySelector('.content').disabled = false;
    	document.querySelector('.mod').style.display = "block";
    	
	}


</script>
</body>
</html>
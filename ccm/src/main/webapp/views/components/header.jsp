<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<title>header</title>
</head>
	<%
	boolean isAuth = request.getSession().getAttribute("AUTH_USER_ID") != null ? true:false;
	pageContext.setAttribute("isAuth", isAuth);
	%>
<body>

	<header class="container">
		<div class="header_col_3-to-4 nav-bar">
			<div>
				<a class="headerLinks clickable" onclick="location.href='/main.do'"><i class="fa-solid fa-house"></i></a>
			</div>
			<div>
				<a class="headerLinks clickable" onclick="location.href='/coffeelist.do '">Product</a>
			</div>
			<div>
				<a class="headerLinks clickable" onclick="location.href='/CustomBoardListHandler.do'">Custom</a>
			</div>
			<c:choose>
				<c:when test="${not empty sessionScope.AUTH_USER_ID}">
					<div>
						<a class="headerLinks clickable" onclick="location.href='/mypage.do'">MyPage</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<a class="headerLinks clickable" onclick="location.href='/LoginHandler.do'">MyPage</a>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${not empty sessionScope.AUTH_USER_ID}">
					<div>
						<a class="headerLinks clickable" onclick="location.href='/logout.do'" style="margin-left: 5vw; ">Logout</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<a class="headerLinks clickable" onclick="location.href='/LoginHandler.do'" style="margin-left: 5vw; ">Login</a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</header>

</body>
</html>
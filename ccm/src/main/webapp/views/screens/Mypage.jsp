<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Mypage</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
	<body>
	    <div class="container">
	        <h2>Mypage 입니당</h2>
	        <hr>
	        <h2>내 프로필</h2>
	        <!-- 프로필 수정 버튼 -->
	        <form action="EditMyProfile.do">
	            <a href="/editMyProfilePageMove.do" class="btn btn-primary mb-3">프로필 수정</a>
	        </form>
	        <div class="table-responsive">
            	<table class="table table-bordered table-hover">
	                <thead class="table-success">
	                    <tr align="center">
	                        <th>닉네임</th>
	                        <th>아이디</th>
	                        <th>프로필이미지</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty mypages}">
	                            <tr align="center">
	                                <td colspan="3">
	                                    <b>등록된 회원이 없습니다.</b>
	                                </td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
	                            <tr align="center">
                              		<td>${mypages.userProfileDTO.m_NICKNAME}</td>
	                                <td>${mypages.userProfileDTO.m_ID}</td>
                                 	<c:choose>
                                    	<c:when test="${not empty mypages.userProfileDTO.p_IMG_COPY}">
                                       		<td><img width="150px;"  height="150px" src="/resources/profile/${mypages.userProfileDTO.p_IMG_COPY}"></td>
                                     	</c:when>
                                     	<c:otherwise>
                                       		<td>이미지가 없습니다.</td>
                                     	</c:otherwise>
                               		</c:choose>
	                            </tr>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	        <hr>
	        <h2>카페인 신호등</h2>
	        <div class="table-responsive">
	            <table class="table table-bordered table-hover">
	                <thead class="table-info">
	                    <tr align="center">
	                        <th>섭취일</th>
	                        <th>캘린더 색</th>
	                        <th>섭취량</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty mypages}">
	                            <tr align="center">
	                                <td colspan="3">
	                                    <b>카페인 섭취량이 없습니다.</b>
	                                </td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
	                            <c:forEach var="healthlight" items="${mypages.healthLightDTO}">
	                                <tr align="center">
	                                    <td>${healthlight.CAL_DATE}</td>
	                                    <td>${healthlight.CAL_COLOR }</td>
	                                    <td>${healthlight.CAL_DAILYCF }</td>
	                                </tr>
	                            </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	        <hr>
	        <h2>내가 작성한 레시피</h2>
	        <div class="table-responsive">
	            <table class="table table-bordered table-hover">
	                <thead class="table-primary">
	                    <tr align="center">
	                        <th>게시판 번호</th>
	                        <th>제목</th>
	                        <th>첨부사진</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty mypages}">
	                            <tr align="center">
	                                <td colspan="3">
	                                    <b>등록된 즐겨찾기목록이 없습니다.</b>
	                                </td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
	                            <c:forEach var="myrecipe" items="${mypages.myRecipeDTO}">
	                                <tr align="center">
	                                    <td>${myrecipe.CUS_NO }</td>
	                                    <td>${myrecipe.CUS_TITLE }</td>
	                                    <td>${myrecipe.CUS_IMG_COPY }</td>
	                                </tr>
	                            </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	        <hr>
	        <h2>즐겨찾기 목록</h2>
	        <div class="table-responsive">
	            <table class="table table-bordered table-hover">
	                <thead class="table-warning">
	                    <tr align="center">
	                        <th>제품넘버</th>
	                        <th>제품이름</th>
	                        <th>카페인 함량</th>
	                        <th>사진</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                        <c:when test="${empty mypages}">
	                            <tr align="center">
	                                <td colspan="4">
	                                    <b>등록된 즐겨찾기목록이 없습니다.</b>
	                                </td>
	                            </tr>
	                        </c:when>
	                        <c:otherwise>
                            	<c:forEach var="favorite" items="${mypages.favoriteListDTO}">
	                                <tr align="center">
	                                    <td>${favorite.c_NO }</td>
	                                    <td>${favorite.c_NAME }</td>
	                                    <td>${favorite.c_CAFFEINE }mg</td>
	                                    <td>${favorite.c_IMG_COPY }</td>
	                                </tr>
	                            </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
	        <div class="container">
        <h2>캘린더</h2>
        <div id="calendar"></div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: [
                    // 여기에 이벤트 데이터를 추가하세요
                    // 예: { title: '이벤트 제목', start: '시작일', end: '종료일' }
                    // 예: { title: 'Meeting', start: '2024-04-23T10:00:00', end: '2024-04-23T12:00:00' }
                ]
            });
            calendar.render();
        });
    </script>
	        
	        
	        <!-- 홈으로 돌아가기 -->
           	<a href="/main.do" class="btn btn-primary" >GO TO TESTVIEW</a>
	    </div>
	    <!-- 부트스트랩 자바스크립트 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>
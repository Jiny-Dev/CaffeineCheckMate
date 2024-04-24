<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COFFEE LIST INDEX</title>
<style>
	
    .coffeeListSearch{
        text-align: center;
    }
	
	
    .coffeeListView{
        margin-top: 20px; 
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
	
    .card {
        flex: 0 1 18%; 
        box-sizing: border-box;
        margin: 10px 30px;
        border: 1px solid black;
        text-align: center;
        padding: 10px;
    }

    .card img {
        max-width: 100%; 
        height: 100px;
    }

    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    
}
</style>

</head>
<body>

<div>
	<h3>커피 리스트 메인</h3>
	<a href="javascript:history.back();"><button>이전 페이지</button></a>
</div>


<div class="coffeeListSearch">
    <form action="coffeeList.do" method="get">
    	<select name="searchType">
    		<option value="name">제품명</option>
    		<option value="brand">브랜드</option>
    	</select>	
    	검색 <input type="text" name="searchQuery" required="required">
    	<input type="submit" value="검색"><br/>
    	해당 부분에서 제목별 검색이 가능합니다
    </form>
</div>

<!-- 관리자 버튼 -->
<c:if test="${isAdmin}">
	<div>
	    <a href="./views/screens/coffeeList_Add.jsp">관리자 게시글 삽입</a>
	</div>
</c:if>

<!-- 메인 컨텐츠 -->
<div class="coffeeListView">
    <c:forEach var="coffeeV" items="${CoffeeListPage.coffeeList}" varStatus="status">
        <c:if test="${status.index % 2 == 0}">
            <div style="width: 100%;"></div>
        </c:if>
		
	    <div class="card">
	    	<a href="coffeeListDetail.do?coffeeNo=${coffeeV.c_NO}" 
	    	   onclick="window.open(this.href, '_blank', 'width=450, height=550'); return false;">
		    	<div>
		            <img src="${pageContext.request.contextPath}${coffeeV.c_IMG_COPY}" alt="${coffeeV.c_NAME} Image"/><br>
		            ${coffeeV.c_NAME}
	            </div>
            </a><br/>
            
	        <!-- 회원만 조회할 수 있는 즐겨찾기 버튼 -->
	        <c:if test="${not empty sessionScope.AUTH_USER_ID}">
	            <button type="button">즐겨찾기버튼</button>
	        </c:if>
            <p>${coffeeV.c_BRAND}</p>
            <p>Caffeine: ${coffeeV.c_CAFFEINE} mg</p>
	    </div>
		   
        
    </c:forEach>
<%-- 게시글이 없으면 보여줄 내용--%>
    <c:if test="${CoffeeListPage.hasNoCoffeeList()}">
    	<div>찾는 게시물이 없습니다</div>
    </c:if>
</div>

    

<!-- 페이지네이션 아래 블럭을 담당하는 부분 -->
<div class="pagination">
<c:choose>
	<c:when test="${CoffeeListPage.hasCoffeeList()}">
		<!-- 게시물이 있을 경우 페이징 넘버 처리 -->
		<c:if test="${CoffeeListPage.startPage > 1}">
			<a href="?page=${CoffeeListPage.startPage - 1}">이전</a>
		</c:if>
			<c:forEach begin="${CoffeeListPage.startPage}" 
					   end  ="${CoffeeListPage.endPage}"  var="i">
				<c:choose>
					<c:when test="${i == CoffeeListPage.currentPage}">
						<span><b>${i}</b></span>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		 <c:if test="${CoffeeListPage.endPage < CoffeeListPage.totalPage}">
		    	<a href="?page=${CoffeeListPage.endPage + 1}">다음</a>
		 </c:if>	
	</c:when>
	<c:otherwise>
		<a href="/coffeeList.do"><button type="button">기본 리스트로 돌아가기</button></a>
	</c:otherwise>
</c:choose>
			
</div>
</body>
</html>
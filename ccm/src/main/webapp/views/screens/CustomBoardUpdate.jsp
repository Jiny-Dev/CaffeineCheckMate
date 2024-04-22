<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
  <%request.setCharacterEncoding("utf-8");%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>

</head>
<body>

<c:set var="content" value="${param.content}" />
<c:set var="title" value="${param.title}" />
<c:set var="img" value="${param.img}" />
<form action="/CustomBoardUpdateHandler.do" id="add" name="add" method="post" enctype="multipart/form-data">
 <input type="hidden" id="num" name="num" value="${param.no}"/> 
 <input type="hidden" id="img" name="img" value="${img}"/> 
    <p>제목 <input type="text" size="30" id="cus_name" name="cus_name" value="${title}"></p>
    내용<p><textarea cols="50" rows="10" id="cus_content" name="cus_content">${content}</textarea></p>
    이미지: <input type="file" name="file" id="file" onchange="previewImage()"><br/>
    <img id="preview" src="#" alt="미리보기" style="max-width: 300px; max-height: 300px;"><br>
<td>
	<select name="shot" id="shot">
		<option value="0">샷추가</option>
		<option value="0">없음</option>
		<option value="1">1번</option>
		<option value="2">2번</option>
		<option value="3">3번</option>
		<option value="4">4번이상</option>
	</select>
</td>
<td>
    <select name="milkType" id="milkType">
        <option value="noMilk">우유 변경 없음</option>
        <option value="저지방우유">저지방 우유</option>
        <option value="아몬드브리즈">아몬드 브리즈</option>
        <option value="오토믹스">오트 믹스</option>
        <option value="두유">두유</option>
        <option value="코코넛밀크">코코넛 우유</option>
    </select>
</td>
<td>
    <select name="syrupType" id="syrupType">
        <option value="noSyrup">시럽 추가 없음</option>
        <option value="바닐라시럽">바닐라 시럽</option>
        <option value="카라멜시럽">카라멜 시럽</option>
        <option value="헤이즐넛시럽">헤이즐넛 시럽</option>
        <option value="모카시럽">모카 시럽</option>
        <option value="시나몬시럽">시나몬 시럽</option>
        <option value="메이플시럽">메이플 시럽</option>
    </select>
</td>
<td>
    <select name="toppingType" id="toppingType">
        <option value="noTopping">토핑 추가 없음</option>
        <option value="휘핑크림">휘핑 크림</option>
        <option value="초콜릿토핑">초콜릿 토핑</option>
        <option value="카라멜드리즐">카라멜 드리즐</option>
        <option value="마시멜로">마시멜로</option>
        <option value="코코아파우더">코코아 파우더</option>
        <option value="쿠키크럼블">쿠키 크럼블</option>
        <option value="펄">펄</option>
    </select>
</td>
<td>
    <select name="decaffeinated" id="decaffeinated">
        <option value="일반">일반</option>
        <option value="디카페인">디카페인</option>
    </select>
</td>
    <p><input type="submit" value="수정하기"></p>

</form>
</body>
</html>
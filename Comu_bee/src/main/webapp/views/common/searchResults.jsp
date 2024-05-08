<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <%@ include file="/views/board/boardMenuBar.jsp" %>
<h2>검색결과</h2>

<br><br>

<h4>작품</h4>
<!-- 작품 관련 섹션 (필요한 경우 내용 추가) -->
	<table border="1">
		<thead>
			<tr>
				<th>작품 제목</th>
				<th>감독</th>
				<th>작품 영문제목</th>
				<th>작품 정보</th>
				<th>포스터 사진</th>
				<th>상영 시간</th>
				<th>작품 개봉일</th>
			</tr>
		</thead>
		<tbody>
    		<c:forEach items="${contentsList}" var="contents">
        		<tr>
            		<td>${contents.title}</td>
            		<td>${contents.director}</td>
            		<td>${contents.englishTitle}</td>
            		<td>${contents.overView}</td>
            		<td><img src="${contents.posterPath}" alt="Poster" style="width:100px;height:150px;"></td>
            		<td>${contents.runtime}</td>
           		 	<td>${contents.releaseDate}</td>
        		</tr>
    		</c:forEach>
    		<c:if test="${empty contentsList}">
        		<tr>
            		<td colspan="7">검색 결과가 없습니다.</td>
        		</tr>
    		</c:if>
		</tbody>
	</table>

<br><br>

<h4>게시글</h4>
<!-- 게시글 목록 표시 -->
<table border="1">
    <thead>
        <tr>
            <th>게시글 제목</th>
            <th>컨텐츠</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.title}</td>
                <td>${board.boardContent}</td>
                <td>${board.userId}</td>
                <td>${board.createDate}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty boardList}">
            <tr>
                <td colspan="2">검색 결과가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>

</body>
</html>
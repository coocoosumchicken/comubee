<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User loginUser = (User) session.getAttribute("loginUser");
String alertMsg = (String) session.getAttribute("alertMsg");
String contextPath = request.getContextPath();
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
.head-area {
	overflow: hidden;
	text-align: center;
}

.logo-area, .search-area, .login-area {
	display: inline-block;
	vertical-align: middle;
}

.logo-img {
	width: 50px;
	height: 50px;
}

.title {
	border: none;
	font-size: 35px;
	font-weight: 900;
}

.search-area {
	text-align: left;
	margin-top: 10px;
}

.search-input {
	width: 400px;
	height: 40px;
}

.login-area {
	margin-top: 20px;
	float: right;
	text-align: "center"
}
.btn btn-outline-light{
	
}



</style>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	





	<div class="login-area">
		<%
		if (loginUser == null) {
		%>
		
			<form id="login-form" action="<%=contextPath%>/login.us"
				method="post">
				<table>
					<tr>
						<th></th>
						<td><input type="text" name="userId" required
							placeholder="아이디"></td>
						<td><button type="submit" class="btn btn-outline-dark">로그인</button></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="password" name="userPwd" required
							placeholder="비밀번호"></td>
				<th><input type="button" class="btn btn-outline-dark"
					onclick="enrollForm();" value="회원가입"></th>
					</tr>
					<tr>
						<td colspan="2"><label for="saveId"> 아이디 저장: </label> <input
							id="saveId" type="checkbox" name="saveId"></td>
					</tr>
				</table>
			<div class="find-area">
				<th><input type="button" class="btn btn-link"
					onclick="findId();" value="아이디 찾기"></th>|
				<th><input type="button" class="btn btn-link"
					onclick="findPwd();" value="비밀번호 찾기"></th>
		</div>
	</form>
		<script>
        
        $(function(){
        	
        	var saveId ="${cookie.userId.value}"
        	
        	if(saveId!=""){
        		$("#saveId").attr("checked",true);
        		$("#loginId").val(saveId);
        	}

        	
        });
        
        function enrollForm(){
        	location.href ="<%=contextPath%>/views/user/userEnrollForm.jsp";
        }
        
        </script>
		<%
		} else {
		%>
		<div id="user-info">
			<b>${loginUser.userId }님 환영합니다!</b>  <br>
			<a href="${contextPath}/myPage.us" style="color: black;" >마이페이지</a> |
			<a href="<%=contextPath%>/logout.us" style="color: black;">로그아웃</a>
		</div>
	</div>


	<%
	}
	%>

	<script>
	var msg = "<%=alertMsg%>";

	if (msg != "null") {
		alert(msg);
<%session.removeAttribute("alertMsg");%>
	}
</script>


	<script>
	function findId(){
		location.href ="<%=contextPath%>/views/user/findUserId.jsp";
		 
	}
	
	function findPwd(){
		location.href="<%=contextPath%>/views/user/findUserPwd.jsp";
	}
</script>

</body>
</html>


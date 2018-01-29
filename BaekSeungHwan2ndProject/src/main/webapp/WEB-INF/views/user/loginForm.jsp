<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-blue.min.css" />
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
<title>[ 로그인 ]</title>
<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
	
}

body {
	text-align: center;
}
#sub{
	width: 300px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
	
}
</style>
<script type="text/javascript">
	$(function(){
		$('#sub').on('click',function(){
			var id = $('#id').val();
			var password = $('#password').val();
			
			if(id.length == 0 || password.length == 0){
				alert('아이디와 비밀번호를 정확히 입력하세요!');
				return;
			}
			
			$.ajax({
				url : 'loginCheck',
				type : 'post',
				dataType : 'text',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					id : id,
					password : password
				}),
				success : function(str){
					if(str == 'no'){
						alert('아이디 비밀번호를 확인하세요!');
					}else{
						$('#loginForm').submit();
					}
				},
				error : function(err){
					console.log(err);
				}
			});
			
		});
	});
</script>
</head>
<body>
	<div class="topMenu">
		<jsp:include page="loginTop.jsp"></jsp:include>
	</div>
	<h1>로그인</h1>
	<div class="main">
		<form action="userLogin" method="post" id="loginForm">
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="text" id="id" name="id">
				<label class="mdl-textfield__label" for="id">아이디 입력</label>
			</div>
			<br>
	
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="password" id="password" name="password">
				<label class="mdl-textfield__label" for="password">비밀번호 입력</label>
			</div>
			<br>
			<input type="button" id="sub" value="로그인" class="mdl-button mdl-js-button">
			<div id="loginDiv"></div>
		</form>
	</div>
</body>
</html>

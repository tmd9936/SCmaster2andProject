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


<title>[ 유저 조인 ]</title>
<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
	
}

body {
	text-align: center;
}
.location{
	width: 300px;
	height: 50px;
}
.locationDiv{
	height: 100px;
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
		var idcheck = false;
		var passcheck = false;
		var namecheck = false;
		
		$('#sub').on('click',function(){
			if(idcheck == true && passcheck == true && namecheck == true){
				$('#joinForm').submit();
			}
			else{
				alert(idcheck + " : "+passcheck + " : "+namecheck);
				$('#joinDiv').html('<h5>회원가입 실패</h5>');
			}
		});
		
		$('#password1').on('focusout', function(){
			var pass1 = $('#password1').val();
			var pass2 = $('#password2').val();
			
			if(pass1.length == 0 || pass2.length == 0){
				$('#passwordText2').html('<p>패스워드를 입력하세요 !</p>');
				return;
			}
			
			if(pass1 != pass2){
				passcheck = false;
				$('#passwordText2').html('<p>패스워드가 일치하지 않습니다!</p>');
			}else{
				passcheck = true;
				$('#passwordText2').html('<p>패스워드가 일치합니다.</p>');		
			}
		});
		
		$('#password2').on('focusout', function(){
			var pass1 = $('#password1').val();
			var pass2 = $('#password2').val();
			
			if(pass1.length == 0 || pass2.length == 0){
				$('#passwordText2').html('<p>패스워드를 입력하세요 !</p>');
				return;
			}
			
			if(pass1 != pass2){
				passcheck = false;
				$('#passwordText2').html('<p>패스워드가 일치하지 않습니다!</p>');
			}else{
				passcheck = true;
				$('#passwordText2').html('<p>패스워드가 일치합니다.</p>');		
			}
		});
		
		
		$('#name').on('focusout',function(){
			var name = $('#name').val();
			if(name.length == 0){
				namecheck = false;
				$('#nameText').html('<p>이름을 입력하세요</p>');
			}else{
				namecheck = true;
				$('#nameText').html('<p>좋은 이름이네요!</p>');
			}
		});
		
		$('#id').on('keypress',function(){
			$('#idText').html('');
		});
		
		$('#id').on('focusout',function(){
			var id = $('#id').val();
			if(id.length == 0){
				idcheck = false;
				$('#idText').html('<p>아이디를 입력하세요!</p>');
				return;
			}
			
			$.ajax({
				url : 'idCheak',
				type : 'post',
				dataType : "text",
				data : {
					id : id
				},
				success : function(str){
					if(str == 'yes'){
						idcheck = true;
						$('#idText').html('<p>환영합니다.</p>');
					}else{
						idcheck = false;
						$('#idText').html('<p>아이디 중복입니다.</p>');
					}
				},
				error : function(err){
					console.log(err);
				}
			});	
		});
		
	});
	//아이디
	//이름(닉네임)
	//지역
</script>
</head>
<body>
	<div class="topMenu">
		<jsp:include page="loginTop.jsp"></jsp:include>
	</div>
	<h1>회원가입</h1>
	<div class="main">
		<form action="insertUser" method="post" id="joinForm">
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="text" id="id" name="id"> <label
					class="mdl-textfield__label" for="id">아이디</label>
				<div id="idText"></div>
			</div>
			<br>
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="password" id="password1" name="password">
				<label class="mdl-textfield__label" for="password1">비밀번호</label>
			</div>
			<br>
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="password" id="password2">
				<label class="mdl-textfield__label" for="password2">비밀번호 확인</label>
				<div id="passwordText2"></div>
			</div>
			
			<br> 
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="text" id="name" name="name">
				<label class="mdl-textfield__label" for="name">이름(닉네임)</label>
				<div id="nameText"></div>
			</div>
			<br>
			<div class="locationDiv">
				<select name="location" id="locations" class="location" >
	      			<option selected="selected" >서울</option>
	      			<option>인천</option>
	      			<option>경기</option>
	      			<option>충청북도</option>
	      			<option>충청남도</option>
	      			<option>경상북도</option>
	      			<option>경상남도</option>
	      			<option>부산</option>
	      			<option>대구</option>
	      			<option>울산</option>
	      			<option>세종</option>
	      			<option>전라북도</option>
	      			<option>전라남도</option>
	      			<option>제주</option>
	      			<option>을릉도</option>
	      			<option>광주</option>
	      			<option>대전</option>
	    		</select>
			</div>
			<input type="button" id="sub" value="회원가입" class="mdl-button mdl-js-button">
			<div id="joinDiv"></div>
		</form>

	</div>
</body>
</html>

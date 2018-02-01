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
<title>[ 유저 정보 화면 ]</title>
<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
	
}
</style>
<style type="text/css">
table {
	width: 35%;
}

table th {
	width: 30%;
}

.profile-in {
	width: 80%;
	height: 30%;
}

.profile-in table {
	width: 50%;
	height: 50%;
}

.profile-in img {
	width: 100%;
	height: 100%;
}

.profile-in table td {
	height: 150px;
}

.profile-in table th {
	text-align: center;
}

.profile-in table tfoot td {
	height: 10%;
	text-align: center;
}

a {
	text-decoration: none;
}

.main {
	height: 900px;
	width: 100%;
}

.mdl-grid {
	height: 800px;
}

.mdl-cell--6-col-desktop {
	border-style: solid;
	border-color: purple;
	text-align: center;
}

.subject {
	width: 100%;
	height: 50px;
}
table{
	width : 60%;
	margin :auto;
	text-align: center;
}
</style>

<script type="text/javascript">
	function updateCheck() {
		var password = document.getElementById('password');
		var password2 = document.getElementById('password2');
		var name = document.getElementById('name');
		var email = document.getElementById('email');
		var idno = document.getElementById('idno');
		var address = document.getElementById('address');

		if (password.value == "") {
			alert('비밀번호 입력하세요');
			//커서를 여기 위치에 놓는다.
			password.focus();
			return false;
		}

		if (password2.value == "") {
			alert('비밀번호 입력하세요');
			password2.focus();
			return false;
		}

		if (password2.value != password.value) {
			alert('비밀번호가 다릅니다.');
			return false;
		}
		if(!/^[a-zA-Z0-9]{6,15}$/.test(password)){
			aler('6~15자리의 영문과 숫자조합으로 쓰세요!');
			return false;
		}

		if (name.value == "") {
			alert('이름을 입력하세요');
			return false;
		}

		if (email.value == "") {
			alert('이메일을 입력하세요');
			return false;
		}

		if (idno.value == "") {
			alert('idno를 입력하세요.');
			return false;
		}

		if (address.value == "") {
			alert('주소를 입력하세요.');
			return false;
		}

		return true;
	}

	function openImgForm() {
		window.open("profileChange", "newWindow",
				"top=300, left=300, width=500,height=300");
	}

	$(function() {

		$('#locations').val("${user.location}").attr("selected", "selected");
	});
</script>
</head>
<body>
	<div class="main">
		<div class="topMenu">
			<jsp:include page="../topMenu.jsp"></jsp:include>
		</div>
		<div class="mdl-grid">
			<div class="mdl-cell--6-col-desktop" id="infoDiv">
				<h1>[ 업데이트 ]</h1>
				<div class="profile-in">
					<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
						<tr>
							<th>프로필</th>
						</tr>
						<tr>
							<td><c:choose>
									<c:when test="${sessionScope.img eq 'none'}">
										<img src='<c:url value="/resources/img/human.png"></c:url>'
											alt="이미지">
									</c:when>
									<c:otherwise>
										<img src="download" alt="이미지">
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tfoot>
							<tr>
								<td><a href="javascript:openImgForm()">프로필 교체</a></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<br>
				<form action="update" method="post" onsubmit="return updateCheck()">
					<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
						<tr>
							<th>아이디</th>
							<td><input type="hidden" name="id" value="${user.id }">
								${user.id }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" id="password"><br>
								<input type="password" name="password2" id="password2"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name"
								value="${user.name }"></td>
						</tr>
						<tr>
							<th>지역</th>
							<td><select name="location" id="locations" class="location">
									<option>서울</option>
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
							</select></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="수정"> <input
								type="reset" value="다시쓰기"></td>
						</tr>
					</table>

				</form>
			</div>
			<div class="mdl-cell--6-col-desktop" id="groupDiv">
				<h1>[ 가입 그룹 ]</h1>
				<button id="show-dialog" type="button" class="mdl-button">
					<b>그룹 만들기</b>
				</button>
				<dialog class="mdl-dialog">
				<h4 class="mdl-dialog__title">그룹 만들기</h4>
				<div class="mdl-dialog__content">
					<input type="hidden" name="master" id="master" value="${user.id }">
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="gName"
							name="name"> <label class="mdl-textfield__label"
							for="name">그룹 이름</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<textarea class="mdl-textfield__input" type="text" rows="10"
							id="introduce" name="introduce"></textarea>
						<label class="mdl-textfield__label" for="introduce">소개글</label>
					</div>
					<div class="subDiv">
						<h4>주제</h4>
						<select name="subject" id="subject" class="subject">
							<option selected="selected">음식</option>
							<option>IT</option>
							<option>어학</option>
							<option>여행</option>
							<option>맛집</option>
							<option>패션</option>
							<option>게임</option>
							<option>음악</option>
							<option>팬클럽</option>
							<option>취업</option>
							<option>만화</option>
						</select>
					</div>
					<div id="dialogError"></div>
				</div>
				<div class="mdl-dialog__actions">
					<button type="button" class="mdl-button" id="groupMake">생성</button>
					<button type="button" class="mdl-button close" id="closeBtn">취소</button>
				</div>
				</dialog>
				<div id="listDiv">
					<hr>
					<table id="listTable" class="mdl-data-table mdl-js-data-table">
						<thead>
							<tr>
								<th>주제</th>
								<th>마스터</th>
								<th>그룹 이름</th>
							</tr>
						</thead>
						<tbody id="listTableBody">
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		myGroupList();
		var dialog = document.querySelector('dialog');
		var showDialogButton = document.querySelector('#show-dialog');
		if (!dialog.showModal) {
			dialogPolyfill.registerDialog(dialog);
		}
		showDialogButton.addEventListener('click', function() {
			dialog.showModal();
		});
		dialog.querySelector('.close').addEventListener('click', function() {
			dialog.close();
		});

		$('#groupMake').on('click', function() {
			var master = $('#master').val();
			var name = $('#gName').val();
			var introduce = $('#introduce').val();
			var subject = $('#subject').val();
			//dialogError
			if (name.length == 0 || introduce.length == 0) {
				alert('??');
				$('#dialogError').html('<p>모두 작상하세요!</p>');
				return;
			}
			// 						    	console.log(master);
			// 						    	console.log(name);
			// 						    	console.log(introduce);
			// 						    	console.log(subject);

			$.ajax({
				url : '/web1/group/make',
				type : 'post',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					master : master,
					name : name,
					introduce : introduce,
					subject : subject
				}),
				success : function() {
					alert('생성!!');
					$('#closeBtn').trigger('click');
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	});
	
	function myGroupList(){
		$.ajax({
			url : '/web1/group/myGroupList',
			type : "get",
			dataType : 'json',
			success : function(list){
				var str = '';
				$.each(list,function(index,item){
					str += '<tr>';
					str += '<td>'+item.subject+'</td>';
					str += '<td>'+item.master+'</td>';
					str += '<td><a href="/web1/group/groupForm?groupnum='+item.groupnum+'"><b>'+item.name+'</b></a></td>';
					str += '</tr>';
				});
				$('#listTableBody').html(str);
			},
			error : function(e){
				console.log(e);
			}
		});
	}
</script>
</html>


















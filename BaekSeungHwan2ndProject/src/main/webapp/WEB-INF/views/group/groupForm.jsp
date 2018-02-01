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
<title>[ 그룹 ]</title>
<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
	position: fixed;
	z-index: 99;
}

#sidebanner {
	position: fixed;
	margin-right: 500px;
	top: 80px;
	width: 30%;
	height: 100%;
	width: 25%;
	height: 100%;
	background: #abd;
	text-align: center;
}

.demo-card-square.mdl-card {
	width: 80%;
	height: 30%;
	text-align: center;
	margin: auto;
	margin-top: 10px;
}

.demo-card-square>.mdl-card__title {
	color: #fff;
	background: url('<c:url value="/resources/img/noneGroup.png"></c:url>')
		bottom right 30% no-repeat #46B6AC;
}

.demo-card-image>.mdl-card__actions {
	height: 64px;
	padding: 16px;
	background: rgba(0, 0, 0, 0.2);
}

.demo-card-image__filename {
	color: #fff;
	font-size: 14px;
	font-weight: 500;
}

.demo-card-wide.mdl-card {
	width: 60%;
	height: 15%;
}

.demo-card-wide>.mdl-card__title {
	color: #000;
	height: 90%;
}

.demo-card-wide>.mdl-card__menu {
	color: #fff;
}

.mainDiv {
	margin-left: 30%;
	padding-top: 80px;
	width: 90%;
}

.btnText {
	color: white;
	font-weight: bold;
	font-size: large;
}

#sidebanner button {
	width: 80%;
	height: 7%;
}

#writeCard {
	min-height: 100px;
	height: 10%
}

body {
	overflow-x: hidden;
	overflow-y: auto;
}

#boardDiv {
	
}

.replyTable {
	width: 80%;
	text-align: left;
}

.replyTable th td {
	text-align: left;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#joinGroup').on('click', function() {
			var groupnum = $('#thisGroupnum').val();
			if (confirm('가입하시겠습니까?')) {
				location.href = 'groupAddUser?groupnum=' + groupnum;
			}
		});
		
		$('.mdl-menu__item').on('click',function(){
			var type = $(this).attr('type');
			var boardnum = $(this).attr('boardnum');
			
			if(type == 'delete'){
				location.href = '../board/delete?boardnum='+boardnum+'&groupnum='+${group.groupnum};
			}else if(type == 'update'){		
				 $.ajax({
					url:'../board/updateForm',
					type : 'get',
					data : {
						boardnum : boardnum
					},
					success : function(result){
						$('.updateDiv').html('');
						$("#updateDiv"+boardnum).html(result);
					},
					error : function(err){
						console.log(err);
					}
				}); 
			}
		});
		
		
		$('.sendReply').on('click',function(){
			var boardnum =  $(this).attr('boardnum');
			var text = $('#reply'+boardnum).val();
			if(text.length ==0){
				alert('내용을 입력하세요!');
				return;
			}
			$('#replySend'+boardnum).submit();
		})
		
		$('.deleteReply').on('click',function(){
			var replynum = $(this).attr('replynum');
			location.href = '../board/deleteReply?replynum='+replynum+'&groupnum='+${group.groupnum};
		});
		
		$('.updateReply').on('click',function(){
			var replynum = $(this).attr('replynum');
			var text = $(this).next().next().val();
			var groupnum = $(this).next().next().attr('groupnum');
			$('.updateDiv').html('');

			var str = '';
	  		str += '<form action="../board/updateReply" method="post">';
	  		str += '<input type="hidden" name="groupnum" value="'+groupnum+'">';
	  		str += '<input type="hidden" name="replynum" value="'+replynum+'">';
			str += '<div class="mdl-textfield mdl-js-textfield">';
			str += '<input class="mdl-textfield__input" type="text" name="text" id="update'+replynum+'" value="'+text+'">';
			str += '<label class="mdl-textfield__label" for="update'+replynum+'">글입력</label>';
			str += '</div>';
			str += '<input type="submit" value="수정" class="mdl-button mdl-js-button mdl-button--primary">';
			str += '</form>';
			$(this).next().html(str);
		});
		
		var page = 1;
		 $(window).scroll(function(){
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				var groupnum = $('#thisGroupnum').val();
				var sessionId = $('#sessionId').val();
				page++;
				 $.ajax({
					url : '../board/scrollBoard',
					type : 'get',
					dateType : 'json',
					data : {
						groupnum : groupnum,
						page : page
					},
					success : function(list){
						var str = '';
						$.each(list, function(index, item){
							str += '<div class="writeDiv">';
							str += '<div class="demo-card-wide mdl-card mdl-shadow--2dp" class="writeCard">';
							str += '<div class="mdl-card__supporting-text">';
							str += '<p>ID '+item.id+'</p>';
							if(item.savedfile != null){
								str += '<img alt="" src="../board/download?boardnum='+item.boardnum+'">';
							}
							str +=	'<pre>'+item.content+'</pre></div>';
							str += '<div class="mdl-card__actions mdl-card--border">';
							str += '<form action="../board/insertReply" method="post" id="replySend'+item.boardnum+'">';
							str += '<input type="hidden" name="groupnum" value="'+item.groupnum+'">';
							str += '<input type="hidden" name="boardnum" value="'+item.boardnum+'">';
							str += '<input type="hidden" name="id" value="${sessionScope.id }">';
							str += '<div class="mdl-textfield mdl-js-textfield">';
							str += '<input class="mdl-textfield__input" type="text"'+
								'id="reply'+item.boardnum+'" name="text"> <label'+
								'class="mdl-textfield__label" for="reply'+item.boardnum+'">댓글을'+
								'입력하세요.</label>'+
								'</div>'+
								'<input type="button" value="입력" class="mdl-button mdl-js-button mdl-button--primary sendReply"'+
								'boardnum="${board.boardnum }">'+ 
								'</form>';
							str += '<div class="replyShowDiv">';
							str += '<table class="mdl-data-table mdl-js-data-table replyTable">';
							$.each(list.replyList, function(index, reply){
								if(reply.boardnum == item.boardnum){
									str += '<tr><th>'+reply.id+'</th>';
									str += reply.text;
									if(reply.id == sessionId){
										str += '<input type="button" value="삭제" class="deleteReply" replynum="'+reply.replynum+'">';
										str += '<input type="button" value="수정" class="updateReply" replynum="'+reply.replynum+'">';
										str += '<div class="updateDiv"></div>';
										str += '<input type="hidden" value="'+reply.text+'" groupnum="'+item.groupnum+'">';
										
									}
									str += '</td></tr>';
								}
							}); 
							str += '</table></div></div>';
							str += '<div class="mdl-card__menu">';
							str += '<button id="'+item.boardnum+'" class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">';
							str += '<i class="material-icons">more_vert</i>';
							str += '</button>';
							str += '<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="'+item.boardnum+'">';
							if(sessionId == item.id){
								str += '<li class="mdl-menu__item" type="update" boardnum="'+item.boardnum+'">수정</li>';
								str += '<li class="mdl-menu__item" type="delete" boardnum="'+item.boardnum+'">삭제</li>';
							}else{
								str += '<li disabled class="mdl-menu__item">수정</li>'+
									'<li disabled class="mdl-menu__item">삭제</li>';
							}
							str += '</ul></div></div></div><br>';
							str += '<div id="updateDiv${board.boardnum }" class="updateDiv"></div><br>';
						}); 
						$("#boardDiv").append(str);
					}
				}); 
				
			}
		}); 
	});
	
</script>
</head>
<form action="../board/updateReply" method="post"></form>
<body>
	<input type="hidden" value="${group.groupnum }" id="thisGroupnum">
	<input type="hidden" value="${sessionScope.id }" id="sessionId">
	<div class="topMenu">
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</div>
	<div id="sidebanner">
		<div class="demo-card-square mdl-card mdl-shadow--2dp">
			<div class="mdl-card__title mdl-card--expand">
				<h2 class="mdl-card__title-text">${group.master}</h2>
			</div>
			<div class="mdl-card__supporting-text">
				<pre>${group.introduce }</pre>
			</div>
			<div class="mdl-card__actions mdl-card--border">
				<a href="groupForm?groupnum=${group.groupnum }"
					class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
					${group.name} </a>
			</div>
			<p>멤버 : ${group.membercount }
		</div>
		<hr>
		<c:if test="${sessionScope.id == group.master }">
			<p>그룹 설정 바꾸기1</p>
			<br>
		</c:if>
		<c:choose>
			<c:when test="${member eq 'memberYes' }">
				<button
					class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
					<span class="btnText">그룹 탈퇴</span>
				</button>
			</c:when>
			<c:when test="${member eq 'memberNo' }">
				<button
					class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
					id="joinGroup">
					<span class="btnText">그룹 가입</span>
				</button>
			</c:when>
			<c:otherwise>
				<p>로그인 하세요!</p>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- 사이드바 end -->
	<div id="mainDiv" class="mainDiv">
		<c:choose>
			<c:when test="${member eq 'unknown' }">
				<h1>로그인 하세요!</h1>
			</c:when>
			<c:otherwise>
				<c:if test="${member eq 'memberYes'}">
					<div id="writeDiv" class="writeDiv">
						<div class="demo-card-wide mdl-card mdl-shadow--2dp"
							id="writeCard" class="writeCard">

							<div class="mdl-card__supporting-text">
								<p>멤버들에게 전할 소식을 남겨주세요!</p>
							</div>
							<div class="mdl-card__actions mdl-card--border">
								<jsp:include page="../board/boardForm.jsp"></jsp:include>
							</div>
							<div class="mdl-card__menu">
								<button
									class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
									<i class="material-icons">share</i>
								</button>
							</div>
						</div>
					</div>
				</c:if>
				<br>
				<div id="boardDiv">
					<c:forEach items="${boardList }" var="board">
						<div class="writeDiv">
							<div class="demo-card-wide mdl-card mdl-shadow--2dp"
								class="writeCard">

								<div class="mdl-card__supporting-text">
									<p>ID ${board.id }</p>
									<c:if test="${board.savedfile !=null }">
										<img alt=""
											src="../board/download?boardnum=${board.boardnum }">
									</c:if>
									<pre>${board.content }</pre>
								</div>
								<div class="mdl-card__actions mdl-card--border">
									<form action="../board/insertReply" method="post"
										id="replySend${board.boardnum }">
										<input type="hidden" name="groupnum"
											value="${board.groupnum }"> <input type="hidden"
											name="boardnum" value="${board.boardnum }"> <input
											type="hidden" name="id" value="${sessionScope.id }">
										<div class="mdl-textfield mdl-js-textfield">
											<input class="mdl-textfield__input" type="text"
												id="reply${board.boardnum }" name="text"> <label
												class="mdl-textfield__label" for="reply${board.boardnum }">댓글을
												입력하세요.</label>
										</div>
										<input type="button" value="입력"
											class="mdl-button mdl-js-button mdl-button--primary sendReply"
											boardnum="${board.boardnum }">
									</form>
									<div class="replyShowDiv">
										<table class="mdl-data-table mdl-js-data-table replyTable">
											<c:forEach items="${board.replyList }" var="reply">
												<c:if test="${reply.boardnum == board.boardnum }">
													<tr>
														<th>${reply.id }</th>
														<td>${reply.text }<c:if
																test="${reply.id == sessionScope.id }">
																<input type="button" value="삭제" class="deleteReply"
																	replynum="${reply.replynum }">
																<input type="button" value="수정" class="updateReply"
																	replynum="${reply.replynum }">
																<div class="updateDiv"></div>
																<input type="hidden" value="${reply.text }"
																	groupnum="${group.groupnum }">
															</c:if>
														</td>

													</tr>
												</c:if>
											</c:forEach>
										</table>
									</div>
								</div>
								<div class="mdl-card__menu">
									<button id="${board.boardnum }"
										class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
										<i class="material-icons">more_vert</i>
									</button>

									<ul
										class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
										for="${board.boardnum }">
										<c:choose>
											<c:when test="${sessionScope.id eq board.id }">
												<li class="mdl-menu__item" type="update"
													boardnum="${board.boardnum }">수정</li>
												<li class="mdl-menu__item" type="delete"
													boardnum="${board.boardnum }">삭제</li>
											</c:when>
											<c:otherwise>
												<li disabled class="mdl-menu__item">수정</li>
												<li disabled class="mdl-menu__item">삭제</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
						</div>
						<br>
						<div id="updateDiv${board.boardnum }" class="updateDiv"></div>
						<br>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- mainDivend -->

</body>
</html>

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
<style>
.demo-layout-waterfall .mdl-layout__header-row .mdl-navigation__link:last-of-type
	{
	padding-right: 0;
}
a{
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#infoBtn').on('click',function(){
			location.href = '/web1/user/infoForm';
		});
	});

</script>
<title>[ TOP ]</title>
</head>
<body>
	<div>
		<header class="mdl-layout__header">
			<!-- Top row, always visible -->
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">
					<a href="/web1">
						<img alt="홈아이콘" src="<c:url value="/resources/img/homeico.png"></c:url>">						
					</a>
				</span>
				<div class="mdl-layout-spacer"></div>
				<div class="mdl-layout__header-row">
					<div class="mdl-layout-spacer"></div>
					<!-- Navigation -->
					<nav class="mdl-navigation mdl-layout--large-screen-only">
					
						<c:choose>
							<c:when test="${sessionScope.id == null }">
								<a class="mdl-navigation__link" href="/web1/user/loginForm"><b>로그인</b></a> 
								<a class="mdl-navigation__link" href="/web1/user/userJoin"><b>회원가입</b></a> 					
							</c:when>
							<c:otherwise>
								<a class="mdl-navigation__link" href="/web1/user/logout">로그아웃</a> 
								<span class="mdl-chip mdl-chip--contact mdl-chip--deletable">
									<c:choose>
										<c:when test="${sessionScope.img eq 'none' }" >
										 <button id="infoBtn" class="mdl-chip demo-chip">
		    								<img class="mdl-chip__contact" src="<c:url value="/resources/img/human.png"></c:url>">
										   	<span class="mdl-chip__text">${sessionScope.name }</span>
										 </button>
										</c:when>
										<c:otherwise>
										 	<button id="infoBtn" class="mdl-chip demo-chip">
		    									<img class="mdl-chip__contact" src="/web1/user/download">
										   		<span class="mdl-chip__text">${sessionScope.name }</span>
										 	</button>
										</c:otherwise>
									</c:choose>
								</span>		
							</c:otherwise>
						</c:choose>
					</nav>
				</div>
				<div
					class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                  mdl-textfield--floating-label mdl-textfield--align-right">
					<label class="mdl-button mdl-js-button mdl-button--icon"
						for="waterfall-exp"> <i class="material-icons">search</i>
					</label>
					<div class="mdl-textfield__expandable-holder">
						<input class="mdl-textfield__input" type="text" name="sample"
							id="waterfall-exp">
					</div>
				</div>
			</div>
			<!-- Bottom row, not visible on scroll -->
		</header>
	</div>


</body>
</html>
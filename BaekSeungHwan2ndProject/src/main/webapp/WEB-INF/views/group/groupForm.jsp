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
	width: 65%;
	height: 15%;
}

.demo-card-wide>.mdl-card__title {
	color: #000;
	height: 100px;
	
}

.demo-card-wide>.mdl-card__menu {
	color: #fff;
}
.mainDiv{
	margin-left: 30%;
	padding-top: 80px;
}

</style>
<script type="text/javascript">
	
</script>
</head>
<body>
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
		</div>
		<hr>
		<c:if test="${sessionScope.id == group.master }">
			<p>그룹 설정 바꾸기2</p>
			<br>
		</c:if>
	</div>
	<!-- 사이드바 end -->

	<div id="mainDiv" class="mainDiv">
		<div id="writeDiv">
			<div class="demo-card-wide mdl-card mdl-shadow--2dp">
				<div class="mdl-card__title">
					<h2 class="mdl-card__title-text">멤버들에게 전할 소식을 남겨주세요!</h2>
				</div>
				<div class="mdl-card__supporting-text">^^</div>
				<div class="mdl-card__actions mdl-card--border">
					<a
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
						글쓰기 </a>
				</div>
				<div class="mdl-card__menu">
					<button
						class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
						<i class="material-icons">share</i>
					</button>
				</div>
			</div>
		</div>
		<div id="baordDiv"></div>
	</div>
	<!-- mainDivend -->

</body>
</html>

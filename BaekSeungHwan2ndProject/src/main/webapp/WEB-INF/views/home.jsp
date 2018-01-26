<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 메인화면 ]</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"></c:url>"></script>
	
<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="topMenu">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>
	<div class="main">
		<h1>${sessionScope.id }</h1>
		<h1>${sessionScope.name }</h1>
		<h1>${sessionScope.img }</h1>
	</div>
</body>
</html>

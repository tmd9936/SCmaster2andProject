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
<title>[ 메인화면 ]</title>



<style type="text/css">
.topMenu {
	height: 64px;
	width: 100%;
}

#sidebanner {
	position: fixed;
	margin-right: 500px;
	top: 20%;
	height: 25%;
	width: 15%;
	background: #4bc;
	text-align: center;
}

.main {
	margin-left: 20%;
	padding-top: 70px;
}
.subject{
	width: 80%;
	margin: auto;
	height: 30%;
}
.name{
	font-size: 20px;
	font-weight: bold;
}
.pfoot{
	font-size: 11px;
	color: gray;
}
table{
	width: 100%;
	z-index : -1;
}
.mdl-cell mdl-cell--4-col{
	z-index : 999;
}
</style>
<script type="text/javascript">
	$(function(){
		selChange();
		
		$('#subject').change(function(){
			selChange();
		});
		
		
	});
	
	function selChange(){
		var subject = $('#subject option:selected').val();
		$.ajax({
			url : 'group/searchBySubject',
			type : 'get',
			dataType : 'json',
			data : {
				subject : subject
			},
			success : function(list){
				var str = '';
				$.each(list,function(index,item){
					str += '<div class="mdl-cell mdl-cell--4-col">';
					str += '<div class="btnDiv" groupnum="'+item.groupnum+'">'
					str += '<table class="mdl-data-table mdl-js-data-table">';
					str += '<tr><td>그림<td>';
					str += '<td> <p class="name">'+item.name+'<p>';
					str += '<p>'+item.introduce+'</p><br>';
					str += '<p class="pfoot">멤버 '+item.membercount+' 리더 '+item.master +'</td>';
					str += '</tr>';
					str += '</table>';
					str += '</div>'
					str += '</div>';
				});
				$('#veiwGroupDiv').html(str);
				
				$('.btnDiv').on('click',function(){
					var groupnum = $(this).attr('groupnum');
					location.href = 'group/groupForm?groupnum='+groupnum;
				});
			},
			error : function(err){
				console.log(err);
			}
			
		});

		$('#viewsub').text('검색 : '+subject);
	}
	
</script>

</head>
<body>
	<div class="topMenu">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>
	<div id="sidebanner">
		<h4>주제별 찾기</h4>
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
	<div class="main">
		<div id="topsub">
			<h2>주제별 그룹</h2>
			<h4 id="viewsub"></h4>
		</div>
		<div class="mdl-grid" id="veiwGroupDiv">
	
		</div>
	</div>
</body>
</html>

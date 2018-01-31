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
textarea {
	resize: none;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#upload').change(function(){
			if( $("#upload").val() != "" ){
			    $('#imgBtn').removeAttr('disabled');
			    
			}else{
				$('#imgBtn').attr('disabled','disabled');
			}	
		});
		
		$('#imgBtn').on('click',function(){
			var formData = new FormData();
			formData.append("file",$("#upload")[0].files[0]);
			
			$.ajax({
				type : 'post',
				url : '../board/fileupload',
				data : formData,
				processData: false,
			    contentType: false,
				dataType:"text",
				success:function(data){
					console.log(data);
					$("#imgDiv").empty();
					$("#imgDiv").html('<img alt="" src="'+data+'">');
				},
				error: function(e){			
					console.log(e);
				}
			});
		});
	});
</script>
</head>
<body>
	<form action="../board/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardnum" value="${board.boardnum}">
		<input type="hidden" name="id" value="${board.id }">
		
		<table class="mdl-data-table mdl-js-data-table">
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="40" id="content" name="content">${board.content }</textarea>
			</tr>
			<tr>
				<td>
					<input type="file" id="upload" name="upload">
					<input type="button" class="mdl-button mdl-js-button" id="imgBtn" disabled="disabled" value="이미지 전송">
				</td>
			</tr>
		</table>
		<div id="imgDiv">
			<c:if test="${board.originalfile !=null }">
				<img alt="img" src="../board/download?boardnum=${board.boardnum }">
			</c:if>
		</div>
		<input type="submit" value="수정">
		<input type="reset" value="리셋">
	</form>
</body>
</html>
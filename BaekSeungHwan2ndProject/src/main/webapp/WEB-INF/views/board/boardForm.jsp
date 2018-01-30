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
.mdl-dialog {
	width: 42%;
}

.writeText {
	font-weight: bold;
	color: green;
}

.mdl-dialog {
	text-align: center;
}

table {
	text-align: center;
}
textarea {
	resize: none;
}
</style>
<script type="text/javascript">
	$(function() {
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
		
		$('#write').submit(function(){
			var content = $('#content').val();
			if(content.length == 0){
				alert('내용이 없습니다!');
				return;
			}
			$('#upload').val('');
			$('#content').val('');
			dialog.close();
			
		});
		
	});
</script>
</head>
<body>
	<button id="show-dialog" type="button" class="mdl-button">
		<span class="writeText">글쓰기</span>
	</button>
	<dialog class="mdl-dialog">
	<form action="../board/insertBoard" method="post" enctype="multipart/form-data">
		<h4 class="mdl-dialog__title">글쓰기</h4>
		<div class="mdl-dialog__content">
			<input type="hidden" name="id" value="${sessionScope.id }"> <input
				type="hidden" name="groupnum" value="${group.groupnum }">
			<table class="mdl-data-table mdl-js-data-table">
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td><textarea rows="20" cols="50" name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="file" id="upload" name="upload">
						<input type="button" class="mdl-button mdl-js-button" id="imgBtn" disabled="disabled" value="이미지 전송">
					</td>
				</tr>
			</table>
		</div>
		<div id="imgDiv">
	
		</div>
		<div class="mdl-dialog__actions">
			<button type="submit" class="mdl-button">작성</button>
			<button type="button" class="mdl-button close" id="closeBtn">취소</button>
		</div>
	</form>
	</dialog>

</body>
</html>
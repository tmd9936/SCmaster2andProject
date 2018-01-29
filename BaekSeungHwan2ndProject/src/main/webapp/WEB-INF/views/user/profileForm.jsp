<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>프로필 폼</h1>
	<form action="profileUpdate" method="post" enctype="multipart/form-data">
		<table> 
			<thead>
				<tr><th>이미지 선택<th></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="file" name="upload" id="upload">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td><input type="submit" value="사용하기"></td>
				</tr>
			</tfoot>
		</table>
	</form>

</body>
<script type="text/javascript">
	<c:if test="${windowState != null }">
		if('${state}' == false){
			alert('파일이 없거나 잘못된 파일입니다.11');
			window.close();
		}else{
			alert('정상정으로 수정되었습니다.');
			window.close();
		}
	</c:if>
</script>
</html>
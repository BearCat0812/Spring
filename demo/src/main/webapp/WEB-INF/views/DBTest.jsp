<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.text}</td>
				<td><button onClick="UpdateText(${user.id}, '${user.text}')">수정</button></td>
				<td><button onClick="DeleteText(${user.id})">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<form action="InsertText" method="POST">
		<input type="text" name="text">
		<button type="submit">추가</button>
	</form>
</body>
</html>
<script>
	function DeleteText(id){
		location.href="/DeleteText?id="+id // 쿼리스트링
	}
	
	function UpdateText(id, text){
	    var newText = prompt("새 값 입력:", text);
	    if(newText != null && newText != ""){
	        location.href="/UpdateText?id=" + id + "&text=" + encodeURIComponent(newText);
	    }
	}
</script>

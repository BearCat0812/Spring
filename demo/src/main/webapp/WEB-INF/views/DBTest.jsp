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
				<td>${user.test}</td>
				<td><button onClick="UpdateTest(${user.id}, '${user.test}')">수정</button></td>
				<td><button onClick="DeleteTest(${user.id})">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<form action="InsertTest" method="POST">
		<input type="text" name="test">
		<button type="submit">추가</button>
	</form>
</body>
</html>
<script>
	function DeleteTest(id){
		location.href="/DeleteTest?id="+id // 쿼리스트링
	}
	
	function UpdateTest(id, test){
	    var newTest = prompt("새 값 입력:", test);
	    if(newTest != null && newTest != ""){
	        location.href="/UpdateTest?id=" + id + "&test=" + encodeURIComponent(newTest);
	    }
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        background: #f6f8fa;
        font-family: 'Segoe UI', 'Malgun Gothic', Arial, sans-serif;
    }
    table {
        border-collapse: collapse;
        min-width: 600px;
        background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        border-radius: 10px;
        overflow: hidden;
        border: none;
    }
    th, td {
        padding: 12px 18px;
        border-bottom: 1px solid #b6c6e3;
        border-right: 1px solid #b6c6e3;
        text-align: center;
    }
    th:last-child, td:last-child {
        border-right: none;
    }
    th {
        background: #e3f0ff;
        font-weight: 600;
        color: #333;
    }
    tr:last-child td {
        border-bottom: none;
    }
    button {
        background: #4f8cff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 6px 16px;
        font-size: 14px;
        cursor: pointer;
        transition: background 0.2s;
    }
    button:hover {
        background: #2563eb;
    }
    input[type="text"], input[type="date"] {
        border: 1px solid #d1d5db;
        border-radius: 5px;
        padding: 6px 10px;
        font-size: 14px;
        margin-right: 8px;
        outline: none;
        transition: border 0.2s;
    }
    input[type="text"]:focus, input[type="date"]:focus {
        border: 1.5px solid #4f8cff;
    }
    form[action="InsertText"] {
        margin-top: 18px;
        background: #fff;
        padding: 16px 24px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        display: flex;
        align-items: center;
        gap: 8px;
    }
    td form {
        margin: 0;
    }
</style>
</head>
<body style="min-height: 100vh; margin: 0; display: flex; align-items: center; justify-content: center; background: #f6f8fa;">
	<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; width: 100%;">
	<table style="text-align: center;">
		<tr>
			<th></th>
			<th>Date</th>
			<th>Text</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>
				<form action="Check" method="POST">
					<input type="hidden" name="id" value="${user.id}">
					<input type="checkbox" name="checked" value="true" onchange="this.form.submit()" <c:if test="${user.checked}">checked</c:if>>
				</form>
				</td>
				<td>${user.date}</td>
				<td><span style="${user.checked ? 'text-decoration: line-through;' : ''}">${user.text}</span></td>
				<td><button onClick="UpdateText(${user.id}, '${user.text}')">수정</button></td>
				<td><button onClick="DeleteText(${user.id})">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<form action="InsertText" method="POST" style="margin-top: 10px;">
		<input type="date" name="date">
		<input type="text" name="text">
		<button type="submit">추가</button>
	</form>
	</div>
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

	function toggleStrike(checkbox) {
	    var text = document.getElementById("myText");
	    if (checkbox.checked) {
	        text.style.textDecoration = "line-through";
	    } else {
	        text.style.textDecoration = "none";
	    }
	}

	// 페이지 로드시 checked 상태 반영
	window.onload = function() {
	    var checkbox = document.getElementById("myCheck");
	    toggleStrike(checkbox);
	}
</script>

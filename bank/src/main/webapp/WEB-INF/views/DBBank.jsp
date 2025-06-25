<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은행 관리 시스템</title>
<style>
@charset "UTF-8";

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f9;
	color: #333;
	margin: 0;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h1 {
	color: #4a4a4a;
}

table {
	width: 80%;
	max-width: 800px;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e2e2e2;
}

input[type="text"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

button.delete {
	background-color: #f44336;
}

button.delete:hover {
	background-color: #da190b;
}

button.action {
	background-color: #008CBA;
}

button.action:hover {
	background-color: #007ba7;
}

.form-container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	width: 80%;
	max-width: 800px;
}

.form-container table {
	width: 100%;
	box-shadow: none;
	border-radius: 0;
	border: none;
}
</style>
</head>
<body>
	<h1>은행 관리 시스템</h1>

	<div class="form-container">
		<form action="Regist" method="POST">
			<table>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" id="name" name="name"
						placeholder="이름을 입력하세요"></td>
					<td>
						<button type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>계좌</th>
				<th>잔액</th>
				<th colspan="3">작업</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.name}</td>
					<td>${user.num}</td>
					<td>${user.cash}</td>
					<td><button class="action"
							onClick="Deposit(${user.num}, '${user.cash}')">입금</button></td>
					<td><button class="action"
							onClick="Withdrawal(${user.num}, '${user.cash}')">출금</button></td>
					<td><button class="delete" onClick="DeleteUser(${user.num})">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
<script>
	function Deposit(num, cash) {
		var DepositCash = prompt("입금하실 금액을 입력해주세요 : ", cash);
	    if(DepositCash != null && DepositCash != "") {
	    	newCash = (Number(cash) + Number(DepositCash));
	        location.href="/Deposit?num=" + num + "&cash=" + encodeURIComponent(newCash);
	    }
	}
	
	function Withdrawal(num, cash) {
		var WithdrawalCash = prompt("출금하실 금액을 입력해주세요 : ", cash);
	    if(WithdrawalCash != null && WithdrawalCash != "") {
	    	newCash = (Number(cash) - Number(WithdrawalCash));
	    	if (newCash < 0) {
	    		alert("잔액이 부족합니다.");
	    	} else {
		        location.href="/Withdrawal?num=" + num + "&cash=" + encodeURIComponent(newCash);
	    	}
	    }
	}
	
	function DeleteUser(num){
		location.href="/DeleteUser?num=" + num // 쿼리스트링
	}

</script>
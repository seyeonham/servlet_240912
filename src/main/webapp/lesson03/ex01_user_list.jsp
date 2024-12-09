<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<title>가입된 유저 목록</title>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// select
	String selectQuery = "select * from `new_user`";
	ResultSet result = ms.select(selectQuery);
%>
	<div class="container">
		<h1>가입된 유저 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>자기소개</th>
					<th>삭제
				</tr>
			</thead>
			<tbody>
			<%
				while (result.next()) {
			%>
				<tr>
					<td><%= result.getInt("id") %></td>
					<td><%= result.getString("name") %></td>
					<td><%= result.getString("yyyymmdd") %></td>
					<td><%= result.getString("email") %></td>
					<td><%= result.getString("introduce") %></td>
					<td><a href="/lesson03/delete_ex01?id=<%= result.getInt("id") %>" class="btn btn-danger">삭제</a></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
<%
	// DB 연결 해제
	ms.disconnect();
%>
</body>
</html>
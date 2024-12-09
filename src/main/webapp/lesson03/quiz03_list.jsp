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
<title>Hong당무 마켓</title>

<style>
	a:hover {text-decoration:none;}
	header {height:100px; background-color:darkorange;}
	nav {height:50px; background-color:darkorange;}
	.contents {min-height:500px;}
	footer {height:50px;}
	.box {border:1px solid darkorange; width:350px; height:300px;}
</style>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// DB select
	String selectQuery = "select seller.*, used_goods.*"
			+ "from seller"
			+ " join used_goods"
			+ " on seller.id = used_goods.sellerId";
	ResultSet result = ms.select(selectQuery);
	
%>
	<div class="container">
		<header class="d-flex align-items-center justify-content-center">
			<h1 class="text-white">HONG당무 마켓</h1>
		</header>
		<nav>
			<ul class="nav nav-fill font-weight-bold">
				<li class="nav-item"><a href="/lesson03/quiz03_list.jsp" class="nav-link text-white">리스트</a></li>
				<li class="nav-item"><a href="/lesson03/quiz03_insert.jsp" class="nav-link text-white">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="contents">
			<div class="d-flex flex-wrap">
			<%
				while (result.next()) {
			%>
				<div class="box m-2">
					<div class="m-2"><image src="<%= result.getString("pictureUrl") %>" alt="상품이미지" width="330" height="200"></div>
					<div class="font-weight-bold ml-2"><%= result.getString("title") %></div>
					<div class="text-secondary ml-2"><%= result.getInt("price") %></div>
					<div class="ml-2"><%= result.getString("nickname") %></div>
				</div>
			<%
				}
			%>
			</div>
		</section>
		<footer class="d-flex align-items-center justify-content-center">
			<small class="text-secondary">Copyright 2024. HONG All Rights Reserved.</small>
		</footer>
	</div>
<%
	// DB 연결 해제
	ms.disconnect();
%>
</body>
</html>
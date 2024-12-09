<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.contents {min-height:300px;}
	footer {height:50px;}
	.box {padding-left:80px; padding-top:50px; padding-right:80px;}
	.btn {background-color:#9994;}
</style>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// DB select
	String selectQuery = "select * from seller";
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
			<div class="box">
				<div class="display-4">물건 올리기</div>
				<form method="post" action="/lesson03/insert_quiz03">
					<div class="d-flex mt-5">
						<select name="nickname" class="form-control col-3">
							<option>-아이디 선택-</option>
						<%
							while (result.next()) {
						%>
							<option><%= result.getString("nickname") %></option>
						<%
							}
						%>
						<input type="text" class="form-control col-5 mx-5" placeholder="제목" name="title">
						<div class="input-group">
							<input type="text" class="form-control col-8" placeholder="가격" name="price">
						 	<div class="input-group-append">
						    <span class="input-group-text">원</span>
							</div>
						</div>
					</div>
					<textarea class="form-control mt-3" rows="8" name="description"></textarea>
					<div class="input-group mt-3">
						<div class="input-group-prepend">
					    	<span class="input-group-text">이미지 url</span>
					  	</div>
					  	<input type="text" class="form-control" name="url">
					</div>
					<button type="submit" class="btn form-control mt-3">저장</button>
				</form>
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
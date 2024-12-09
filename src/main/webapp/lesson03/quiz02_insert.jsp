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
<title>즐겨찾기 추가</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가</h1>
		<form method="post" action="/lesson03/insert_quiz02">
			<div class="form-group">
			<label for="name" class="m-0">사이트명:</label>
			<input type="text" name="name" id="name" class="form-control col-4">
			</div>
			<div class="form-group">
			<label for="url" class="m-0">사이트 주소:</label>
			<input type="text" name="url" id="url" class="form-control col-7">
			</div>
			<input type="submit" class="btn btn-success" value="추가">
		</form>
	</div>
</body>
</html>
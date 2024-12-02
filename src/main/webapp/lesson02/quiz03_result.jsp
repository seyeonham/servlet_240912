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
<title>BMI 계산</title>
</head>
<body>
	<%
		int height = Integer.valueOf(request.getParameter("height"));
		int weight = Integer.valueOf(request.getParameter("weight"));
		double BMI = weight / ((height / 100.0) * (height / 100.0));
		
		String result = null;
		if (BMI <= 20) {
			result = "저체중";
		} else if (BMI <= 25) {
			result = "정상";
		} else if (BMI <= 30) {
			result = "과체중";
		} else {
			result = "비만";
		}
	%>

	<div class="container">
		<h1>BMI 측정 결과</h1>
		<div class="display-4">당신은 <span class="text-info"><%= result %></span> 입니다.</div>
		BMI 수치 : <%= BMI %>
	</div>
</body>
</html>
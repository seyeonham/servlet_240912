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
<title>길이 변환</title>
</head>
<body>
	<%
	 	int cm = Integer.parseInt(request.getParameter("cm"));
		String[] units = request.getParameterValues("unit");
		
		double in = cm * 0.39;
		double yd = cm / 91.44;
		double ft = cm / 30.48;
		double m = cm / 100.0;
	%>
	
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h3><%= cm %>cm</h3>
		<hr>
		<h2>
		<%
			
			for (int i = 0; i < units.length; i++) {
				if (units[i].equals("인치")) {
					out.print(in + " in<br>");
				} else if (units[i].equals("야드")) {
					out.print(yd + " yd<br>");
				} else if (units[i].equals("피트")) {
					out.print(ft + " ft<br>");
				} else if (units[i].equals("미터")) {
					out.print(m + "m<br>");
				}
			}
		%>
		</h2>
	</div>
</body>
</html>
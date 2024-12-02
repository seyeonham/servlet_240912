<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01</title>
</head>
<body>
	<h1>Ex01</h1>
	
	<!-- HTML의 주석: 소스보기에서 보인다 -->
	<%-- JSP의 주석: 소스보기에서 보이지 않는다 --%>
	
	<%
		// scriptlet
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
		}
	%>
	
	<b>합계:</b>
	<input type="text" value="<%=sum %>">
	<br>
	
	<%!
		// 선언문 - 마치 클래스 같은 느낌(필드, 메소드)
		
		// 필드
		int num = 150;
		
		// 메소드
		String getHelloWorld() {
			return "Hello World!";
		}
	%>
	
	<%= getHelloWorld() %>
	<br>
	<%= num + 230 %>
	
	<%
		List<String> list = new ArrayList<>();
	%>
</body>
</html>
package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		// request parameter 꺼내기
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		// "3" -> 3
		// Integer.parseInt("3");
		// Integer.parseInt(null); => error
		int age = Integer.parseInt(request.getParameter("age"));
		
		
		// 출력
		PrintWriter out = response.getWriter();
		/*
		 * {"user_id":"aaaa", "name":"함세연", "age":22}
		 */
		
		// JSON String 구성
		out.print("{\"user_id\":\"" + userId + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
		
//		out.println("유저 아이디:" + userId);
//		out.println("이름:" + name);
//		out.println("나이:" + age);
		
	}
}

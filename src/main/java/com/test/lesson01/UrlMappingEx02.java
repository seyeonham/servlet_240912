package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex02") // servlet 등록 + url mapping
public class UrlMappingEx02 extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		// 1+2+3+4+...+9+10 합계
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
		}
		
		// 출력
		// 서블릿: 자바 + html 
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>합계 결과</title></head><body>");
		out.print("합계:<b>" + sum + "<b>");
		out.print("</body></html>");
	}
}

package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz02 extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		// 날짜(시간) 포맷 지정
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
		// 출력
		PrintWriter out = response.getWriter();
		out.println("현재 시간은 " + sdf.format(now) + " 입니다.");
	}
}

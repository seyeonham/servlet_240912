package com.test.lesson03;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/insert_quiz03")
public class InsertQuiz03 extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		// request param
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		String url = request.getParameter("url");
		
		// DB 접속
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// DB insert
		String insertQuery = "insert into `used_goods`"
				+ "(`sellerId`, `title`, `description`, `price`, `pictureUrl`)"
				+ "values"
				+ "('" + nickname + "', '" + title + "', '" + description + "', " + price + ", '" + url + "');";
		
		// DB 접속 해제
		ms.disconnect();
	}
}

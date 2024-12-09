package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/delete_quiz02")
public class DeleteQuiz02 extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// request param
		int id = Integer.parseInt(request.getParameter("id"));
		
		// DB 접속
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// DB delete
		String deleteQuery = "delete from `bookmark` where `id`=" + id;
		try {
			ms.update(deleteQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 접속 해제
		ms.disconnect();
		
		// table로 redirect
		response.sendRedirect("/lesson03/quiz02_table.jsp");
	}
}

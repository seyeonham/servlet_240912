package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	// field
	private static MysqlService mysqlService = null;
	
	private static final String URL = "jdbc:mysql://localhost:3306/test_240912"; // db 접속 주소 뒤에 데이터베이스명까지 쓴다
	private static final String ID = "root";
	private static final String PASSWORD = "root";
	
	private Connection conn;
	private Statement statement;
	private ResultSet res;
	
	// method
	
	// 객체 생성 - singleton 패턴: MysqlService라는 객체가 단 하나만 생성될 수 있도록하는 디자인패턴
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService = new MysqlService();
		}
		return mysqlService;
	}
	
	// DB 접속 -> JDBC
	public void connect() {
		try {
			// 1. 드라이버 메모리에 로딩
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			// 2. DB 연결
			conn = DriverManager.getConnection(URL, ID, PASSWORD);
			
			// 3. statement -> DB 연결해서 쿼리를 실행하기 위한 준비
			statement = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 연결 해제
	public void disconnect() {
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Read - select
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	}
	
	// CUD - insert update delete
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
	}
}

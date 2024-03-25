package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(Connection con, Statement stmt) {
		try {
			stmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

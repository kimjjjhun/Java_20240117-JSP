package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {

   public static Connection getConnection() {
      Connection conn = null;

      try {
         Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext
               .lookup("java:/comp/env/jdbc/myoracle");
         conn = ds.getConnection();
      } catch (NamingException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return conn;
   }

   // 사용 끝난 자원 닫아 줘야 한다. 근데 여러번 하면 귀찮으니까
   public static void close(ResultSet rs, Statement stmt, Connection conn) {
      // 사용 된것만 닫음.
      try {
         if (rs != null)
            rs.close();
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   // DML(insert, update, delete)문의 사용하고 나서 정리
   public static void close(Statement stmt, Connection conn) {
      // 사용 된것만 닫음.
      try {
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}
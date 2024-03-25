package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.saeyan.dto.BoardVO;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		return instance;
	}

	private static Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	private void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void close(Connection con, Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 전체데이터 가져오기
	public List<BoardVO> selectAllBoards() {
		List<BoardVO> list = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from board order by num desc";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setWritedate(rs.getTimestamp("writedate"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return list;
	}

	// 게시물 수정
	public BoardVO selectBoardByNum(int num) {

		BoardVO vo = new BoardVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from board where num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setWritedate(rs.getTimestamp("writedate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return vo;
	}
	
	//조회수 증가
	public void updateReadCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "update board set readcount = readcount+1 where num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
	}

	// 게시물 작성
	public void insertBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "insert into board(num,pass,name,email,title,content) " + " values(board_seq.nextval,?,?,?,?,?)";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			// vo에 값을저장 executeUpdate
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
	}

	// 게시물 업데이트
	public void updateBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "update board set name=?,pass=?,email=?,title=?,content=? where num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
	}

	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "delete from board where num = ?";

		try {
			// db연결
			con = getConnection();
			// sql구문전송
			pstmt = con.prepareStatement(sql);
			// 매핑
			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
	}
	
	public BoardVO checkPassWord(String pass,int num) {

		BoardVO vo = new BoardVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from board where pass = ? and num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setInt(2, num);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setWritedate(rs.getTimestamp("writedate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return vo;
	}
}

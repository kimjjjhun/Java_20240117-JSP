package com.ezen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezen.dto.MovieVO;

import util.DBManager;

//싱글톤패턴 DAO
public class MovieDAO {
	private static MovieDAO instance = new MovieDAO();
	
	private MovieDAO() {}
	
	public static MovieDAO getInstance() {
		return instance;
	}
	
	//전체 리스트 가져오기
	public List<MovieVO> GetmovieList(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		String sql = "select * from movie";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1.DB연결
			con = DBManager.getConnection();
			//2.sql구문전송
			pstmt = con.prepareStatement(sql);	
			//rs에 값저장
			rs = pstmt.executeQuery();
			//반복문실행으로 rs의 값을 꺼냄
			while(rs.next()) {
				MovieVO vo = new MovieVO();
				
				vo.setCode(rs.getInt("code"));
				vo.setTitle(rs.getString("title"));
				vo.setPrice(rs.getInt("price"));
				vo.setDirector(rs.getString("director"));
				vo.setActor(rs.getString("actor"));
				vo.setPoster(rs.getString("poster"));
				vo.setSynopsis(rs.getString("synopsis"));
				//꺼낸값을 넣음
				list.add(vo);
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, con);
		}
		return list;
	}
	
	//영화1개 가져오기
	public MovieVO getOneMovie(int code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieVO vo = new MovieVO();
		String sql = "select * from movie where code=?";
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setCode(rs.getInt("code"));
				vo.setTitle(rs.getString("title"));
				vo.setPrice(rs.getInt("price"));
				vo.setDirector(rs.getString("director"));
				vo.setActor(rs.getString("actor"));
				vo.setPoster(rs.getString("poster"));
				vo.setSynopsis(rs.getString("synopsis"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, con);
		}
		
		return vo;
	}
	
	//영화 수정
	public void updateMovie(MovieVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update movie set title=?, price=?, director=?,actor=?,poster=?,synopsis=? where code=?";
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,vo.getTitle());
			pstmt.setInt(2,vo.getPrice());
			pstmt.setString(3,vo.getDirector());
			pstmt.setString(4,vo.getActor());
			pstmt.setString(5,vo.getPoster());
			pstmt.setString(6,vo.getSynopsis());
			pstmt.setInt(7,vo.getCode());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, con);
		}
	}
	
	//영화 추가
	public void insertMovie(MovieVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into movie(code, title, price, director,actor,poster,synopsis) "
				+ "values(movie_seq.nextval,?,?,?,?,?,?)";
		
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,vo.getTitle());
			pstmt.setInt(2,vo.getPrice());
			pstmt.setString(3,vo.getDirector());
			pstmt.setString(4,vo.getActor());
			pstmt.setString(5,vo.getPoster());
			pstmt.setString(6,vo.getSynopsis());
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, con);
		}
	}
	
	//영화 삭제
	public void deleteMovie(int code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from movie where code = ?";
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,code);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, con);
		}
	}
	}

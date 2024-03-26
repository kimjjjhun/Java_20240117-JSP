package com.ott.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ott.controller.util.DBManager;
import com.ott.dto.MemberVO;


public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return instance;
	}

	//ID중복체크
			public int confirmID(String userid) {
				
				String sql = "select userid from member where userid =?";
				int result = -1;
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				System.out.println("userid" + userid);
				try {
					con = DBManager.getConnection();
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, userid);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1; // ID 사용가능
					}else {
						result = -1; // ID중복 사용불가
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					DBManager.close(con, pstmt, rs);
				}
				return result;
			}

	// 회원가입
	public int insertMember(MemberVO mVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "INSERT INTO member (userid, admin, name, pwd, email, phone, address)VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			con = DBManager.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mVo.getUserid());
			pstmt.setInt(2, mVo.getAdmin());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPwd());
			pstmt.setString(5, mVo.getEmail());
			pstmt.setString(6, mVo.getPhone());
			pstmt.setString(7, mVo.getAddress());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return result;
	}

	// 로그인체크
	public int userCheck(String userid, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		int result = -1;
		
		String sql = "select pwd from member where userid = ?";
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)){
					result = 1; // 아이디,비밀번호 일치
				}else {
					result = -1; // 비밀번호 불일치
				}
			}	else {
					result = 0; // 아이디 불일치
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return result;
}

	public MemberVO getMember(String userid) {
		String sql = "select * from member where userid=?";
		MemberVO mVo = new MemberVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mVo.setUserid(rs.getString("userid"));
				mVo.setAdmin(rs.getInt("admin"));
				mVo.setName(rs.getString("name"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return mVo;
	}
	// id찾기
	public String findId(String name,String email) {
		String sql = "select userid from member where name = ? and email = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userid = null;
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userid");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		return userid;
	}
	
	// pw찾기
		public String findPw(String userid,String email) {
			String sql = "select pwd from member where userid = ? and email = ?";
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String pwd = null;
			
			try {
				con = DBManager.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,userid);
				pstmt.setString(2,email);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pwd = rs.getString("pwd");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
			return pwd;
		}
		//카카오로그인 db이메일 체크
		public boolean checkEmailExists(String email) {
			boolean result = false;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = DBManager.getConnection();
				String sql = "select count(*) from member where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,email);
				rs= pstmt.executeQuery();
				
				if(rs.next()) {
					int count = rs.getInt(1);
					if(count > 0) {
						result = true;
					}
				}
			}	catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
			return result;
		}
}

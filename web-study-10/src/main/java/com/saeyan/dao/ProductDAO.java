package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.ProductVO;

import util.DBManager;

public class ProductDAO {
	
	private static ProductDAO instance = new ProductDAO();
	
	private ProductDAO() {}

	public static ProductDAO getInstance() {
		return instance;
	}
	
	public List<ProductVO> selectAllProudcts(){
		
		String sql = "select * from product order by code desc";
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				
				vo.setCode(rs.getInt("code"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				vo.setPictureUrl(rs.getString("pictureUrl"));
				vo.setDescription(rs.getString("description"));
				
				list.add(vo);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return list;
	}
	
public	void insertProduct(ProductVO vo) {
	String sql = "insert into product values(product_seq.nextval, ?,?,?,?)";
	Connection con = null;
	PreparedStatement pstmt = null;
	 
	try {
		 //DB연결
		 con = DBManager.getConnection();
		 //구문전송
		 pstmt = con.prepareStatement(sql);
		 //맵핑
		 pstmt.setString(1,vo.getName());
		 pstmt.setInt(2,vo.getPrice());
		 pstmt.setString(3,vo.getPictureUrl());
		 pstmt.setString(4,vo.getDescription());
		 
		 pstmt.executeUpdate();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 DBManager.close(con,pstmt);
	 }
	}
	
public	int confirmID(String userid) {
		return 0;
	}
	
public	int userCheck(String userid, String pwd) {
		return 0;
	}
	
public	ProductVO selectProductByCode(int code) {
	String sql = "select * from product where code = ?";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ProductVO vo = new ProductVO();
	try {
		//1.DB연결
		con = DBManager.getConnection();
		//2.sql구문전송
		pstmt = con.prepareStatement(sql);
		//3.매핑
		pstmt.setInt(1,code);
		//4.DB값 rs에 저장
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			vo.setCode(rs.getInt("code"));
			vo.setName(rs.getString("name"));
			vo.setPrice(rs.getInt("price"));
			vo.setPictureUrl(rs.getString("pictureurl"));
			vo.setDescription(rs.getString("description"));
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		//사용한 DB경로 con ,pstmt , rs 를 닫아준다.
		DBManager.close(con, pstmt , rs);
	}
	// vo에 저장된값을 productVO에 저장
	return vo;
	}
	
public	void updateProduct(ProductVO vo) {
	String sql = "update product set name=? , price = ?, pictureurl=?,"
			+ "description=? where code=? ";
	Connection con = null;
	PreparedStatement pstmt = null;
	 
	try {
		 //DB연결
		 con = DBManager.getConnection();
		 //구문전송
		 pstmt = con.prepareStatement(sql);
		 //맵핑
		 pstmt.setString(1,vo.getName());
		 pstmt.setInt(2,vo.getPrice());
		 pstmt.setString(3,vo.getPictureUrl());
		 pstmt.setString(4,vo.getDescription());
		 pstmt.setInt(5,vo.getCode());
		 
		 pstmt.executeUpdate();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 DBManager.close(con,pstmt);
	 }
	}

	public void deleteProduct(int code) {
		String sql = "delete product where code = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		 
		try {
			 //DB연결
			 con = DBManager.getConnection();
			 //구문전송
			 pstmt = con.prepareStatement(sql);
			 //맵핑
			 pstmt.setInt(1,code);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 DBManager.close(con,pstmt);
	}
	}
}


package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.yl.dto.Manager_dto;
import com.yl.dto.Member_dto;

public class Manager_dao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int MANAGER_EXIST = 1;
	public static final int MANAGER_NONEXIST = 0;
	
	private Manager_dao() {
	}
	
	private static Manager_dao instance = new Manager_dao();
	public static Manager_dao getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	public int joinManager(String mgid,String mgpw,String mgname,String mgpartname) {
		int result = FAIL;
		String sql = "INSERT INTO MANAGER (MGID,MGPW,MGNAME,MGPARTNAME) VALUES "
				+ "(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			pstmt.setString(2, mgpw);
			pstmt.setString(3, mgname);
			pstmt.setString(4, mgpartname);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
	public Manager_dto loginManager(String mgid,String mgpw) {
		Manager_dto manager = null;
		String sql = "SELECT * FROM MANAGER WHERE MGID=? AND MGPW=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			pstmt.setString(2, mgpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mgname = rs.getString("mgname");
				String mgpartname = rs.getString("mgpartname");
				manager = new Manager_dto(mgid, mgpw, mgname, mgpartname);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return manager;
	}
	
	public int registProduct(String pcode, String pname, int pprice, String pimage,int pstock,String pdescription) {
		int result = FAIL;
		String sql = "INSERT INTO PRODUCT (PCODE,PNAME,PPRICE,PIMAGE,PSTOCK,PDESCRIPTION) VALUES (?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setString(2, pname);
			pstmt.setInt(3, pprice);
			pstmt.setString(4, pimage);
			pstmt.setInt(5, pstock);
			pstmt.setString(6, pdescription);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
}

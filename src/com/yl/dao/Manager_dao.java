package com.yl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Manager_dto;

public class Manager_dao {
	
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
	public boolean joinManager(String mgid,String mgpw,String mgname,String mgpartname) {
		boolean result = false;
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
			result = pstmt.executeUpdate()==1;
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
	public boolean mgidConfirm(String mgid) {
		boolean result = false;
		String sql = "SELECT * FROM MANAGER WHERE MGID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			rs = pstmt.executeQuery();
			result = rs.next();
		} catch (Exception e) {
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
		
		return result;
	}
	public boolean mgModify(String mgid,String mgpw,String mgname, String mgpartname) {
		boolean result = false;
		String sql = "UPDATE MANAGER SET MGPW=?, MGNAME=?,MGPARTNAME=? WHERE MGID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgpw);
			pstmt.setString(2, mgname);
			pstmt.setString(3, mgpartname);
			pstmt.setString(4, mgid);
			result = pstmt.executeUpdate()==1;
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
	
	public Manager_dto getManager(String mgid) {
		Manager_dto manager = null;
		String sql = "SELECT * FROM MANAGER WHERE MGID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
		
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mgpw = rs.getString("mgpw");
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
	
	
}

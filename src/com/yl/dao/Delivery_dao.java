package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Delivery_dto;

public class Delivery_dao {
private Delivery_dao() {
		
	}
	
	private static Delivery_dao instance = new Delivery_dao();
	public static Delivery_dao getInstance() {
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
	
	
	private void addDeliveryPre(String dname, String dphone, int dprice,String dcompany,String daddress) {
		String sql = "INSERT INTO DELIVERY (DNO,DNAME,DPHONE,DPRICE,DCOMPANY,DADDRESS) VALUES (DNO_SEQ.NEXTVAL,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, dphone);
			pstmt.setInt(3, dprice);
			pstmt.setString(4, dcompany);
			pstmt.setString(5, daddress);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addDeliveryPre오류:"+e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public int addDelivery(String dname, String dphone, int dprice,String dcompany,String daddress) {
		int result = 0;
		addDeliveryPre(dname, dphone, dprice, dcompany, daddress);
		String sql = "SELECT NVL(MAX(DNO),0) FROM DELIVERY";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println("addDelivery오류"+e.getMessage());
			}
		}
		return result;
	}
	
	public boolean finishDelivery(int dno,Date parrive_date) {
		boolean result = false;
		String sql = "UPDATE DELIVERY SET PARRIVE_DATE = ? WHERE DNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, parrive_date);
			pstmt.setInt(2, dno);
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
	public boolean finishDelivery(int dno,boolean today) {
		boolean result = false;
		String sql = "UPDATE DELIVERY SET PARRIVE_DATE = SYSDATE WHERE DNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
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
	
	public Delivery_dto getDelivery(int dno) {
		Delivery_dto delivery = null;
		String sql = "SELECT * FROM DELIVERY WHERE DNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int dprice = rs.getInt("dprice");
				String dname = rs.getString("dname");
				String dphone = rs.getString("dphone");
				String dcompany = rs.getString("dcompany");
				String daddress = rs.getString("daddress");
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				delivery = new Delivery_dto(dno, dname, dphone, dprice, dcompany, daddress, odate, parrive_date);
				
			}
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
		return delivery;
	}
	
}

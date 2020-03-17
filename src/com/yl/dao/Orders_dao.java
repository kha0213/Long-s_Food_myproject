package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Orders_dto;

public class Orders_dao {
private Orders_dao() {
		
	}
	
	private static Orders_dao instance = new Orders_dao();
	public static Orders_dao getInstance() {
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
	
	
	private void addOrdersPre(int purchase_amount,int dno,String mid) {
		String sql = "INSERT INTO ORDERS VALUES(ONO_SEQ.NEXTVAL,SYSDATE,NULL,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, purchase_amount);
			pstmt.setInt(2, dno);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
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
	}
	public int addOrders(int purchase_amount,int dno,String mid) {
		addOrdersPre(purchase_amount,dno, mid);
		int ono = 0;
		String sql = "SELECT MAX(ONO) FROM ORDERS";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			ono = rs.getInt(1);
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
		return ono;
	}
	public Orders_dto getOrder(int ono) {
		Orders_dto order =null;
		String sql = "SELECT * FROM ORDERS WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				int purchase_amount = rs.getInt("purchase_amount");
				int dno = rs.getInt("dno");
				String mid = rs.getString("mid");
				order = new Orders_dto(ono, odate, parrive_date, null, null, purchase_amount, dno, mid);
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
		return order;
	}
	public void finishDelivery(int ono,Date parrive_date) {
		String sql = "UPDATE ORDERS SET PARRIVE_DATE = ? WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, parrive_date);
			pstmt.setInt(2, ono);
			pstmt.executeUpdate();
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
	}
	public boolean finishDeliveryToday(int ono) {
		boolean result = false;
		String sql = "UPDATE ORDERS SET PARRIVE_DATE = SYSDATE WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			result = pstmt.executeUpdate()==1;
		} catch (Exception e) {
			System.out.println("finishDeliveryToday오류:"+e.getMessage());
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
	public int getDao(int ono) {
		int dno = 0;
		String sql = "SELECT DNO FROM ORDERS WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();
			if(rs.next())
			dno = rs.getInt(1);
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
		return dno;
	}
}

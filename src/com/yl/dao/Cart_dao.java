package com.yl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Cart_dto;

public class Cart_dao {
	
	private Cart_dao() {
	}
	
	private static Cart_dao instance = new Cart_dao();
	public static Cart_dao getInstance() {
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
	public boolean cartProductExist(String mid,String pcode) {
		boolean result = false;
		String sql = "SELECT * FROM CART WHERE MID=? AND PCODE=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pcode);
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
	public boolean cartAddProduct(String mid,String pcode,int pcnt) {
		boolean result = false;
		String sql = "INSERT INTO CART VALUES (CTNO_SEQ.NEXTVAL,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pcode);
			pstmt.setInt(3, pcnt);
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
	public ArrayList<Cart_dto> getCart(String mid) {
		ArrayList<Cart_dto> cart = new ArrayList<Cart_dto>();
		String sql = "SELECT C.*,P.PSTOCK,P.PDISCOUNT,P.PPRICE,P.PNAME,P.PIMAGE FROM CART C,PRODUCT P,MEMBER M WHERE M.MID=C.MID AND P.PCODE=C.PCODE AND M.MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ctno = rs.getInt("ctno");
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				int pcnt = rs.getInt("pcnt");
				int pstock = rs.getInt("pstock");
				int pprice = rs.getInt("pprice");
				int pdiscount = rs.getInt("pdiscount");
				cart.add(new Cart_dto(ctno, mid, pname, pcode, pimage, pcnt, pprice, pstock, pdiscount));
			}
		} catch (Exception e) {
			System.out.println("getCart오류:"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return cart;
	}
	public boolean cartEmpty(String mid) {
		boolean result = false;
		String sql = "DELETE FROM CART WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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
}

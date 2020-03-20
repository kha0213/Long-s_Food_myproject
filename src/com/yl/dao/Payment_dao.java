package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Coupon_dto;
import com.yl.dto.Payment_dto;

public class Payment_dao {
	
	private Payment_dao() {
	}
	
	private static Payment_dao instance = new Payment_dao();
	public static Payment_dao getInstance() {
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
	
	public Payment_dto getPaymentOno(int ono) {
		Payment_dto payment = null;
		String sql = "SELECT * FROM PAYMENT WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int pano = rs.getInt("pano");
				int product_all_pay = rs.getInt("product_all_pay");
				int discount = rs.getInt("discount");
				int coupondiscount = rs.getInt("coupondiscount");
				int usepoint = rs.getInt("usepoint");
				int purchase_amount = rs.getInt("purchase_amount");
				payment = new Payment_dto(pano, ono, product_all_pay, discount, coupondiscount, usepoint, purchase_amount);
			}
				
		} catch (Exception e) {
			System.out.println("getMemberCoupon오류:"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return payment;
	}
	public boolean addPayment(int ono,int product_all_pay,int discount,int coupondiscount,int usepoint,int purchase_amount) {
		boolean result = false;
		
		String sql = "INSERT INTO PAYMENT (PANO,ONO,PRODUCT_ALL_PAY,DISCOUNT,COUPONDISCOUNT,USEPOINT,PURCHASE_AMOUNT) VALUES" + 
				"    (PANO_SEQ.NEXTVAL,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			pstmt.setInt(2, product_all_pay);
			pstmt.setInt(3, discount);
			pstmt.setInt(4, coupondiscount);
			pstmt.setInt(5, usepoint);
			pstmt.setInt(6, purchase_amount);
			result = pstmt.executeUpdate()==1;
		} catch (Exception e) {
			System.out.println("addPayment오류: "+e.getMessage());
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

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

public class Coupon_dao {
	
	private Coupon_dao() {
	}
	
	private static Coupon_dao instance = new Coupon_dao();
	public static Coupon_dao getInstance() {
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
	public ArrayList<Coupon_dto> getMemberCoupon(String mid) {
		ArrayList<Coupon_dto> coupons = new ArrayList<Coupon_dto>();
		String sql = "SELECT * FROM COUPON WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cono = rs.getInt("cono");
				String cname = rs.getString("cname");
				int ccondition = rs.getInt("ccondition");
				int cdisper = rs.getInt("cdisper");
				int cdiscash = rs.getInt("cdiscash");
				Date cordate = rs.getDate("cordate"); 
				Date cvalidity = rs.getDate("cvalidity");
				coupons.add(new Coupon_dto(cono, cname, ccondition, cdisper, cdiscash, cordate, cvalidity, mid));
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
		return coupons;
	}
	public int getMCouponCnt(String mid) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM COUPON WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
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
		return result;
	}
	public boolean addCoupon(String cname,int ccondition,int cdisper,int cdiscash,int cvalidity,String mid) {
		boolean result = false;
		
		String sql = "INSERT INTO COUPON (CONO,CNAME,CCONDITION,CDISPER,CDISCASH,CORDATE,CVALIDITY,MID) VALUES" + 
				" (CONO_SEQ.NEXTVAL,?,?,?,?,SYSDATE,SYSDATE+"+cvalidity+",?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cname);
			pstmt.setInt(2, ccondition);
			pstmt.setInt(3, cdisper);
			pstmt.setInt(4, cdiscash);
			pstmt.setString(5, mid);
			result = pstmt.executeUpdate()==1;
		} catch (Exception e) {
			System.out.println("addCoupon오류: "+e.getMessage());
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
	public boolean deleteCoupon(int cono) {
		boolean result = false;
		String sql = "DELETE FROM COUPON WHERE CONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cono);
			result = pstmt.executeUpdate()==1;
		} catch (Exception e) {
			System.out.println("deleteCoupon 오류: "+e.getMessage());
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

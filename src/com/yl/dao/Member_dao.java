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

import com.yl.dto.Member_dto;

public class Member_dao {
	
	private Member_dao() {
		
	}
	
	private static Member_dao instance = new Member_dao();
	public static Member_dao getInstance() {
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
	
	public boolean midConfirm(String mid) {
		boolean result = false;
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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
	
	
	public boolean joinMember(String mid,String mpw,String mname,String mphone,String maddress, 
			Date mbirth,String memail,String mgender) {
		boolean result = false;
		String sql = "INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MBIRTH,MEMAIL,MGENDER,GNO) VALUES "
				+ "(?,?,?,?,?,?,?,?,1)";
		// mid, mpw, mname, mphone, maddress, mbirth, memail mgender
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			pstmt.setString(3, mname);
			pstmt.setString(4, mphone);
			pstmt.setString(5, maddress);
			pstmt.setDate(6, mbirth);
			pstmt.setString(7, memail);
			pstmt.setString(8, mgender);
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
	public void adMember(String mid,int ad_email,int ad_phone,int ad_call) {
		String sql = "INSERT INTO AD (MID,AD_EMAIL,AD_PHONE,AD_CALL) " + 
				"VALUES (?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, ad_email);
			pstmt.setInt(3, ad_phone);
			pstmt.setInt(4, ad_call);
			pstmt.executeUpdate();
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
		
	}
	public boolean joinMember(Member_dto member) {
		boolean result = false;
		String sql = "INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MBIRTH,MEMAIL,MGENDER,GNO) VALUES "
				+ "(?,?,?,?,?,?,?,1)";
		// mid, mpw, mname, mphone, maddress, mbirth, memail mgender
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMphone());
			pstmt.setString(5, member.getMaddress());
			pstmt.setDate(6, member.getMbirth());
			pstmt.setString(7, member.getMemail());
			pstmt.setString(8, member.getMgender());
			result = pstmt.executeUpdate()==1;
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
	
	public Member_dto loginMember(String mid,String mpw) {
		Member_dto member = null;
		String sql = "SELECT M.*,a.ad_email,a.ad_phone,a.ad_call "
				+ "FROM MEMBER M,AD A WHERE M.MID=A.MID AND M.MID=? AND M.MPW=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mname = rs.getString("mname");
				String mphone = rs.getString("mphone");
				String maddress = rs.getString("maddress");
				Date mbirth = rs.getDate("mbirth");
				String memail = rs.getString("memail");
				String mgender = rs.getString("mgender");
				int mpoint = rs.getInt("mpoint");
				int mcumulative_buy = rs.getInt("mcumulative_buy");
				Date mjoindate = rs.getDate("mjoindate");;
				int gno = rs.getInt("gno");;
				int ad_email = rs.getInt("ad_email");;
				int ad_phone = rs.getInt("ad_phone");;
				int ad_call = rs.getInt("ad_call");;
				
				member = new Member_dto(mid, mpw, mname, mphone, maddress, mbirth, memail, mgender, mpoint, mcumulative_buy, mjoindate, gno, ad_email, ad_phone, ad_call);
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
		return member;
	}
	
}

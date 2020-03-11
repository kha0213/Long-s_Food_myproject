package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.yl.dto.Member_dto;
import com.yl.dto.Orders_dto;

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
	
	
	public boolean joinMember(String mid,String mpw,String mname,String mphone,String maddress_basic, 
			String maddress_detail,Date mbirth,String memail,String mgender) {
		boolean result = false;
		String sql = "INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS_BASIC,MADDRESS_DETAIL,MBIRTH" + 
				",MEMAIL,MGENDER,GNO) VALUES (?,?,?,?,?,?,?,?,?,1)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			pstmt.setString(3, mname);
			pstmt.setString(4, mphone);
			pstmt.setString(5, maddress_basic);
			pstmt.setString(6, maddress_detail);
			pstmt.setDate(7, mbirth);
			pstmt.setString(8, memail);
			pstmt.setString(9, mgender);
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
	
	public Member_dto loginMember(String mid,String mpw) {
		Member_dto member = null;
		String sql = "SELECT M.*,A.AD_EMAIL,A.AD_PHONE,A.AD_CALL,G.GNAME FROM "
				+ "MEMBER M,AD A,GRADES G WHERE M.MID=A.MID AND M.GNO = G.GNO "
				+ "AND M.MID=? AND MPW=?";
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
				String maddress_basic = rs.getString("maddress_basic");
				String maddress_detail = rs.getString("maddress_detail");
				Date mbirth = rs.getDate("mbirth");
				String memail = rs.getString("memail");
				String mgender = rs.getString("mgender");
				int mpoint = rs.getInt("mpoint");
				int mcumulative_buy = rs.getInt("mcumulative_buy");
				Date mjoindate = rs.getDate("mjoindate");;
				String gname = rs.getString("gname");;
				int ad_email = rs.getInt("ad_email");;
				int ad_phone = rs.getInt("ad_phone");;
				int ad_call = rs.getInt("ad_call");;
				member = new Member_dto(mid, mpw, mname, mphone, maddress_basic, maddress_detail, mbirth, memail, mgender, mpoint, mcumulative_buy, mjoindate, gname, ad_email, ad_phone, ad_call);
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
	
	
	
	
	public ArrayList<Orders_dto> getOrders(String mid) {
		ArrayList<Orders_dto> result = new ArrayList<Orders_dto>();
		String sql = "SELECT M.*,ONO,ODATE,PARRIVE_DATE,DNO FROM MEMBER M, ORDERS O WHERE M.MID=O.MID AND M.MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String ono = rs.getString("ono");
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				String dno = rs.getString("dno");
				result.add(new Orders_dto(ono, odate, parrive_date, dno, mid));
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
		return result;
	}
	
	public void adModify(String mid,int ad_email,int ad_phone,int ad_call) {
		String sql="UPDATE AD SET AD_EMAIL=?,AD_PHONE=?,AD_CALL=? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ad_email);
			pstmt.setInt(2, ad_phone);
			pstmt.setInt(3, ad_call);
			pstmt.setString(4, mid);
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
	
	
	public boolean memberModify(String mid,String mpw,String mname,String mphone,String maddress_basic,String maddress_detail,Date mbirth,String memail,String mgender) {
		boolean result = false;
		String sql="UPDATE MEMBER SET MPW=?,MNAME=?,MPHONE=?,MADDRESS_BASIC=?,MADDRESS_DETAIL=?,MBIRTH=?,MEMAIL=?,MGENDER=? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mpw);
			pstmt.setString(2, mname);
			pstmt.setString(3, mphone);
			pstmt.setString(4, maddress_basic);
			pstmt.setString(5, maddress_detail);
			pstmt.setDate(6, mbirth);
			pstmt.setString(7, memail);
			pstmt.setString(8, mgender);
			pstmt.setString(9, mid);
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
	private void deleteAd(String mid) {
		String sql="DELETE FROM AD WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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
	
	public boolean deleteMember(String mid) {
		deleteAd(mid);
		boolean result = false;
		String sql="DELETE FROM MEMBER WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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
}

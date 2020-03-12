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

import com.yl.dto.Review_dto;

public class Review_dao {
private Review_dao() {
		
	}
	
	private static Review_dao instance = new Review_dao();
	public static Review_dao getInstance() {
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
	
	public boolean reviewWriteCheck(String pcode) {
		boolean result = false;
		String sql = "SELECT * FROM MEMBER M,ORDERS O,ORDER_DETAIL OD WHERE M.MID=O.MID AND "
				+ "O.ONO=OD.ONO AND O.RDATE BETWEEN SYSDATE-14 AND SYSDATE AND PCODE=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
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
	
	public boolean reviewWrite(String pcode,String mid,String rimage1,String rimage2,String rimage3,int rstar,String rcontent,Date rdate) {
		boolean result = false;
		String sql = "INSERT INTO REVIEW (RNO,PCODE,MID,RIMAGE1,RIMAGE2,RIMAGE3,RSTAR,"
				+ "RCONTENT) VALUES (RNO_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setString(2, mid);
			pstmt.setString(3, rimage1);
			pstmt.setString(4, rimage2);
			pstmt.setString(5, rimage3);
			pstmt.setInt(6, rstar);
			pstmt.setString(7, rcontent);
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
	
	public boolean reviewModify(String pcode,String rimage1,String rimage2,String rimage3,int rstar,String rcontent,int rno) {
		boolean result = false;
		String sql = "UPDATE REVIEW SET PCODE=?,RIMAGE1=?,RIMAGE2=?,RIMAGE3=?,RSTAR=?,RCONTENT=?,RDATE=SYSDATE WHERE RNO=?";
		//수정시 날짜도 현재날짜
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setString(2, rimage1);
			pstmt.setString(3, rimage2);
			pstmt.setString(4, rimage3);
			pstmt.setInt(5, rstar);
			pstmt.setString(6, rcontent);
			pstmt.setInt(7, rno);
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
	public boolean rGoodUp(int rno,String mid) {
		rGoodAddMember(mid, rno);
		boolean result = false;
		String sql = "UPDATE REVIEW SET RGOOD=RGOOD+1 WHERE RNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
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
	
	public ArrayList<Review_dto> getReviewList(int startRow,int endRow) {
		ArrayList<Review_dto> rList = new ArrayList<Review_dto>();
		String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT R.*,P.PNAME FROM REVIEW R,"
				+ "PRODUCT P WHERE R.PCODE=P.PCODE ORDER BY RGOOD DESC, RDATE DESC) A) WHERE RN BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				String mid = rs.getString("mid");
				String rimage1 = rs.getString("rimage1");
				String rimage2 = rs.getString("rimage2");
				String rimage3 = rs.getString("rimage3");
				int rgood = rs.getInt("rgood");
				int rstar = rs.getInt("rstar");
				String rcontent = rs.getString("rcontent");
				Date rdate = rs.getDate("rdate");
				rList.add(new Review_dto(rno, pcode, pname, mid, rimage1, rimage2, rimage3, rgood, rstar, rcontent, rdate));
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
		return rList;
	}
	
	public int getTotalReviewsCnt() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM REVIEW";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
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
	
	//좋아요 한 아이디인지 확인
	public boolean rGoodMemberChk(String mid) {
		boolean result = false;
		String sql = "SELECT * FROM REVIEW_RGOOD WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			result = !rs.next();
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
	
	private void rGoodAddMember(String mid,int rno) {
		String sql = "INSERT INTO review_rgood VALUES (RGNO_SEQ.nextval,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, rno);
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
	
	
	
}

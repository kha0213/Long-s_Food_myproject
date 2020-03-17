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

import com.yl.dto.Cmmg_comment_dto;
import com.yl.dto.Customer_service_dto;

public class CMMg_comment_dao {
	
	private CMMg_comment_dao() {
	}
	
	private static CMMg_comment_dao instance = new CMMg_comment_dao();
	public static CMMg_comment_dao getInstance() {
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
	
	public boolean writeCsComment(String cmsubject, String cmcontent,int cno,String mgid) {
		boolean result = false;
		String sql = "INSERT INTO CSMG_COMMENT (CSNO,MGID,CNO,CMSUBJECT,CMCONTENT) VALUES (CSNO_SEQ.NEXTVAL,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			pstmt.setInt(2, cno);
			pstmt.setString(3, cmsubject);
			pstmt.setString(4, cmcontent);
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
	
	
	public boolean deleteCsComment(int cno) {
		boolean result = false;
		String sql = "DELETE FROM CSMG_COMMENT WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
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
	public boolean modifyCsComment(String cmsubject, String cmcontent, int cno) {
		boolean result = false;
		String sql = "UPDATE CSMG_COMMENT SET CMSUBJECT=?,CMCONTENT=? CMRDATE=SYSDATE WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmsubject);
			pstmt.setString(2, cmcontent);
			pstmt.setInt(3, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
			System.out.println("modifyCsComment오류:"+e.getMessage());
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
	
	public Cmmg_comment_dto getCsComment(int cno) {
		Cmmg_comment_dto cmmg = null;
		String sql = "SELECT * FROM CSMG_COMMENT";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int csno = rs.getInt("csno");
				String cmsubject = rs.getString("cmsubject");
				String cmcontent = rs.getString("cmcontent");
				Date cmrdate = rs.getDate("cmrdate");
				String mgid = rs.getString("mgid");
				cmmg = new Cmmg_comment_dto(csno, cmsubject, cmcontent, cmrdate, cno, mgid);
			}
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
		return cmmg;
	}
	
	
	
	
}

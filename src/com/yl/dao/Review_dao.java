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

import com.yl.dto.Review_comment_dto;
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
	
	public boolean reviewWriteCheck(String mid,String pcode) {
		boolean result = false;
		String sql = "SELECT * FROM MEMBER M, ORDERS O, ORDER_DETAIL OD WHERE "
				+ "O.ONO=OD.ONO AND O.MID=M.MID AND M.MID=? AND PCODE=? AND O.ODATE BETWEEN "
				+ "SYSDATE-14 AND SYSDATE";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pcode);
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
	
	public boolean reviewWrite(String pcode,String mid,String rimage1,String rimage2,String rimage3,int rstar,String rcontent) {
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
	
	public ArrayList<Review_dto> getReviewListAll(int startRow,int endRow) {
		ArrayList<Review_dto> rListAll = new ArrayList<Review_dto>();
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
				boolean rcexist = rs.getInt("rcexist")==1; //1이 true
				rListAll.add(new Review_dto(rno, pcode, pname, mid, rimage1, rimage2, rimage3, rgood, rstar, rcontent, rdate,rcexist));
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
		return rListAll;
	}
	
	public ArrayList<Review_dto> getReviewListProduct(String pcode, int startRow,int endRow) {
		ArrayList<Review_dto> rListProduct = new ArrayList<Review_dto>();
		String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT R.*,P.PNAME FROM REVIEW R,"
				+ "PRODUCT P WHERE R.PCODE=P.PCODE AND P.PCODE=? ORDER BY RGOOD DESC, RDATE DESC) A) WHERE RN BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String pname = rs.getString("pname");
				String mid = rs.getString("mid");
				String rimage1 = rs.getString("rimage1");
				String rimage2 = rs.getString("rimage2");
				String rimage3 = rs.getString("rimage3");
				int rgood = rs.getInt("rgood");
				int rstar = rs.getInt("rstar");
				String rcontent = rs.getString("rcontent");
				Date rdate = rs.getDate("rdate");
				boolean rcexist = rs.getInt("rcexist")==1; //1이 true
				rListProduct.add(new Review_dto(rno, pcode, pname, mid, rimage1, rimage2, rimage3, rgood, rstar, rcontent, rdate,rcexist));
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
		return rListProduct;
	}
	
	public int getTotalProductReviewsCnt(String pcode) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM REVIEW WHERE PCODE=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
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
	public boolean rGoodMemberChk(String mid,int rno) {
		boolean result = false;
		String sql = "SELECT * FROM REVIEW_RGOOD WHERE MID=? AND RNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, rno);
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
	//리뷰댓글 있니?
	public boolean rcExist(int rno) {
		boolean result = false;
		String sql = "SELECT * FROM REVIEW R,REVIEW_COMMENT RC WHERE R.RNO=RC.RNO AND R.RNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate()==1;
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
	
	public Review_comment_dto getRc(int rno) {
		Review_comment_dto rc = null;
		String sql = "SELECT * FROM REVIEW_COMMENT WHERE RNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int rcno = rs.getInt("rcno");
				String mgid = rs.getString("mgid");
				String rccontent = rs.getString("rccontent");
				Date rcdate = rs.getDate("rcdate");
				rc = new Review_comment_dto(rcno, rno, mgid, rccontent, rcdate);
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
		return rc;
	}
	
	private void rcExistTrue(int rno) {
		String sql = "UPDATE REVIEW SET RCEXIST=1 WHERE RNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
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
	//리뷰 댓글 쓰기 (댓글 여부 업데이트)
	public boolean rcWrite(int rno,String mgid,String rccontent) {
		rcExistTrue(rno);
		boolean result = false;
		String sql = "INSERT INTO REVIEW_COMMENT (RCNO,RNO,MGID,RCCONTENT) VALUES (RCNO_SEQ.nextval,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.setString(2, mgid);
			pstmt.setString(3, rccontent);
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

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

import com.yl.dto.Member_dto;
import com.yl.dto.NextGrade_dto;
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
				",MEMAIL,MGENDER) VALUES (?,?,?,?,?,?,?,?,?)";
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
	
	public Member_dto getMember(String mid) {
		Member_dto member = null;
		String sql = "SELECT M.*,a.ad_email,a.ad_phone,A.AD_CALL,G.*,(SELECT COUNT(*) FROM CART C, MEMBER M WHERE C.MID=M.MID) CART_CNT FROM MEMBER M,AD A,GRADES G WHERE M.MID=A.MID AND M.MCUMULATIVE_BUY BETWEEN G.LOWGRADE AND G.HIGHGRADE AND M.MID=? AND MSTATUS=0";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mpw = rs.getString("mpw");
				String mname = rs.getString("mname");
				String mphone = rs.getString("mphone");
				String maddress_basic = rs.getString("maddress_basic");
				String maddress_detail = rs.getString("maddress_detail");
				Date mbirth = rs.getDate("mbirth");
				String memail = rs.getString("memail");
				String mgender = rs.getString("mgender");
				int mpoint = rs.getInt("mpoint");
				int mcumulative_buy = rs.getInt("mcumulative_buy");
				Date mjoindate = rs.getDate("mjoindate");
				boolean mstatus = rs.getInt("mstatus")==0;
				String gname = rs.getString("gname");
				int cart_cnt = rs.getInt("cart_cnt");
				int ad_email = rs.getInt("ad_email");
				int ad_phone = rs.getInt("ad_phone");
				int ad_call = rs.getInt("ad_call");
				member = new Member_dto(mid, mpw, mname, mphone, maddress_basic, maddress_detail, mbirth, memail, mgender, mpoint, mcumulative_buy, mjoindate, mstatus, gname, cart_cnt, ad_email, ad_phone, ad_call);
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
	
	
	
	public Member_dto loginMember(String mid,String mpw) {
		Member_dto member = null;
		String sql = "SELECT M.*,a.ad_email,a.ad_phone,A.AD_CALL,G.*,(SELECT COUNT(*) FROM CART C, MEMBER M WHERE C.MID=M.MID) CART_CNT FROM MEMBER M,AD A,GRADES G WHERE M.MID=A.MID AND M.MCUMULATIVE_BUY BETWEEN G.LOWGRADE AND G.HIGHGRADE AND M.MID=? AND MPW=? AND MSTATUS=0";
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
				Date mjoindate = rs.getDate("mjoindate");
				boolean mstatus = rs.getInt("mstatus")==0;
				String gname = rs.getString("gname");
				int cart_cnt = rs.getInt("cart_cnt");
				int ad_email = rs.getInt("ad_email");
				int ad_phone = rs.getInt("ad_phone");
				int ad_call = rs.getInt("ad_call");
				member = new Member_dto(mid, mpw, mname, mphone, maddress_basic, maddress_detail, mbirth, memail, mgender, mpoint, mcumulative_buy, mjoindate, mstatus, gname, cart_cnt, ad_email, ad_phone, ad_call);
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
	
	
	public ArrayList<Orders_dto> getOrdersAll(String mid) {
		ArrayList<Orders_dto> result = new ArrayList<Orders_dto>();
		String sql = "SELECT O.*,(SELECT P.PNAME FROM ORDER_DETAIL ODF,PRODUCT P WHERE ODF.ONO=O.ONO AND P.PCODE=ODF.PCODE AND ROWNUM=1) PNAME,"
				+ "(SELECT P.PIMAGE FROM ORDER_DETAIL ODF,PRODUCT P WHERE ODF.ONO=O.ONO AND P.PCODE=ODF.PCODE AND ROWNUM=1) PIMAGE FROM ORDERS O WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt("ono");
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				int purchase_amount = rs.getInt("purchase_amount");
				int dno = rs.getInt("dno");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				result.add(new Orders_dto(ono, odate, parrive_date, pname, pimage, purchase_amount, dno, mid));
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
	
	public ArrayList<Orders_dto> getOrdersPaging(String mid,int startRow,int endRow) {
		ArrayList<Orders_dto> result = new ArrayList<Orders_dto>();
		String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT O.*,(SELECT P.PNAME FROM ORDER_DETAIL ODF,"
				+ "PRODUCT P WHERE ODF.ONO=O.ONO AND P.PCODE=ODF.PCODE AND ROWNUM=1) PNAME,"
				+ "(SELECT P.PIMAGE FROM ORDER_DETAIL ODF,PRODUCT P WHERE ODF.ONO=O.ONO AND P.PCODE=ODF.PCODE AND ROWNUM=1) "
				+ "PIMAGE FROM MEMBER M, ORDERS O WHERE M.MID=O.MID AND M.MID=? ORDER BY ODATE DESC) A) WHERE RN BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt("ono");
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				int purchase_amount = rs.getInt("purchase_amount");
				int dno = rs.getInt("dno");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				result.add(new Orders_dto(ono, odate, parrive_date, pname, pimage, purchase_amount, dno, mid));
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
	
	public boolean deleteMember(String mid,boolean status) {
		boolean result = false;
		int statusInt = status?0:1;
		String sql="UPDATE MEMBER SET MSTATUS = ? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statusInt);
			pstmt.setString(2, mid);
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
	public NextGrade_dto getNextGrade(String mid, int mcumulative_buy) {
		NextGrade_dto nextGrade = new NextGrade_dto();
		String sql="SELECT GF.LOWGRADE,GF.GNAME FROM GRADES GF WHERE GNO = (SELECT G.GNO+1 FROM MEMBER M, GRADES G WHERE M.MCUMULATIVE_BUY BETWEEN G.LOWGRADE AND G.HIGHGRADE AND M.MID=?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nextGrade.setNextGname(rs.getString("GNAME"));
				nextGrade.setNextMoney(rs.getInt(1)-mcumulative_buy-1);
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
		return nextGrade;
	}
	
	
	
	public boolean mPointPlus(int mpoint,String mid) {
		boolean result = false;
		String sql="UPDATE MEMBER SET MPOINT=MPOINT+? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mpoint);
			pstmt.setString(2, mid);
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
	public boolean mPointMinus(int mpoint,String mid) {
		boolean result = false;
		String sql="UPDATE MEMBER SET MPOINT=MPOINT-? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mpoint);
			pstmt.setString(2, mid);
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
	public boolean mcumulative_buy_plus(int mcumulative_buy,String mid) {
		boolean result = false;
		String sql="UPDATE MEMBER SET MCUMULATIVE_BUY=MCUMULATIVE_BUY+? WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcumulative_buy);
			pstmt.setString(2, mid);
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
	public int getTotalOrders(String mid) {
		int result = 0;
		String sql="SELECT COUNT(*) FROM ORDERS WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
}

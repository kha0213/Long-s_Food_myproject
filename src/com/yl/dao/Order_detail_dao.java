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

import com.yl.dto.Order_detail_dto;
import com.yl.dto.Orders_dto;

public class Order_detail_dao {
private Order_detail_dao() {
		
	}
	
	private static Order_detail_dao instance = new Order_detail_dao();
	public static Order_detail_dao getInstance() {
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
	
	public boolean addOrderDetail(int ono,String pcode,int pcnt) {
		boolean result = false;
		String sql = "INSERT INTO ORDER_DETAIL (ODNO,ONO,PCODE,PCNT) VALUES (ODNO_SEQ.NEXTVAL,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
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
	
	public ArrayList<Order_detail_dto> getOrderDetail(int ono) {
		ArrayList<Order_detail_dto> ods = new ArrayList<Order_detail_dto>();
		String sql = "SELECT O.*,P.PNAME,P.PIMAGE,OD.ODNO,P.PCODE,od.pcnt,p.pprice FROM ORDERS O,PRODUCT P,ORDER_DETAIL OD WHERE O.ONO=OD.ONO AND od.pcode=p.pcode and O.ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int odno = rs.getInt("odno");
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				String pimage = rs.getString("pimage");
				int pcnt = rs.getInt("pcnt");
				int pprice = rs.getInt("pprice");
				ods.add(new Order_detail_dto(odno, ono, pcode, pname, pimage, pcnt, pprice));
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
		return ods;
	} 
	public ArrayList<Orders_dto> getDeliveryNotArrive(String mid) {
		ArrayList<Orders_dto> orders = new ArrayList<Orders_dto>();
		String sql = "SELECT O.*,P.PNAME,P.PIMAGE,OD.ODNO,P.PCODE,OD.PCNT,P.PPRICE FROM ORDERS O,PRODUCT P,ORDER_DETAIL OD WHERE O.ONO=OD.ONO AND OD.PCODE=P.PCODE AND O.PARRIVE_DATE IS NULL AND MID=?";
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
				Date parrive_date = null;
				String pname = rs.getString("pname");
				String pimage =rs.getString("pimage");
				int purchase_amount = rs.getInt("purchase_amount");
				int dno = rs.getInt("dno");
				orders.add(new Orders_dto(ono, odate, parrive_date, pname, pimage, purchase_amount, dno, mid));
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
		return orders;
	} 
	
}

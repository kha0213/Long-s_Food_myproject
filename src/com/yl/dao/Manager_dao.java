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

import com.yl.dto.Manager_dto;
import com.yl.dto.Member_dto;
import com.yl.dto.Product_dto;

public class Manager_dao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int MANAGER_EXIST = 1;
	public static final int MANAGER_NONEXIST = 0;
	
	private Manager_dao() {
	}
	
	private static Manager_dao instance = new Manager_dao();
	public static Manager_dao getInstance() {
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
	public int joinManager(String mgid,String mgpw,String mgname,String mgpartname) {
		int result = FAIL;
		String sql = "INSERT INTO MANAGER (MGID,MGPW,MGNAME,MGPARTNAME) VALUES "
				+ "(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			pstmt.setString(2, mgpw);
			pstmt.setString(3, mgname);
			pstmt.setString(4, mgpartname);
			result = pstmt.executeUpdate();
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
	public boolean mgidConfirm(String mgid) {
		boolean result = false;
		String sql = "SELECT * FROM MANAGER WHERE MGID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
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
	
	public Manager_dto loginManager(String mgid,String mgpw) {
		Manager_dto manager = null;
		String sql = "SELECT * FROM MANAGER WHERE MGID=? AND MGPW=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			pstmt.setString(2, mgpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mgname = rs.getString("mgname");
				String mgpartname = rs.getString("mgpartname");
				manager = new Manager_dto(mgid, mgpw, mgname, mgpartname);
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
		return manager;
	}
	
	public int registProduct(String pcode,String mgid, String pname, int pprice, String pimage,int pstock,String pdescription) {
		int result = FAIL;
		String sql = "INSERT INTO PRODUCT (PCODE,MGID,PNAME,PPRICE,PIMAGE,PSTOCK,PDESCRIPTION) VALUES (?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setString(2, mgid);
			pstmt.setString(3, pname);
			pstmt.setInt(4, pprice);
			pstmt.setString(5, pimage);
			pstmt.setInt(6, pstock);
			pstmt.setString(7, pdescription);
			result = pstmt.executeUpdate();
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
	
	
	private ArrayList<Product_dto> getProductListSQL(int startRow,int endRow,String sql){
		ArrayList<Product_dto> products = new ArrayList<Product_dto>();
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
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				String pimage = rs.getString("pimage");
				int pstock= rs.getInt("pstock");
				String pdescription = rs.getString("pdescription");
				int pdiscount= rs.getInt("pdiscount");
				Date pregist = rs.getDate("pregist");
				int pcumulative_sales= rs.getInt("pcumulative_sales");
				int preview_count= rs.getInt("preview_count");
				String mgname= rs.getString("mgname");
				products.add(new Product_dto(pcode, pname, pprice, pimage, pstock, pdescription, pdiscount, pregist, pcumulative_sales, preview_count,mgname));
			}
		} catch (SQLException e) {
			System.out.println("getProductListDesc오류 :"+e.getMessage());
		} finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			
		}
		
		return products;
	}
	
	public ArrayList<Product_dto> getProductListSort(int startRow,int endRow,String sortingCriteria){
		String sql = "";
		if(sortingCriteria.equals("lowprice")) {
			sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT P.*,M.MGNAME FROM PRODUCT P,MANAGER M WHERE P.MGID = M.MGID ORDER BY pprice, preview_count DESC) A)"  +
					" WHERE RN BETWEEN ? AND ?";
		}else if(sortingCriteria.equals("pregist")) {
			sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT P.*,M.MGNAME FROM PRODUCT P,MANAGER M WHERE P.MGID = M.MGID ORDER BY pregist DESC, preview_count DESC) A)"  +
					" WHERE RN BETWEEN ? AND ?";
		}else if(sortingCriteria.equals("preview_count")) {
			sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT P.*,M.MGNAME FROM PRODUCT P,MANAGER M WHERE P.MGID = M.MGID ORDER BY preview_count DESC) A)"  +
					" WHERE RN BETWEEN ? AND ?";
		}else if(sortingCriteria.equals("highprice")) {
			sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT P.*,M.MGNAME FROM PRODUCT P,MANAGER M WHERE P.MGID = M.MGID ORDER BY pprice DESC, preview_count DESC) A)"  +
					" WHERE RN BETWEEN ? AND ?";
		}
		return getProductListSQL(startRow, endRow, sql);
	}
	
	
	
	
	public int getTotalNumber(String obj) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM "+obj;
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
			System.out.println("getTotalNumer오류 : "+e.getMessage());
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

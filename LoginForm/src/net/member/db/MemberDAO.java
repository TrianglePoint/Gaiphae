package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("DB 연결 실패: " + e);
			return;
		}
	}
	
	public boolean checkLogin(MemberBean bean) {
		try {
			pstmt = con.prepareStatement("select id, pw from member where id=?");
			pstmt.setString(1, bean.getId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw").equals(bean.getPw())) {
					return true;
				}
			}
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		}
		return false;
	}
	public boolean insertMember(MemberBean bean) {
		int result = 0;
		try {
			pstmt = con.prepareStatement(
					"insert into member values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getName());
			pstmt.setString(5, bean.getNum1());
			pstmt.setInt(6, bean.getYears());
			pstmt.setInt(7, bean.getMonth());
			pstmt.setInt(8, bean.getDay());
			pstmt.setString(9, bean.getInter());
			pstmt.setString(10, bean.getSelf());
			
			result = pstmt.executeUpdate();
			if(result != 0) {
				return true;
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return false;
	}
	public List<MemberBean> getMemberList() {
		List<MemberBean> beans = new ArrayList<MemberBean>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select id, name from member");
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				beans.add(bean);
			}
			return beans;
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return null;	
	}
	public MemberBean getMember(MemberBean bean) {
		try {
			pstmt = con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, bean.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setEmail(rs.getString("email"));
				bean.setName(rs.getString("name"));
				bean.setNum1(rs.getString("num1"));
				bean.setYears(rs.getInt("years"));
				bean.setMonth(rs.getInt("month"));
				bean.setDay(rs.getInt("day"));
				bean.setInter(rs.getString("inter"));
				bean.setSelf(rs.getString("self"));
			}
			return bean;
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return null;	
	}
	public boolean deleteMember(MemberBean bean) {
		try {
			pstmt = con.prepareStatement("delete from member where id=?");
			pstmt.setString(1, bean.getId());
			int result = pstmt.executeUpdate();
			if(result == 0) {
				return false;
			}
			return true;
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return false;
	}
	
	public void close() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

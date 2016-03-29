package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import model.bean.Member;

public class MemberDAO {

	private ConnectionDAO connection;
	private Connection conn;
	private Statement st;
	public MemberDAO(){
		connection= new ConnectionDAO();
	}
	public Member checkLogin(String email, String password){
		try {
			conn=connection.openConnection();
			st= conn.createStatement();
			Member member=null;
			String sql="select * from member where (email='"+email+"') and (password='"+password+"')";
			System.out.println(""+sql);
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()==true){
				member= new Member();
				member.setMemberID(rs.getString(1));
				member.setTeacherID(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPhoneNumber(rs.getString(4));
				member.setPassword(rs.getString(5));
				member.setImage(rs.getString(6));
				member.setPriority(rs.getInt(7));
				return member;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();			
			return null;
		}finally {
			connection.closeConnection();		
		}
	}
	public boolean isEmailExist(String email) {
		try {
			conn=connection.openConnection();
			st= conn.createStatement();
			String sql="select * from member where email='"+email+"'";
			ResultSet rs=st.executeQuery(sql);
			return (rs.next() == true) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			connection.closeConnection();
		}
	}
	public void registerMember(Member memberInfor) {
		try {
			conn=connection.openConnection();
			String sql="insert into Member values(?,?,?,?,?,?,?)";
			
			String id=ConnectionDAO.increateID("member", "member_id", conn);
			System.out.println(""+id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
		MemberDAO test= new MemberDAO();
		test.registerMember(null);
	}
}

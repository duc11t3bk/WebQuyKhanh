package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.Member;

public class LoginDAO {

	private ConnectionDAO connection;
	private Connection conn;
	private Statement st;
	public LoginDAO(){
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
		}
	}
}

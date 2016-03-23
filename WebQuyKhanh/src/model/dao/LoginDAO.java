package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDAO {

	private ConnectionDAO connection;
	private Connection conn;
	private Statement st;
	public LoginDAO(){
		connection= new ConnectionDAO();
	}
	public boolean checkLogin(String email, String password){
		try {
			conn=connection.openConnection();
			st= conn.createStatement();
			
			String sql="select * from member where (email='"+email+"') and (password='"+password+"')";
			ResultSet rs=st.executeQuery(sql);
			return (rs.next() ==true) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		}
	}
}

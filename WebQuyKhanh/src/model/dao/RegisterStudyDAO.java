package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.RegisterStudy;

public class RegisterStudyDAO {

	private ConnectionDAO connection;
	private Connection conn;
	public RegisterStudyDAO(){
		connection= new ConnectionDAO();
	}
	public boolean emailExist(String email) {
		try {
			conn=connection.openConnection();
			String sql="select email from registerstudy where email= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs= pstmt.executeQuery();
			return rs.next() ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			connection.closeConnection();
		}
	}
	public void addNewRegister(RegisterStudy registerStudy) {
		try {
			conn=connection.openConnection();
			String registerID=ConnectionDAO.increateID("registerstudy", "regiter_id", conn);
			registerStudy.setRegisterID(registerID);
			String sql="insert into registerstudy values (?,?,?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, registerStudy.getRegisterID());
			pstmt.setString(2, registerStudy.getEmail());
			pstmt.setString(3, registerStudy.getPhoneNumber());
			pstmt.setString(4, registerStudy.getClassID());
			pstmt.setString(5, registerStudy.getCategory());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			connection.closeConnection();
		}
	}
}

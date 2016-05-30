package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			pstmt.setString(1, email);
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
			String registerID=ConnectionDAO.increateID("registerstudy", "register_id", conn);
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
	public ArrayList<RegisterStudy> getListRegisterStudy() {
		try {
			conn= connection.openConnection();
			String sql="select rs.register_id, rs.email, rs.phonenumber, cl.name, rs.category "
					+ " from registerstudy rs left join class cl on (rs.class_id= cl.class_id) ";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<RegisterStudy> listRegisterStudy= new ArrayList<RegisterStudy>();
			while(rs.next()){
				RegisterStudy registerStudy = new RegisterStudy();
				registerStudy.setRegisterID(rs.getString(1));
				registerStudy.setEmail(rs.getString(2));
				registerStudy.setPhoneNumber(rs.getString(3));
				registerStudy.setClassName(rs.getString(4));
				registerStudy.setCategory(rs.getString(5));
				if(RegisterStudy.DANGKYHOC.equals(rs.getString(5))){
					registerStudy.setCategoryName("Đăng ký học");
				} else if(RegisterStudy.TUVANDUHOC.equals(rs.getString(5))){
					registerStudy.setCategoryName("Tư vấn du học");
				}
				listRegisterStudy.add(registerStudy);
			}
			return listRegisterStudy;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}
	public boolean deleteRegister(String registerID) {
		try {
			conn= connection.openConnection();
			String sql="delete from registerstudy where register_id = ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, registerID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}

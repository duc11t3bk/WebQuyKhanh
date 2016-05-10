package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Class;

public class ClassDAO {

	private ConnectionDAO connection;
	private Connection conn;
	
	public ClassDAO(){
		connection= new ConnectionDAO();
	}

	public ArrayList<Class> getListClass() {
		try {
			conn= connection.openConnection();
			String sql="select * from class";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Class> listClass= new ArrayList<Class>();
			while(rs.next()){
				Class myClass= new Class();
				myClass.setClassID(rs.getString(1));
				myClass.setClassName(rs.getString(2));
				myClass.setClassFee(rs.getInt(3));
				myClass.setClassTime(rs.getString(4));
				myClass.setClassRoom(rs.getString(5));
				listClass.add(myClass);
			}
			return listClass;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public void addNewClass(Class myClass) {
		try {
			conn=connection.openConnection();
			String classID=ConnectionDAO.increateID("class", "class_id", conn);
			myClass.setClassID(classID);
			String sql="insert into class values(?,?,?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, myClass.getClassID());
			pstmt.setString(2, myClass.getClassName());
			pstmt.setInt(3, myClass.getClassFee());
			pstmt.setString(4, myClass.getClassTime());
			pstmt.setString(5, myClass.getClassRoom());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			connection.closeConnection();
		}
	}
}

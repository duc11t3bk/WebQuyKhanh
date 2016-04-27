package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringProcess;
import model.bean.Teacher;

public class TeacherDAO {

	private ConnectionDAO connection;
	private Connection conn;
	public TeacherDAO(){
		connection= new ConnectionDAO();
	}
	public ArrayList<Teacher> getListTeacher() {
		try {
			conn= connection.openConnection();
			String sql="select mb.member_id, tc.teacher_id, tc.fullname, tc.dayofbirth, tc.sex, mb.phonenumber, mb.email "
					+ " from teacher tc join member mb on (tc.teacher_id=mb.teacher_id) "
					+ " where mb.priority= ?";
			System.out.println("sql"+sql);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			ArrayList<Teacher> teachers= new ArrayList<Teacher>();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Teacher teacher= new Teacher();
				teacher.setMemberID(rs.getString(1));
				teacher.setTeacherID(rs.getString(2));
				teacher.setName(rs.getString(3));
				teacher.setDayOfBirth(StringProcess.formatDate(rs.getString(4), "yyyy-MM-dd", "dd-MM-yyyy"));
				teacher.setSex(rs.getInt(5));
				teacher.setPhoneNumber(rs.getString(6));
				teacher.setEmail(rs.getString(7));
				teachers.add(teacher);
			}
			System.out.println("size"+ teachers.size());
			return teachers;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}
	public boolean deleteTeacher(String teacherID) {
		try {
			conn=connection.openConnection();
			String sqlDeleteMemberInfor="delete from member where teacher_id= ?";
			PreparedStatement pstmt1=conn.prepareStatement(sqlDeleteMemberInfor);
			pstmt1.setString(1, teacherID);
			pstmt1.executeUpdate();
			String sqlDeleteTeacherInfor="delete from teacher where teacher_id= ?";
			PreparedStatement pstmt2=conn.prepareStatement(sqlDeleteTeacherInfor);
			pstmt2.setString(1, teacherID);
			
			return (pstmt2.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}

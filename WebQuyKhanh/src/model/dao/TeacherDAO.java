package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
			String sql="select mb.member_id, tc.teacher_id, tc.fullname, tc.dayofbirth, tc.sex, mb.phonenumber, mb.email, mb.image, tc.certificate "
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
				if(rs.getString(4)!=null){
					teacher.setDayOfBirth(StringProcess.formatDate(rs.getString(4), "yyyy-MM-dd", "dd-MM-yyyy"));
				}else{
					teacher.setDayOfBirth(rs.getString(4));
				}
				teacher.setSex(rs.getInt(5));
				teacher.setPhoneNumber(rs.getString(6));
				teacher.setEmail(rs.getString(7));
				teacher.setImage(rs.getString(8));
				teacher.setCertificate(rs.getString(9));
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
		finally{
			connection.closeConnection();
		}
	}
	public void addNewTeacher(Teacher teacher) {
		try {
			Date date= new Date();
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
			teacher.setDateattended(sdf.format(date));
			conn=connection.openConnection();
			String teacherID=ConnectionDAO.increateID("teacher", "teacher_id", conn);
			String memberID=ConnectionDAO.increateID("member", "member_id", conn);
			String sqlAddTeacher="insert into teacher values(?,?,?,?,?,?,?)";
			PreparedStatement pstmtTeacher=conn.prepareStatement(sqlAddTeacher);
			pstmtTeacher.setString(1, teacherID);
			pstmtTeacher.setString(2, teacher.getName());
			pstmtTeacher.setString(3, teacher.getDateattended());
			pstmtTeacher.setInt(4, 0);
			pstmtTeacher.setString(5, "");
			pstmtTeacher.setString(6, "");
			pstmtTeacher.setString(7, teacher.getDateattended());
			pstmtTeacher.executeUpdate();
			String sqlAddMember="insert into member values (?,?,?,?,?,?,?,?)";
			PreparedStatement pstmtMember=conn.prepareStatement(sqlAddMember);
			pstmtMember.setString(1, memberID);
			pstmtMember.setString(2, teacherID);
			pstmtMember.setString(3, teacher.getEmail());
			pstmtMember.setString(4, "");
			pstmtMember.setString(5, teacher.getPassword());
			pstmtMember.setString(6,"");
			pstmtMember.setInt(7, 1);
			pstmtMember.setString(8, teacher.getDateattended());
			pstmtMember.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			connection.closeConnection();
		}
	}
}

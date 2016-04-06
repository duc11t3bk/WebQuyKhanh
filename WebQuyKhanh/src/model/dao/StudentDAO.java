package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.util.Which;

import action.LoginAction;
import model.bean.Class;
import model.bean.Student;

public class StudentDAO {

	private ConnectionDAO connection;
	private Connection conn;
	
	public StudentDAO(){
		connection= new ConnectionDAO();
	}

	public ArrayList<Class> getListClass(String teacherID, int priority) {
		try {
			conn=connection.openConnection();
			String sql="";
			PreparedStatement pstmt=null;
;			if(priority==LoginAction.TEACHER){
				//teacher
				sql = "select c.class_id, c.name, c.fee, c.time "
						+ " from schedule sch join class c on (sch.class_id=c.class_id)" 
						  + " where sch.teacher_id = ?";
				pstmt =conn.prepareStatement(sql);
				pstmt.setString(1,teacherID);
			}
			if(priority==LoginAction.ADMIN){
				sql= "select c.class_id, c.name, c.fee, c.time "
						+ "from schedule sch join class c on (sch.class_id=c.class_id)";
				pstmt=conn.prepareStatement(sql);
			}
			
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Class> listClass= new ArrayList<Class>();
			while(rs.next()){
				Class myClass= new Class();
				myClass.setClassID(rs.getString(1));
				myClass.setClassName(rs.getString(2));
				myClass.setClassFee(rs.getInt(3));
				myClass.setClassTime(rs.getString(4));
				listClass.add(myClass);
			}
			return listClass;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}

	public ArrayList<Student> getListStudent(String classID) {
		try {
			conn=connection.openConnection();
			String sql="select st.student_id, st.name, st.email, st.phonenumber, "
					+ " st.class_id, c.name, st.amountpaid "
					+ " from student st join class c on (st.class_id=c.class_id) "
					+ " where st.class_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, classID);
			
			ArrayList<Student> students= new ArrayList<Student>();
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				Student student= new Student();
				student.setStudentID(rs.getString(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				student.setPhoneNumber(rs.getString(4));
				student.setClassID(rs.getString(5));
				student.setClassName(rs.getString(6));
				student.setAmountPaid(rs.getInt(7));
				students.add(student);
			}
			return students;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}
}

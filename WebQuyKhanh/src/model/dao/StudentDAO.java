package model.dao;

import java.io.PrintWriter;
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

	public ArrayList<Student> getListStudent() {
		try {
			conn=connection.openConnection();
			String sql="select st.student_id, st.name, st.email, st.phonenumber, st.amountpaid, class.class_id, class.name, "
					+ " class.fee, class.time "
					+ " from student st join class on (st.class_id=class.class_id)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Student> students= new ArrayList<Student>();
			while(rs.next()){
				Student student= new Student();
				student.setStudentID(rs.getString(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				student.setPhoneNumber(rs.getString(4));
				student.setAmountPaid(rs.getInt(5));
				student.setClassID(rs.getString(6));
				student.setClassName(rs.getString(7));
				student.setClassTime(rs.getString(8));
				students.add(student);
			}
			return students;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public Student getStudent(String studentID) {
		try {
			conn=connection.openConnection();
			String sql="select st.student_id, st.name, st.email, st.phonenumber, st.amountpaid, class.class_id, class.name, "
					+ " class.fee, class.time "
					+ " from student st join class on (st.class_id=class.class_id)"
					+ " where st.student_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			Student student= new Student();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				student.setStudentID(rs.getString(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				student.setPhoneNumber(rs.getString(4));
				student.setAmountPaid(rs.getInt(5));
				student.setClassID(rs.getString(6));
				student.setClassName(rs.getString(7));
				student.setClassFee(rs.getInt(8));
				student.setClassTime(rs.getString(9));
			}
			return student;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public ArrayList<Class> getListClass() {
		try {
			conn=connection.openConnection();
			String sql="select * from class ";
			PreparedStatement pstmt=conn.prepareStatement(sql);
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
		finally{
			connection.closeConnection();
		}
	}

	public void updateStudentInfor(Student student) {
		try {
			conn=connection.openConnection();
			String sql="update student set name= ?, email= ?, phonenumber= ?, class_id= ?, amountpaid= ? "
					+ " where student_id= ?";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getEmail());
			pstmt.setString(3, student.getPhoneNumber());
			pstmt.setString(4, student.getClassID());
			pstmt.setInt(5, student.getAmountPaid());
			pstmt.setString(6, student.getStudentID());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			connection.closeConnection();
		}
	}

	public void addNewStudent(Student student) {
		try {
			conn= connection.openConnection();
			String studentID=ConnectionDAO.increateID("student", "student_id", conn);
			student.setStudentID(studentID);
			String sql="insert into student values(?,?,?,?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, student.getStudentID());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getEmail());
			pstmt.setString(4, student.getPhoneNumber());
			pstmt.setString(5, student.getClassID());
			pstmt.setInt(6, student.getAmountPaid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			connection.closeConnection();
		}
	}

	public boolean deleteStudent(String studentID) {
		try {
			conn=connection.openConnection();
			String sql="delete from student where student_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			return (pstmt.executeUpdate()!=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			connection.closeConnection();
		}
	}
}

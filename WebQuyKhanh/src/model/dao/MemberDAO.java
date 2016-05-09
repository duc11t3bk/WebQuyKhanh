package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.sun.corba.se.impl.orb.PrefixParserAction;

import common.StringProcess;
import model.bean.Member;
import model.bean.Teacher;

public class MemberDAO {

	private ConnectionDAO connection;
	private Connection conn;
	private Statement st;

	public MemberDAO() {
		connection = new ConnectionDAO();
	}

	public Member checkLogin(String email, String password) {
		try {
			conn = connection.openConnection();
			st = conn.createStatement();
			Member member = null;
			String sql = "select * from member where (email='" + email + "') and (password='" + password + "')";
			System.out.println("" + sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				member = new Member();
				member.setMemberID(rs.getString(1));
				member.setTeacherID(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPhoneNumber(rs.getString(4));
				member.setPassword(rs.getString(5));
				member.setImage(rs.getString(6));
				member.setPriority(Integer.valueOf(rs.getString(7)));
				member.setDateattended(StringProcess.formatDate(rs.getString(8),
						"yyyy-MM-dd", "dd-MM-yyyy"));
				return member;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			connection.closeConnection();
		}
	}

	public boolean isEmailExist(String email) {
		try {
			conn = connection.openConnection();
			st = conn.createStatement();
			String sql = "select * from member where email='" + email + "'";
			ResultSet rs = st.executeQuery(sql);
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
			conn = connection.openConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			String newID = ConnectionDAO.increateID("member", "member_id", conn);
			System.out.println("" + newID);
			memberInfor.setMemberID(newID);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfor.getMemberID());
			pstmt.setString(2, memberInfor.getTeacherID());
			pstmt.setString(3, memberInfor.getEmail());
			pstmt.setString(4, memberInfor.getPhoneNumber());
			pstmt.setString(5, memberInfor.getPassword());
			pstmt.setString(6, memberInfor.getImage());
			pstmt.setInt(7, memberInfor.getPriority());
			pstmt.setString(8, memberInfor.getDateattended());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
	}

	public void updatePassword(String memberID, String newPassword) {
		try {
			conn = connection.openConnection();
			String sql = "update member set password= ? where member_ID= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, memberID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
	}

	public void updateMemberInfor(Member member) {
		try {
			conn = connection.openConnection();
			if (!"".equals(member.getImage())) {
				String sql = "update member set image= ? , phonenumber= ? where member_id= ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getImage());
				pstmt.setString(2, member.getPhoneNumber());
				pstmt.setString(3, member.getMemberID());
				pstmt.executeUpdate();
			}
			else{
				String sql="update member set phonenumber= ? where member_ID= ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getPhoneNumber());
				pstmt.setString(2, member.getMemberID());
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
	}

	public Teacher getTeacherInfor(String teacherID) {
		try {
			conn = connection.openConnection();
			String sql = "select * from teacher where teacher_id= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacherID);
			ResultSet rs = pstmt.executeQuery();
			Teacher teacherInfor = new Teacher();
			while (rs.next()) {
				teacherInfor.setTeacherID(rs.getString(1));
				teacherInfor.setName(rs.getString(2));
				teacherInfor.setDayOfBirth(StringProcess.formatDate(rs.getString(3),
						"yyyy-MM-dd", "dd-MM-yyyy"));
				teacherInfor.setSex(rs.getInt(4));
				teacherInfor.setAddress(rs.getString(5));
				teacherInfor.setCertificate(rs.getString(6));
				teacherInfor.setDayOfContract(StringProcess.formatDate(rs.getString(7),
						"yyyy-MM-dd", "dd-MM-yyyy"));
			}
			return teacherInfor;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			connection.closeConnection();
		}
	}

	public void updateTeacherInfor(Teacher teacher) {
		try {
			conn = connection.openConnection();
			String sql = "update teacher set " + " fullname= ? ," + " dayofbirth= ? ," + " sex= ? ," + " address= ? ,"
					+ " certificate= ? ," + " dayofcontract= ? " + " where teacher_id= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher.getName());
			pstmt.setString(2,StringProcess.formatDate(teacher.getDayOfBirth(),"dd-MM-yyyy","yyyy-MM-dd"));
			pstmt.setInt(3, teacher.getSex());
			pstmt.setString(4, teacher.getAddress());
			pstmt.setString(5, teacher.getCertificate());
			pstmt.setString(6,StringProcess.formatDate(teacher.getDayOfContract(), "dd-MM-yyyy", "yyyy-MM-dd"));
			pstmt.setString(7, teacher.getTeacherID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Member getMember(String memberID) {
		try {
			conn=connection.openConnection();
			String sql="select * from member where member_id= ? ";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			ResultSet rs=pstmt.executeQuery();
			Member member= new Member();
			while(rs.next()){
				member.setMemberID(rs.getString(1));
				member.setTeacherID(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPhoneNumber(rs.getString(4));
				member.setPassword(rs.getString(5));
				member.setImage(rs.getString(6));			
				member.setPriority(rs.getInt(7));
			}
			return member;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<Member> getListMember() {
		try {
			conn=connection.openConnection();
			String sql="select * from member where teacher_id is null";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Member> members= new ArrayList<Member>();
			while(rs.next()){
				Member member= new Member();
				member.setMemberID(rs.getString(1));
				member.setEmail(rs.getString(3));
				member.setPhoneNumber(rs.getString(4));
				member.setPassword(rs.getString(5));
				member.setDateattended(StringProcess.formatDate(rs.getString(8), "yyyy-MM-dd", "dd-MM-yyyy"));
				members.add(member);
			}
			return members;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}
	public boolean deleteMember(String memberID) {
		try {
			deleteMemberOnTable(memberID,"lessonstatus");
			deleteMemberOnTable(memberID,"learnword");
			conn=connection.openConnection();
			String sql="delete from member where member_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			connection.closeConnection();
		}
	}
	public boolean deleteMemberOnTable(String memberID, String tableName){
		try {
			conn= connection.openConnection();
			String sql="delete from "+tableName+" where member_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			connection.closeConnection();
		}
	}
}

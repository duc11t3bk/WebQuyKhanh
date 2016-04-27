package model.bo;

import model.bean.Member;
import model.bean.Teacher;
import model.dao.MemberDAO;

public class MemberBO {

	private MemberDAO memberDAO;
	public MemberBO(){
		memberDAO= new MemberDAO();		
	}
	public Member checkLogin(String email, String password){
		return memberDAO.checkLogin(email,password);
	}
	public boolean isEmailExist(String email) {
		return memberDAO.isEmailExist(email);
	}
	public void registerMember(Member memberInfor) {
		memberDAO.registerMember(memberInfor);
	}
	public void updatePassword(String memberID, String newPassword) {
		memberDAO.updatePassword(memberID,newPassword);
	}
	public void updateMemberInfor(Member member) {
		memberDAO.updateMemberInfor(member);
	}
	public Teacher getTeacherInfor(String teacherID) {
		return memberDAO.getTeacherInfor(teacherID);
	}
	public void updateTeacherInfor(Teacher teacher) {
		 memberDAO.updateTeacherInfor(teacher);
	}
	public Member getMember(String memberID) {
		return memberDAO.getMember(memberID);
	}
}

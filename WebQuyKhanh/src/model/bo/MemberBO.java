package model.bo;

import model.bean.Member;
import model.dao.MemberDAO;

public class MemberBO {

	private MemberDAO loginDAO;
	public MemberBO(){
		loginDAO= new MemberDAO();		
	}
	public Member checkLogin(String email, String password){
		return loginDAO.checkLogin(email,password);
	}
	public boolean isEmailExist(String email) {
		return loginDAO.isEmailExist(email);
	}
	public void registerMember(Member memberInfor) {
		loginDAO.registerMember(memberInfor);
	}
	public void updatePassword(String memberID, String newPassword) {
		loginDAO.updatePassword(memberID,newPassword);
	}
}

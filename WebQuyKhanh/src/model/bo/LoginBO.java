package model.bo;

import model.bean.Member;
import model.dao.LoginDAO;

public class LoginBO {

	private LoginDAO loginDAO;
	public LoginBO(){
		loginDAO= new LoginDAO();		
	}
	public Member checkLogin(String email, String password){
		return loginDAO.checkLogin(email,password);
	}
}

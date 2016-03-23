package model.bo;

import model.dao.LoginDAO;

public class LoginBO {

	private LoginDAO loginDAO;
	public LoginBO(){
		loginDAO= new LoginDAO();		
	}
	public boolean checkLogin(String email, String password){
		return loginDAO.checkLogin(email,password);
	}
}

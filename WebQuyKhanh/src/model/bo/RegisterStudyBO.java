package model.bo;

import model.bean.RegisterStudy;
import model.dao.RegisterStudyDAO;

public class RegisterStudyBO {

	private RegisterStudyDAO registerStudyDAO;
	public RegisterStudyBO(){
		registerStudyDAO= new RegisterStudyDAO();
	}
	public boolean emailExist(String email) {
		return registerStudyDAO.emailExist(email);
	}
	public void addNewRegister(RegisterStudy registerStudy) {
		registerStudyDAO.addNewRegister(registerStudy);
	}
}

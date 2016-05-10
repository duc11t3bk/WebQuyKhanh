package model.bo;

import java.util.ArrayList;

import model.bean.Class;
import model.dao.ClassDAO;

public class ClassBO {

	private ClassDAO classDAO;
	
	public ClassBO(){
		classDAO= new ClassDAO();
	}

	public ArrayList<Class> getListClass() {
		return classDAO.getListClass();
	}

	public void addNewClass(Class myClass) {
		classDAO.addNewClass(myClass);
	}

	public Class getClass(String classID) {
		return classDAO.getClass(classID);
	}

	public void updateClass(Class myClass) {
		classDAO.updateClass(myClass);
	}

	public boolean deleteClass(String classID) {
		return classDAO.deleteClass(classID);
	}

}

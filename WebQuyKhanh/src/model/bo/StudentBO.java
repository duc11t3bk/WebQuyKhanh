package model.bo;

import java.util.ArrayList;

import model.bean.Class;
import model.bean.Student;
import model.dao.StudentDAO;

public class StudentBO {

	private StudentDAO studentDAO;
	public StudentBO(){
		studentDAO= new StudentDAO();
	}
	public ArrayList<Class> getListClass(String teacherID, int priority) {
		return studentDAO.getListClass(teacherID,priority);
	}
	public ArrayList<Student> getListStudent(String classID) {
		return studentDAO.getListStudent(classID);
	}
}
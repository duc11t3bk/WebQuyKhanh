package model.bo;

import java.util.ArrayList;

import model.bean.Teacher;
import model.dao.TeacherDAO;

public class TeacherBO {

	private TeacherDAO teacherDAO;
	public TeacherBO(){
		teacherDAO= new TeacherDAO();
	}
	public ArrayList<Teacher> getListTeacher() {
		return teacherDAO.getListTeacher();
	}
	public boolean deleteTeacher(String teacherID) {
		return teacherDAO.deleteTeacher(teacherID);
	}
}

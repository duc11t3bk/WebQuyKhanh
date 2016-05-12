package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Class;
import model.bean.Posts;

public class RegisterStudyForm extends ActionForm {

	private String email;
	private String phoneNumber;
	private String classID;
	private ArrayList<Class> listClass;
	private String submit;
	private String action;
	private ArrayList<Posts> listPostsNews;
	
	
	public ArrayList<Posts> getListPostsNews() {
		return listPostsNews;
	}
	public void setListPostsNews(ArrayList<Posts> listPostsNews) {
		this.listPostsNews = listPostsNews;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public ArrayList<Class> getListClass() {
		return listClass;
	}
	public void setListClass(ArrayList<Class> listClass) {
		this.listClass = listClass;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
}

package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Class;

public class ClassForm extends ActionForm {
	private String classID;
	private String className;
	private int classFee;
	private String classTime;
	private String classRoom;
	private ArrayList<Class> listClass;
	private String action;
	private String jsonData;
	
	
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getClassID() {
		return classID;
	}

	public void setClassID(String classID) {
		this.classID = classID;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public int getClassFee() {
		return classFee;
	}

	public void setClassFee(int classFee) {
		this.classFee = classFee;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}

	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	public ArrayList<Class> getListClass() {
		return listClass;
	}

	public void setListClass(ArrayList<Class> listClass) {
		this.listClass = listClass;
	}
}

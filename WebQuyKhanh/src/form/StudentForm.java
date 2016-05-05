package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Class;
import model.bean.Student;

public class StudentForm extends ActionForm {

	private String studentID;
	private String name;
	private String email;
	private String phoneNumber;
	private String classID;
	private int amountPaid;
	private Student student;
	private Class myClass;
	private ArrayList<Class> listClass;
	private ArrayList<Student> students;
	private String action;
	private String classFee;
	private String className;
	private String classTime;
	private String jsonStudent;
	
	
	public String getJsonStudent() {
		return jsonStudent;
	}
	public void setJsonStudent(String jsonStudent) {
		this.jsonStudent = jsonStudent;
	}
	public Class getMyClass() {
		return myClass;
	}
	public void setMyClass(Class myClass) {
		this.myClass = myClass;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getClassFee() {
		return classFee;
	}
	public void setClassFee(String classFee) {
		this.classFee = classFee;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public ArrayList<Student> getStudents() {
		return students;
	}
	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}
	public ArrayList<Class> getListClass() {
		return listClass;
	}
	public void setListClass(ArrayList<Class> listClass) {
		this.listClass = listClass;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(int amountPaid) {
		this.amountPaid = amountPaid;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}

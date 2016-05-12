package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import model.bean.Member;
import model.bean.Posts;

public class MemberForm extends ActionForm {
	
	private String memberID;
	private String teacherID;
	private String email;
	private String phoneNumber;
	private String phoneNumberError;
	private String password;
	private String passwordError;
	private String newPassword;
	private String newPasswordError;
	private String retypePassword;
	private String retypePasswordError;
	private String image;
	private int priority;
	private Member member;
	private FormFile file;
	private String submit;
	private ArrayList<Member> members;
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
	public ArrayList<Member> getMembers() {
		return members;
	}
	public void setMembers(ArrayList<Member> members) {
		this.members = members;
	}
	public String getPhoneNumberError() {
		return phoneNumberError;
	}
	public void setPhoneNumberError(String phoneNumberError) {
		this.phoneNumberError = phoneNumberError;
	}
	public String getPasswordError() {
		return passwordError;
	}
	public void setPasswordError(String passwordError) {
		this.passwordError = passwordError;
	}
	public String getNewPasswordError() {
		return newPasswordError;
	}
	public void setNewPasswordError(String newPasswordError) {
		this.newPasswordError = newPasswordError;
	}
	public String getRetypePasswordError() {
		return retypePasswordError;
	}
	public void setRetypePasswordError(String retypePasswordError) {
		this.retypePasswordError = retypePasswordError;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getRetypePassword() {
		return retypePassword;
	}
	public void setRetypePassword(String retypePassword) {
		this.retypePassword = retypePassword;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
}

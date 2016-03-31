package form;

import java.util.Date;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import model.bean.Member;
import model.bean.Teacher;

public class TeacherForm extends ActionForm {

	private String teacherID;
	private String name;
	private String dayOfBirth;
	private int sex;
	private String address;
	private String certificate;
	private String dayOfContract;
	private String email;
	private String phoneNumber;
	private String password;
	private String newPassword;
	private String retypePassword;
	private Teacher teacher;
	private String nameError;
	private String addressError;
	private String certificateError;
	private String dayOfContractError;
	private String dayOfBirthError;
	private String emailError;
	private String phoneNumberError;
	private String passwordError;
	private String newPasswordError;
	private String retypePasswordError;
	private Member member;
	private String submit;
	private FormFile file;
	

	public String getDayOfBirthError() {
		return dayOfBirthError;
	}
	public void setDayOfBirthError(String dayOfBirthError) {
		this.dayOfBirthError = dayOfBirthError;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getEmailError() {
		return emailError;
	}
	public void setEmailError(String emailError) {
		this.emailError = emailError;
	}
	public String getPhoneNumberError() {
		return phoneNumberError;
	}
	public void setPhoneNumberError(String phoneNumberError) {
		this.phoneNumberError = phoneNumberError;
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
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getNameError() {
		return nameError;
	}
	public void setNameError(String nameError) {
		this.nameError = nameError;
	}
	public String getAddressError() {
		return addressError;
	}
	public void setAddressError(String addressError) {
		this.addressError = addressError;
	}
	public String getCertificateError() {
		return certificateError;
	}
	public void setCertificateError(String certificateError) {
		this.certificateError = certificateError;
	}
	public String getDayOfContractError() {
		return dayOfContractError;
	}
	public void setDayOfContractError(String dayOfContractError) {
		this.dayOfContractError = dayOfContractError;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDayOfBirth() {
		return dayOfBirth;
	}
	public void setDayOfBirth(String dayOfBirth) {
		this.dayOfBirth = dayOfBirth;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getDayOfContract() {
		return dayOfContract;
	}
	public void setDayOfContract(String dayOfContract) {
		this.dayOfContract = dayOfContract;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
}

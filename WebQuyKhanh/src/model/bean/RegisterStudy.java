package model.bean;

public class RegisterStudy {
	
	public static String TUVANDUHOC="TVDH";
	public static String DANGKYHOC="DKH";
	
	private String registerID;
	private String email;
	private String phoneNumber;
	private String classID;
	private String category;
	
	
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public String getRegisterID() {
		return registerID;
	}
	public void setRegisterID(String registerID) {
		this.registerID = registerID;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
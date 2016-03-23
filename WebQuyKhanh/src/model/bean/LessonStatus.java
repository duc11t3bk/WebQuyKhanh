package model.bean;

public class LessonStatus {

	private String memberID;
	private String lessonID;
	private int accuracy;
	private String category;
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getLessonID() {
		return lessonID;
	}
	public void setLessonID(String lessonID) {
		this.lessonID = lessonID;
	}
	public int getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(int accuracy) {
		this.accuracy = accuracy;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}

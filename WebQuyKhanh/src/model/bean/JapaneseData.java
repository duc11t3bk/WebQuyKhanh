package model.bean;

public class JapaneseData {

	public static int NUMBER_ANSWERS=4;
	public static int NUMBER_QUESTIONS=5;
	public static int NUMBER_NEW_WORDS=8;
	public static int TOTAL_QUESTIONS=25;
	private String dataID;
	private String lessonID;
	private String levelID;
	private String japanese;
	private String vietnamese;
	private String dataSound;
	private String memberID;
	
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getDataID() {
		return dataID;
	}
	public void setDataID(String dataID) {
		this.dataID = dataID;
	}
	public String getLessonID() {
		return lessonID;
	}
	public void setLessonID(String lessonID) {
		this.lessonID = lessonID;
	}
	public String getLevelID() {
		return levelID;
	}
	public void setLevelID(String levelID) {
		this.levelID = levelID;
	}
	public String getJapanese() {
		return japanese;
	}
	public void setJapanese(String japanese) {
		this.japanese = japanese;
	}
	public String getVietnamese() {
		return vietnamese;
	}
	public void setVietnamese(String vietnamese) {
		this.vietnamese = vietnamese;
	}
	public String getDataSound() {
		return dataSound;
	}
	public void setDataSound(String dataSound) {
		this.dataSound = dataSound;
	}
	
}

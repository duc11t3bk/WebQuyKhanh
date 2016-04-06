package form;

import org.apache.struts.action.ActionForm;

import model.bean.Lesson;
import model.bean.LessonStatus;
import model.bean.Level;
import model.bean.WordStatus;

public class VocabularyForm extends ActionForm {

	private String lessonID;
	private String levelID;
	private String lessonName;
	private String levelName;
	private String dataID;
	private String memberID;
	private String accuracy;
	private String category;
	private Lesson lesson;
	private Level level;
	private LessonStatus lessonStatus;
	private WordStatus wordStatus;
	
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
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public String getDataID() {
		return dataID;
	}
	public void setDataID(String dataID) {
		this.dataID = dataID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	public LessonStatus getLessonStatus() {
		return lessonStatus;
	}
	public void setLessonStatus(LessonStatus lessonStatus) {
		this.lessonStatus = lessonStatus;
	}
	public WordStatus getWordStatus() {
		return wordStatus;
	}
	public void setWordStatus(WordStatus wordStatus) {
		this.wordStatus = wordStatus;
	}
	
	
}

package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.WordStatus;

public class LearnJapaneseForm extends ActionForm {
	
	private Lesson lesson;
	private ArrayList<JapaneseData> listData;
	private ArrayList<WordStatus> listWordStatus;
	private String lessonID;
	private String memberID;
	private String dataResponse;
	
	
	public String getDataResponse() {
		return dataResponse;
	}
	public void setDataResponse(String dataResponse) {
		this.dataResponse = dataResponse;
	}
	public String getLessonID() {
		return lessonID;
	}
	public void setLessonID(String lessonID) {
		this.lessonID = lessonID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public ArrayList<JapaneseData> getListData() {
		return listData;
	}
	public void setListData(ArrayList<JapaneseData> listData) {
		this.listData = listData;
	}
	public ArrayList<WordStatus> getListWordStatus() {
		return listWordStatus;
	}
	public void setListWordStatus(ArrayList<WordStatus> listWordStatus) {
		this.listWordStatus = listWordStatus;
	}
	
}

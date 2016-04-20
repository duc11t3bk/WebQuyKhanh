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
	private String dataReceive;
	private String submit;
	private int trueAnswers;
	private int accuracy;
	private String time;
	
	
	public int getTrueAnswers() {
		return trueAnswers;
	}
	public void setTrueAnswers(int trueAnswers) {
		this.trueAnswers = trueAnswers;
	}
	public int getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(int accuracy) {
		this.accuracy = accuracy;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public String getDataReceive() {
		return dataReceive;
	}
	public void setDataReceive(String dataReceive) {
		this.dataReceive = dataReceive;
	}
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

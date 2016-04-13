package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.WordStatus;

public class LearnJapaneseForm extends ActionForm {
	
	private Lesson lesson;
	private ArrayList<JapaneseData> listData;
	private ArrayList<String> listAnswer;
	private ArrayList<WordStatus> listWordStatus;
	
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
	public ArrayList<String> getListAnswer() {
		return listAnswer;
	}
	public void setListAnswer(ArrayList<String> listAnswer) {
		this.listAnswer = listAnswer;
	}
	public ArrayList<WordStatus> getListWordStatus() {
		return listWordStatus;
	}
	public void setListWordStatus(ArrayList<WordStatus> listWordStatus) {
		this.listWordStatus = listWordStatus;
	}
	
}

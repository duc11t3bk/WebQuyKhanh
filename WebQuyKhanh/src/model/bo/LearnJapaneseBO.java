package model.bo;

import java.util.ArrayList;

import model.bean.JapaneseData;
import model.bean.WordStatus;
import model.dao.LearnJapaneseDAO;

public class LearnJapaneseBO {

	private LearnJapaneseDAO learnJapaneseDAO;
	public LearnJapaneseBO(){
		learnJapaneseDAO= new LearnJapaneseDAO();
	}
	public ArrayList<JapaneseData> getListNewWords(String memberID, String lessonID) {
		return learnJapaneseDAO.getListNewWords(memberID,lessonID);
	}
	public boolean updateWordStatus(ArrayList<WordStatus> listWordStatus) {
		return learnJapaneseDAO.updateWordStatus(listWordStatus);
	}
}

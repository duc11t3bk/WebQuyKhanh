package model.bo;

import java.util.ArrayList;

import model.bean.JapaneseData;
import model.dao.LearnJapaneseDAO;

public class LearnJapaneseBO {

	private LearnJapaneseDAO learnJapaneseDAO;
	public LearnJapaneseBO(){
		learnJapaneseDAO= new LearnJapaneseDAO();
	}
	public ArrayList<JapaneseData> getListNewWords(String memberID, String lessonID) {
		return learnJapaneseDAO.getListNewWords(memberID,lessonID);
	}
}

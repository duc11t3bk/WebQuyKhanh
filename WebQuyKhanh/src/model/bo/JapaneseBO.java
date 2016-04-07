package model.bo;

import java.util.ArrayList;

import model.bean.Lesson;
import model.bean.Level;
import model.dao.JapaneseDAO;

public class JapaneseBO {

	private JapaneseDAO japaneseDAO;
	
	public JapaneseBO(){
		japaneseDAO= new JapaneseDAO();
	}

	public ArrayList<Level> getListLevel(String action) {
		return japaneseDAO.getListLevel(action);
	}

	public ArrayList<Lesson> getListLesson(String action) {
		return japaneseDAO.getListLesson(action);
	}

	public void addNewLevel(Level newLevel) {
		japaneseDAO.addNewLevel(newLevel);
	}
	
}

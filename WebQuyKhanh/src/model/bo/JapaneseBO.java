package model.bo;

import java.util.ArrayList;

import model.bean.JapaneseData;
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

	public void addNewLevel(Level level) {
		japaneseDAO.addNewLevel(level);
	}

	public void addNewLesson(Lesson lesson) {
		japaneseDAO.addNewLesson(lesson);
	}

	public ArrayList<JapaneseData> getListData(String lessonID) {
		return japaneseDAO.getListData(lessonID);
	}

	public Lesson getLesson(String lessonID) {
		return japaneseDAO.getLesson(lessonID);
	}

	public boolean deleteLevel(String levelID) {
		return japaneseDAO.deleteLevel(levelID);
	}

	public boolean importFileExcel(String lessonID, String filePath) {
		return japaneseDAO.importFileExcel(lessonID,filePath);
	}

	public void deleteLesson(String lessonID) {
		japaneseDAO.deleteLesson(lessonID);
	}

	public ArrayList<String> getFilesAudio(String lessonID) {
		return japaneseDAO.getFilesAudio(lessonID);
	}
}

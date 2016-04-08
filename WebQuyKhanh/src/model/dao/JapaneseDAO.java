package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.fastinfoset.vocab.Vocabulary;

import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.Level;

public class JapaneseDAO {

	private ConnectionDAO connection;
	private Connection conn;
	
	public JapaneseDAO(){
		connection= new ConnectionDAO();
	}

	public ArrayList<Level> getListLevel(String action) {
		try {
			conn=connection.openConnection();
			String sql="";
			if("vocabulary".equals(action)){
				sql="select * from japaneselevel where category='voca' ";
			}
			else{
				sql="select * from japaneselevel where category='tran' ";
			}
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ArrayList<Level> listLevel= new ArrayList<Level>();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Level level= new Level();
				level.setLevelID(rs.getString(1));
				level.setLevelName(rs.getString(2));
				level.setCategory(rs.getString(3));
				listLevel.add(level);
			}
			return listLevel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}

	public ArrayList<Lesson> getListLesson(String action) {
		try {
			conn=connection.openConnection();
			String sql="";
			if("vocabulary".equals(action)){
				sql="select jales.lesson_id, jales.level_id, jales.name "
						+ "from japaneselesson jales join japaneselevel jalev "
						+ " on (jales.level_id = jalev.level_id) "
						+ " where jalev.category='voca'";
			}
			else{
				sql="select jales.lesson_id, jales.level_id, jales.name "
						+ "from japaneselesson jales join japaneselevel jalev "
						+ " on (jales.level_id = jalev.level_id) "
						+ " where jalev.category='tran'";
			}
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ArrayList<Lesson> listLesson= new ArrayList<Lesson>();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Lesson lesson= new Lesson();
				lesson.setLessonID(rs.getString(1));
				lesson.setLevelID(rs.getString(2));
				lesson.setLessonName(rs.getString(3));
				listLesson.add(lesson);
			}
			return listLesson;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}

	public void addNewLevel(Level level) {
		try {
			conn=connection.openConnection();
			String sql="insert into japaneselevel values(?,?,?)";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			level.setLevelID(ConnectionDAO.increateID("japaneselevel", "level_id", conn));
			pstmt.setString(1,level.getLevelID());
			pstmt.setString(2, level.getLevelName());
			pstmt.setString(3, level.getCategory());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			connection.closeConnection();
		}
	}

	public void addNewLesson(Lesson lesson) {
		try {
			conn=connection.openConnection();
			String lessonID=ConnectionDAO.increateID("japaneselesson", "lesson_id", conn);
			lesson.setLessonID(lessonID);
			String sql="insert into japaneselesson values(?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lesson.getLessonID());
			pstmt.setString(2, lesson.getLevelID());
			pstmt.setString(3, lesson.getLessonName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			connection.closeConnection();
		}
	}

	public ArrayList<JapaneseData> getListData(String lessonID) {
		try {
			conn=connection.openConnection();
			String sql=" select * from japanesedata where lesson_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<JapaneseData> listData= new ArrayList<JapaneseData>();
			while(rs.next()){
				JapaneseData japaneseData= new JapaneseData();
				japaneseData.setDataID(rs.getString(1));
				japaneseData.setLessonID(rs.getString(2));
				japaneseData.setLevelID(rs.getString(3));
				japaneseData.setJapanese(rs.getString(4));
				japaneseData.setVietnamese(rs.getString(5));
				japaneseData.setDataSound(rs.getString(6));
				listData.add(japaneseData);
			}
			return listData;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}

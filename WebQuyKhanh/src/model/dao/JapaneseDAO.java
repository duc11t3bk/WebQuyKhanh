package model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.fastinfoset.vocab.Vocabulary;

import common.StringProcess;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;
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
		finally{
			connection.closeConnection();
		}
	}

	public Lesson getLesson(String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select jales.lesson_id, jales.level_id, jales.name, jalev.name"
					+ " from japaneselesson jales join japaneselevel jalev"
					+ " on (jales.level_id = jalev.level_id) "
					+ " where jales.lesson_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			ResultSet rs= pstmt.executeQuery();
			Lesson lesson= new Lesson();
			while(rs.next()){
				lesson.setLessonID(rs.getString(1));
				lesson.setLevelID(rs.getString(2));
				lesson.setLessonName(rs.getString(3));
				lesson.setLevelName(rs.getString(4));
			}
			return lesson;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public boolean deleteLevel(String levelID) {
		try {
			conn=connection.openConnection();
			String sqlCheck="select * from japaneselesson where level_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sqlCheck);
			pstmt.setString(1, levelID);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				return false;
			}
			else{
				String sql="delete from japaneselevel where level_id= ?";
				PreparedStatement pstmt2=conn.prepareStatement(sql);
				pstmt2.setString(1, levelID);
				return (pstmt2.executeUpdate() != 0) ? true : false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}

	public boolean importFileExcel(String lessonID, String filePath) {
		try {
			/**delete lesson data*/
			deleteLessonData(lessonID);
			/********************/
			conn=connection.openConnection();
			String sqlLevelID="select level_id from japaneselesson where lesson_id = ?";
			PreparedStatement pstmt= conn.prepareStatement(sqlLevelID);
			pstmt.setString(1, lessonID);
			ResultSet rs1= pstmt.executeQuery();
			String levelID="";
			if(rs1.next()){
				levelID=rs1.getString(1);
			}
			WorkbookSettings ws= new WorkbookSettings();
			ws.setEncoding("CP1252");
			Workbook workBook= Workbook.getWorkbook(new File(filePath),ws);
			Sheet sheet= workBook.getSheet(0);
			int rows=(sheet.getRows());
			System.out.println("rows="+sheet.getRows());
			System.out.println("rows="+rows);
			ArrayList<JapaneseData> listData= new ArrayList<JapaneseData>();
			String id=ConnectionDAO.increateID("japanesedata", "data_id", conn);
			String code=id.substring(0, 3);
			int value=Integer.valueOf(id.substring(3,id.length()));
			for(int row=1; row<rows; row++){
				Cell cellJapanese=sheet.getCell(0, row);
				Cell cellVietnamese=sheet.getCell(1, row);
				Cell cellAudio=sheet.getCell(2, row);
				JapaneseData data= new JapaneseData();
				data.setDataID(code+String.format("%08d",value));
				data.setJapanese(cellJapanese.getContents());
				data.setVietnamese(cellVietnamese.getContents());
				data.setDataSound(cellAudio.getContents());
				data.setLessonID(lessonID);
				data.setLevelID(levelID);
				listData.add(data);
				value++;
				System.out.println(""+cellVietnamese.getContents());
			}
			String sqlInsert= "insert into japanesedata values(?,?,?,?,?,?)";
			PreparedStatement pstmtInsertData=conn.prepareStatement(sqlInsert);
			for(int i=0; i<listData.size(); i++){
				pstmtInsertData.setString(1, listData.get(i).getDataID());
				pstmtInsertData.setString(2, listData.get(i).getLessonID());
				pstmtInsertData.setString(3, listData.get(i).getLevelID());
				pstmtInsertData.setString(4, listData.get(i).getJapanese());
				pstmtInsertData.setString(5, listData.get(i).getVietnamese());
				pstmtInsertData.setString(6, listData.get(i).getDataSound());
				pstmtInsertData.addBatch();
			}

			int count= pstmtInsertData.executeBatch()[0];
			System.out.println(""+count);
			return (count!=0) ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}
	public boolean deleteLessonData(String lessonID){
		try {
			conn=connection.openConnection();
			String sql="delete from japanesedata where data_id in "
					+ " (select data_id from "
					+ " ( select jd.data_id "
					+ " from japanesedata jd join japaneselevel jl "
					+ " on (jd.level_id=jl.level_id)"
					+ " where (jl.category= ?) and (jd.lesson_id= ?)) p )";
			System.out.println("sql delete"+sql);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "voca");
			pstmt.setString(2, lessonID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}

	public void deleteLesson(String lessonID) {
		try {
			deleteLessonData(lessonID);
			conn=connection.openConnection();
			String sql="delete from japaneselesson where lesson_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			connection.closeConnection();
		}
	}

	public ArrayList<String> getFilesAudio(String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select sound"
					+ " from japanesedata where lesson_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<String> filesAudioName= new ArrayList<String>();
			while(rs.next()){
				filesAudioName.add(rs.getString(1));
			}
			return filesAudioName;
					
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}
}

package model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.corba.se.impl.orb.PrefixParserAction;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.fastinfoset.vocab.Vocabulary;

import common.StringProcess;
import common.Validate;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;
import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.LessonStatus;
import model.bean.Level;
import model.bean.WordStatus;

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
			String sql="select jales.lesson_id, jales.level_id, jales.name, jalev.name, jalev.category "
					+ " from japaneselesson jales join japaneselevel jalev"
					+ " on (jales.level_id = jalev.level_id) "
					+ " where jales.lesson_id = ?";
			System.out.println("sql===="+sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			ResultSet rs= pstmt.executeQuery();
			Lesson lesson= new Lesson();
			while(rs.next()){
				lesson.setLessonID(rs.getString(1));
				lesson.setLevelID(rs.getString(2));
				lesson.setLessonName(rs.getString(3));
				lesson.setLevelName(rs.getString(4));
				lesson.setCategory(rs.getString(5));
			}
			lesson.setTotalData(getTotalData(lessonID));
			return lesson;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}
	public int getTotalData(String lessonID){
		try {
			conn=connection.openConnection();
			String sqlCount="select count(*) from japanesedata where lesson_id = ?";
			PreparedStatement pstmtCount= conn.prepareStatement(sqlCount);
			pstmtCount.setString(1, lessonID);
			ResultSet rsCount=pstmtCount.executeQuery();
			int totalData=0;
			while(rsCount.next()){
				totalData+=rsCount.getInt(1);
			}
			return totalData;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
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
			deleteLearnWordData(lessonID);
			conn=connection.openConnection();
/*			String sql="delete from japanesedata where data_id in "
					+ " (select data_id from "
					+ " ( select jd.data_id "
					+ " from japanesedata jd join japaneselevel jl "
					+ " on (jd.level_id=jl.level_id)"
					+ " where (jl.category= ?) and (jd.lesson_id= ?)) p )";*/
			String sql="delete from japanesedata where lesson_id= ?";
			System.out.println("sql delete"+sql);
			PreparedStatement pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, "voca");
			pstmt.setString(1, lessonID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}
	public boolean deleteLearnWordData(String lessonID){
		try {
			conn=connection.openConnection();
			String sql="delete from learnword where data_id in "
					+ " ( select data_id from "
					+ " (select lw.data_id"
					+ " from japanesedata jd join learnword lw on (jd.data_id=lw.data_id) "
					+ " where jd.lesson_id= ? ) p )";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally{
			connection.closeConnection();
		}
	}
	public boolean deleteLessonStatus(String lessonID){
		try {
			conn=connection.openConnection();
			String sql="delete from lessonstatus where lesson_id= ?";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, lessonID);
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
			boolean check1=deleteLessonData(lessonID);
			boolean check2=deleteLessonStatus(lessonID);
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
				if(!Validate.isEmpty(rs.getString(1))){
					filesAudioName.add(rs.getString(1));
				}
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

	public LessonStatus getLessonStatus(String memberID, String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select * from lessonstatus where member_id= ? and lesson_id = ?";
			PreparedStatement pstmt=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			pstmt.setString(1, memberID);
			pstmt.setString(2, lessonID);
			ResultSet rs= pstmt.executeQuery();
			LessonStatus lessonStatus= new LessonStatus();
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					lessonStatus.setMemberID(rs.getString(1));
					lessonStatus.setLessonID(rs.getString(2));
					lessonStatus.setComplete(rs.getInt(3));
				}
			}
			else{
				String sqlInsert="insert into lessonstatus values(?,?,?)";
				PreparedStatement pstmtInsert=conn.prepareCall(sqlInsert);
				pstmtInsert.setString(1, memberID);
				pstmtInsert.setString(2, lessonID);
				pstmtInsert.setInt(3,0);
				pstmtInsert.executeUpdate();
				lessonStatus.setMemberID(memberID);
				lessonStatus.setLessonID(lessonID);
				lessonStatus.setComplete(0);
			}
			return lessonStatus;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public ArrayList<WordStatus> getListWordStatus(String memberID, String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select lw.member_id, lw.data_id, lw.accuracy "
					+ " from learnword lw join japanesedata jd on (lw.data_id = jd.data_id)"
					+ " where (jd.lesson_id = ?) and (lw.member_id= ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstmt.setString(1, lessonID);
			pstmt.setString(2, memberID);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<WordStatus> listWordStatus= new ArrayList<WordStatus>();
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					WordStatus wordStatus= new WordStatus();
					wordStatus.setMemberID(rs.getString(1));
					wordStatus.setDataID(rs.getString(2));
					wordStatus.setAccuracy(StringProcess.convertAccuracy(rs.getInt(3)));
					listWordStatus.add(wordStatus);
				}
			}
			else{
				String sqlGetDataID="select data_id "
								+ "  from japanesedata"
								+ " where lesson_id = ?";
				PreparedStatement pstmtGetDataID=conn.prepareCall(sqlGetDataID);
				pstmtGetDataID.setString(1, lessonID);
				ResultSet rsGetDataID= pstmtGetDataID.executeQuery();
				ArrayList<String> listDataID= new ArrayList<String>();
				while(rsGetDataID.next()){
					listDataID.add(rsGetDataID.getString(1));
				}
				String sqlInsertWordStatus="insert into learnword values(?,?,?)";
				PreparedStatement pstmtInsert=conn.prepareStatement(sqlInsertWordStatus);
				for(int i=0; i<listDataID.size(); i++){
					pstmtInsert.setString(1,memberID);
					pstmtInsert.setString(2, listDataID.get(i));
					pstmtInsert.setInt(3, 0);
					pstmtInsert.addBatch();
					WordStatus wordStatus= new WordStatus();
					wordStatus.setMemberID(memberID);
					wordStatus.setDataID(listDataID.get(i));
					wordStatus.setAccuracy(0);
					listWordStatus.add(wordStatus);
				}
				pstmtInsert.executeBatch();
			}
			return listWordStatus;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}

	public boolean checkReviewVocabulary(String memberID, String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select count(*)"
					+ " from learnword lw join japanesedata jd on (lw.data_id=jd.data_id)"
					+ " where (lw.member_id= ?) and (jd.lesson_id= ?) and (lw.accuracy= ? )";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			pstmt.setString(2, lessonID);
			pstmt.setInt(3, 5);
			ResultSet rs=pstmt.executeQuery();
			int totalReview=0;
			if(rs.next()){
				totalReview=Integer.valueOf(rs.getString(1));
			}
			return (totalReview >= 5) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}

	public boolean checkReviewTranslate(String memberID, String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select count(*) "
					+ " from japanesedata jd join learnword lw on (jd.data_id=lw.data_id) "
					+ " where lw.member_id= ? and jd.lesson_id= ? and lw.accuracy= 5";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			pstmt.setString(2, lessonID);
			int totalReview=0;
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				totalReview+=Integer.valueOf(rs.getString(1));
			}
			return (totalReview >0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}

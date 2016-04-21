package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.JapaneseData;
import model.bean.WordStatus;

public class LearnJapaneseDAO {

	private ConnectionDAO connection;
	private Connection conn;
	
	public LearnJapaneseDAO(){
		connection= new ConnectionDAO();
	}

	public ArrayList<JapaneseData> getListNewWords(String memberID, String lessonID) {
		try {
			conn=connection.openConnection();
			String sql="select lw.data_id, jd.lesson_id, jd.level_id, jd.japanese, jd.vietnamese, jd.sound "
					+ " from learnword lw join japanesedata jd on (lw.data_id=jd.data_id) "
					+ " where (lw.member_id= ?) and (jd.lesson_id= ?)"
					+ " order by lw.accuracy asc, lw.data_id asc "
					+ " limit "+JapaneseData.NUMBER_NEW_WORDS;
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,memberID);
			pstmt.setString(2,lessonID);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<JapaneseData> listNewWords= new ArrayList<JapaneseData>();
			while(rs.next()){
				JapaneseData japaneseData= new JapaneseData();
				japaneseData.setDataID(rs.getString(1));
				japaneseData.setLessonID(rs.getString(2));
				japaneseData.setLevelID(rs.getString(3));
				japaneseData.setJapanese(rs.getString(4));
				japaneseData.setVietnamese(rs.getString(5));
				japaneseData.setDataSound(rs.getString(6));
				listNewWords.add(japaneseData);
			}
			return listNewWords;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			connection.closeConnection();
		}
	}

	public boolean updateWordStatus(ArrayList<WordStatus> listWordStatus) {
		try {
			conn= connection.openConnection();
			String sql="update learnword set accuracy = ? where data_id= ? and member_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			for(int i=0; i<listWordStatus.size(); i++){
				pstmt.setInt(1, listWordStatus.get(i).getAccuracy());
				pstmt.setString(2, listWordStatus.get(i).getDataID());
				pstmt.setString(3, listWordStatus.get(i).getMemberID());
				pstmt.addBatch();
			}
			return (pstmt.executeBatch()[0] !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
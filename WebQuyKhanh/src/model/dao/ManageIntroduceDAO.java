package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Image;

public class ManageIntroduceDAO {

	private ConnectionDAO connection;
	private Connection conn;
	public ManageIntroduceDAO(){
		connection= new ConnectionDAO();
	}
	public ArrayList<Image> getListImage() {
		try {
			conn= connection.openConnection();
			String sql="select * from image";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Image> listImage= new ArrayList<Image>();
			while(rs.next()){
				Image image= new Image();
				image.setImgID(rs.getString(1));
				image.setImgName(rs.getString(2));
				image.setStatus(rs.getString(3));
				listImage.add(image);
			}
			return listImage;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}
	public boolean addNewImage(String imageName) {
		try {
			conn=connection.openConnection();
			String image_id= ConnectionDAO.increateID("image", "image_id", conn);
			String sql="insert into image values(?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, image_id);
			pstmt.setString(2, imageName);
			pstmt.setString(3, null);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}
	public boolean updateBanner(String imageID, String status) {
		try {
			conn=connection.openConnection();
			String sql="update image set status= ? where image_id = ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, imageID);
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}
}

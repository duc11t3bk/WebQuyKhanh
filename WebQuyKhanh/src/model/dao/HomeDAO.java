package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringProcess;
import model.bean.Image;
import model.bean.Posts;

public class HomeDAO {

	private ConnectionDAO connection;
	private Connection conn;
	public HomeDAO(){
		connection= new ConnectionDAO();
	}
	public ArrayList<Posts> getListPostsNews() {
		try {
			conn=connection.openConnection();
			String sql="select * "
					+ " from post "
					+ " where category != ? "
					+ " order by dateposted desc, post_id desc"
					+ " limit 0,5";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "LGD");
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Posts> listPostsNews= new ArrayList<Posts>();
			while(rs.next()){
				Posts posts= new Posts();
				posts.setPostID(rs.getString(1));
				posts.setTeacherID(rs.getString(2));
				posts.setTitle(rs.getString(3));
				posts.setDatePosted(StringProcess.formatDate(rs.getString(5), "yyyy-MM-dd", "dd-MM-yyyy"));
				posts.setImage(rs.getString(6));
				posts.setCategory(rs.getString(7));
				listPostsNews.add(posts);
			}
			return listPostsNews;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}
	public ArrayList<Posts> getListPost(String category, int limit) {
		try {
			conn=connection.openConnection();
			String sql="select *"
					+ " from post"
					+ " where category= ?"
					+ " order by dateposted desc, post_id desc"
					+ " limit 0, ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, limit);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Posts> listPosts= new ArrayList<Posts>();
			while(rs.next()){
				Posts posts= new Posts();
				posts.setPostID(rs.getString(1));
				posts.setTeacherID(rs.getString(2));
				posts.setTitle(rs.getString(3));
				posts.setDatePosted(StringProcess.formatDate(rs.getString(5), "yyyy-MM-dd", "dd-MM-yyyy"));
				posts.setImage(rs.getString(6));
				posts.setCategory(rs.getString(7));
				listPosts.add(posts);
			}
			return listPosts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public String getBanner(String status) {
		try {
			conn=connection.openConnection();
			String sql="select content from image where status= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, status);
			ResultSet rs= pstmt.executeQuery();
			String imageName=null;
			if(rs.next()){
				imageName=rs.getString(1);
			}
			return imageName;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}
	
}

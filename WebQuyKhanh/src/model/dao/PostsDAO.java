package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StringProcess;
import model.bean.Posts;

public class PostsDAO {

	private ConnectionDAO connection;
	private Connection conn;
	
	public PostsDAO(){
		connection= new ConnectionDAO();
	}
	
	public boolean addNewPosts(Posts posts) {
		try {
			conn= connection.openConnection();
			String postID= ConnectionDAO.increateID("post", "post_id", conn);
			posts.setPostID(postID);
			String sql="insert into post values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, posts.getPostID());
			pstmt.setString(2, posts.getTeacherID());
			pstmt.setString(3, posts.getTitle());
			pstmt.setString(4, posts.getContent());
			pstmt.setString(5, StringProcess.formatDate(posts.getDatePosted(), "dd-MM-yyyy", "yyyy-MM-dd"));
			pstmt.setString(6, posts.getImage());
			pstmt.setInt(7, posts.getViews());
			pstmt.setString(8, posts.getCategory());
			
			return (pstmt.executeUpdate()!=0) ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}

	public ArrayList<Posts> getListPosts(int priority, String teacherID) {
		try {
			conn=connection.openConnection();
			String sql="";
			if(priority==3){
				sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
						+ ", p.image, p.views, p.category "
						+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
						+ " order by dateposted desc";
			}
			if(priority==1){
				sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
						+ ", p.image, p.views, p.category "
						+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
						+ " where p.teacher_id='"+teacherID+"' "
						+ " order by dateposted desc";
			}
			PreparedStatement pstmt= conn.prepareStatement(sql);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<Posts> posts= new ArrayList<Posts>();
			while(rs.next()){
				Posts post= new Posts();
				post.setPostID(rs.getString(1));
				post.setTeacherID(rs.getString(2));
				post.setTeacherName(rs.getString(3));
				post.setTitle(rs.getString(4));
				post.setContent(rs.getString(5));
				post.setDatePosted(StringProcess.formatDate(rs.getString(6), "yyyy-MM-dd", "dd-MM-yyyy"));
				post.setImage(rs.getString(7));
				post.setViews(rs.getInt(8));
				post.setCategory(rs.getString(9));
				
				posts.add(post);
			}
			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally {
			connection.closeConnection();
		}
	}

	public Posts getPosts(String postID) {
		try {
			conn=connection.openConnection();
			String sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, "
					+ " p.dateposted, p.image, p.views, p.category "
					+ "	from post p join teacher tc on (p.teacher_id= tc.teacher_id) "
					+ " where post_id= ?";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, postID);
			ResultSet rs= pstmt.executeQuery();
			Posts post= new Posts();
			while(rs.next()){
				post.setPostID(rs.getString(1));
				post.setTeacherID(rs.getString(2));
				post.setTeacherName(rs.getString(3));
				post.setTitle(rs.getString(4));
				post.setContent(rs.getString(5));
				post.setDatePosted(StringProcess.formatDate(rs.getString(6), "yyyy-MM-dd", "dd-MM-yyyy"));
				post.setImage(rs.getString(7));
				post.setViews(rs.getInt(8));
				post.setCategory(rs.getString(9));
			}
			return post;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}

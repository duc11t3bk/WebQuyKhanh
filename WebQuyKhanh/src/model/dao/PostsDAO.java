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

	public ArrayList<Posts> getListPosts(int priority, String teacherID, String group) {
		try {
			conn=connection.openConnection();
			String sql="";
			if(priority==3){
				if(group==null || "ALL".equals(group)){
					sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
							+ ", p.image, p.views, p.category "
							+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
							+ " order by dateposted desc, post_id desc";
				}
				else{
					sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
							+ ", p.image, p.views, p.category "
							+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
							+ " where p.category= '"+group+"'"
							+ " order by dateposted desc, post_id desc";
				}
			}
			if(priority==1){
				if(group==null || "ALL".equals(group)){
					sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
							+ ", p.image, p.views, p.category "
							+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
							+ " where p.teacher_id='"+teacherID+"' "
							+ " order by dateposted desc, post_id desc";
				}
				else{
					sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted "
							+ ", p.image, p.views, p.category "
							+ " from post p join teacher tc on (p.teacher_id=tc.teacher_id)"
							+ " where p.teacher_id='"+teacherID+"' and p.category='"+group+"'"
							+ " order by dateposted desc, post_id desc";
				}
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

	public boolean updatePosts(Posts post) {
		try {
			conn=connection.openConnection();
			String sql="update post set title= ?, content= ? , image= ?, category=?  where post_id= ?";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getImage());
			pstmt.setString(4, post.getCategory());
			pstmt.setString(5, post.getPostID());
			return (pstmt.executeUpdate() !=0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			connection.closeConnection();
		}
	}

	public boolean deletePosts(String postID) {
		try {
			conn= connection.openConnection();
			String sql= "delete from post where post_id= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, postID);
			return (pstmt.executeUpdate() != 0) ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList<Posts> getListPosts(String category) {
		try {
			conn=connection.openConnection();
			String sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted, p.image, p.views, p.category "
					+ "	from post p join teacher tc on (p.teacher_id = tc.teacher_id)"
					+ " where category= ?"
					+ " order by p.dateposted desc";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			ResultSet rs= pstmt.executeQuery();
			ArrayList<Posts> listPosts= new ArrayList<Posts>();
			while(rs.next()){
				Posts posts= new Posts();
				posts.setPostID(rs.getString(1));
				posts.setTeacherID(rs.getString(2));
				posts.setTeacherName(rs.getString(3));
				posts.setTitle(rs.getString(4));
				posts.setContent(rs.getString(5));
				posts.setDatePosted(StringProcess.formatDate(rs.getString(6), "yyyy-MM-dd", "dd-MM-yyyy"));
				posts.setImage(rs.getString(7));
				posts.setViews(rs.getInt(8));
				posts.setCategory(rs.getString(9));
				listPosts.add(posts);
			}
			return listPosts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public ArrayList<Posts> getListPosts(String category, int page) {
		try {
			conn=connection.openConnection();
			String sql="select p.post_id, p.teacher_id, tc.fullname, p.title, p.content, p.dateposted, p.image, p.views, p.category "
					+ "	from post p join teacher tc on (p.teacher_id = tc.teacher_id)"
					+ " where category= ?"
					+ " order by p.dateposted desc "
					+ " limit ?, 5";
			System.out.println("sql"+sql);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, (page-1)*5);
			ResultSet rs=pstmt.executeQuery();
			ArrayList<Posts> listPosts= new ArrayList<Posts>();
			while(rs.next()){
				Posts posts= new Posts();
				posts.setPostID(rs.getString(1));
				posts.setTeacherID(rs.getString(2));
				posts.setTeacherName(rs.getString(3));
				posts.setTitle(rs.getString(4));
				posts.setContent(rs.getString(5));
				posts.setDatePosted(StringProcess.formatDate(rs.getString(6), "yyyy-MM-dd", "dd-MM-yyyy"));
				posts.setImage(rs.getString(7));
				posts.setViews(rs.getInt(8));
				posts.setCategory(rs.getString(9));
				listPosts.add(posts);
			}
			return listPosts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally{
			connection.closeConnection();
		}
	}

	public int getTotalPage(String category) {
		try {
			conn=connection.openConnection();
			String sql="select count(post_id)"
					+ " from post "
					+ " where category= ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			ResultSet rs=pstmt.executeQuery();
			int totalPage=0;
			int totalRow=0;
			while(rs.next()){
				totalRow=rs.getInt(1);
			}
			totalPage=totalRow/5;
			if(totalRow%5 !=0){
				totalPage+=1;
			}
			System.out.println("totalpage"+totalPage);
			return totalPage;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

}

package model.bo;

import java.util.ArrayList;

import model.bean.Posts;
import model.dao.PostsDAO;

public class PostsBO {

	private PostsDAO postsDAO;
	public PostsBO(){
		postsDAO= new PostsDAO();
	}
	public boolean addNewPosts(Posts posts) {
		return postsDAO.addNewPosts(posts);
	}
	public ArrayList<Posts> getListPosts(int priority, String teacherID, String group) {
		return postsDAO.getListPosts(priority,teacherID, group);
	}
	public Posts getPosts(String postID) {
		return postsDAO.getPosts(postID);
	}
	public boolean updatePosts(Posts post) {
		return postsDAO.updatePosts(post);
	}
	public boolean deletePosts(String postID) {
		return postsDAO.deletePosts(postID);
	}
	public ArrayList<Posts> getListPosts(String category) {
		return postsDAO.getListPosts(category);
	}
	public ArrayList<Posts> getListPosts(String category, int page) {
		return postsDAO.getListPosts(category,page);
	}
	public int getTotalPage(String category) {
		return postsDAO.getTotalPage(category);
	}
}

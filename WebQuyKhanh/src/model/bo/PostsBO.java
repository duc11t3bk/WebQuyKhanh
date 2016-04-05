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
	public ArrayList<Posts> getListPosts(int priority, String teacherID) {
		return postsDAO.getListPosts(priority,teacherID);
	}
	public Posts getPosts(String postID) {
		return postsDAO.getPosts(postID);
	}
	
}

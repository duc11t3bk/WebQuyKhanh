package model.bo;

import model.bean.Posts;
import model.dao.PostsDAO;

public class PostsBO {

	private PostsDAO postsDAO;
	public PostsBO(){
		postsDAO= new PostsDAO();
	}
	public boolean addNewPosts(Posts posts) {
		
		return false;
	}
	
}

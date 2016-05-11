package model.bo;

import java.util.ArrayList;

import model.bean.Posts;
import model.dao.HomeDAO;

public class HomeBO {
	
	private HomeDAO homeDAO;
	public HomeBO(){
		homeDAO= new HomeDAO();
	}
	public ArrayList<Posts> getListPostsNews() {
		return homeDAO.getListPostsNews();
	}
	public ArrayList<Posts> getListPost(String category, int limit) {
		return homeDAO.getListPost(category,limit);
	}
	
}
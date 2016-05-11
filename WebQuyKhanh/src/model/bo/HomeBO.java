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
	public ArrayList<ArrayList<Posts>> divideList(ArrayList<Posts> listPostsStudyAbroad, int numberPosts) {
		ArrayList<ArrayList<Posts>> listParent= new ArrayList<ArrayList<Posts>>();
		ArrayList<Posts> listChild= new ArrayList<Posts>();;
		for(int i=0; i<listPostsStudyAbroad.size(); i++){
			if(listChild.size()==numberPosts){
				listParent.add(listChild);
				listChild= new ArrayList<Posts>();
			}
			listChild.add(listPostsStudyAbroad.get(i));
		}
		listParent.add(listChild);
		System.out.println("number child"+listParent.size());
		return listParent;
	}
	
}

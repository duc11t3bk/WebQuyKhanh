package model.bo;

import java.util.ArrayList;

import model.bean.Posts;
import model.bean.Teacher;
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
	public ArrayList<ArrayList<Posts>> divideListPosts(ArrayList<Posts> listPostsStudyAbroad, int numberPosts) {
		ArrayList<ArrayList<Posts> > listParent= new ArrayList<ArrayList<Posts>>();
		ArrayList<Posts> listChild= new ArrayList<Posts>();;
		for(int i=0; i<listPostsStudyAbroad.size(); i++){
			if(listChild.size()==numberPosts){
				listParent.add(listChild);
				listChild= new ArrayList<Posts>();
			}
			listChild.add(listPostsStudyAbroad.get(i));
		}
		listParent.add(listChild);
		return listParent;
	}
	public ArrayList<ArrayList<Teacher>> divideListTeacher(ArrayList<Teacher> listTeacher, int numberTeacher){
		ArrayList<ArrayList<Teacher> > listParent= new ArrayList<ArrayList<Teacher>>();
		ArrayList<Teacher> listChild= new ArrayList<Teacher>();;
		for(int i=0; i<listTeacher.size(); i++){
			if(listChild.size()==numberTeacher){
				listParent.add(listChild);
				listChild= new ArrayList<Teacher>();
			}
			listChild.add(listTeacher.get(i));
		}
		listParent.add(listChild);
		return listParent;
	}
	public String getBanner(String status) {
		return homeDAO.getBanner(status);
	}
}

package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Posts;

public class HomeForm extends ActionForm {

	private ArrayList<Posts> listPostsNews;
	private ArrayList<ArrayList<Posts>> listPostsStudyAbroad;
	private ArrayList<Posts> listPostsJapaneseClass;
	private ArrayList<Posts> listPostsRecruitment;
	private ArrayList<Posts> listPostsDocument;
	public ArrayList<Posts> getListPostsNews() {
		return listPostsNews;
	}
	public void setListPostsNews(ArrayList<Posts> listPostsNews) {
		this.listPostsNews = listPostsNews;
	}
	public ArrayList<ArrayList<Posts>> getListPostsStudyAbroad() {
		return listPostsStudyAbroad;
	}
	public void setListPostsStudyAbroad(ArrayList<ArrayList<Posts>> listPostsStudyAbroad) {
		this.listPostsStudyAbroad = listPostsStudyAbroad;
	}
	public ArrayList<Posts> getListPostsJapaneseClass() {
		return listPostsJapaneseClass;
	}
	public void setListPostsJapaneseClass(ArrayList<Posts> listPostsJapaneseClass) {
		this.listPostsJapaneseClass = listPostsJapaneseClass;
	}
	public ArrayList<Posts> getListPostsRecruitment() {
		return listPostsRecruitment;
	}
	public void setListPostsRecruitment(ArrayList<Posts> listPostsRecruitment) {
		this.listPostsRecruitment = listPostsRecruitment;
	}
	public ArrayList<Posts> getListPostsDocument() {
		return listPostsDocument;
	}
	public void setListPostsDocument(ArrayList<Posts> listPostsDocument) {
		this.listPostsDocument = listPostsDocument;
	}
}

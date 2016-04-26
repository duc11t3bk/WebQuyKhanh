package form;

import java.util.ArrayList;
import java.util.Date;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import model.bean.Posts;

public class PostsForm extends ActionForm {

	private String postID;
	private String teacherID;
	private String teacherName;
	private String title;
	private String content;
	private String datePosted;
	private String image;
	private int	views;
	private String category;
	private Posts post;
	private FormFile file;
	private String submit;
	private String titleError;
	private String contentError;
	private ArrayList<Posts> posts;
	private String action;
	private String notification;
	private String group;
	
	
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Posts getPost() {
		return post;
	}
	public void setPost(Posts post) {
		this.post = post;
	}
	public ArrayList<Posts> getPosts() {
		return posts;
	}
	public void setPosts(ArrayList<Posts> posts) {
		this.posts = posts;
	}
	public String getTitleError() {
		return titleError;
	}
	public void setTitleError(String titleError) {
		this.titleError = titleError;
	}
	public String getContentError() {
		return contentError;
	}
	public void setContentError(String contentError) {
		this.contentError = contentError;
	}
	public String getDatePosted() {
		return datePosted;
	}
	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
	}
	public String getPostID() {
		return postID;
	}
	public void setPostID(String postID) {
		this.postID = postID;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}

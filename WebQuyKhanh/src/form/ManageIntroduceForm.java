package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import model.bean.Image;

public class ManageIntroduceForm extends ActionForm {

	private String imgID;
	private String imgName;
	private Image image;
	private ArrayList<Image> images;
	private FormFile file;
	private String submit;
	private String notifySuccess;
	private String notifyFailed;
	private String leftBanner;
	private String rightBanner;
	
	
	public String getLeftBanner() {
		return leftBanner;
	}
	public void setLeftBanner(String leftBanner) {
		this.leftBanner = leftBanner;
	}
	public String getRightBanner() {
		return rightBanner;
	}
	public void setRightBanner(String rightBanner) {
		this.rightBanner = rightBanner;
	}
	public String getNotifySuccess() {
		return notifySuccess;
	}
	public void setNotifySuccess(String notifySuccess) {
		this.notifySuccess = notifySuccess;
	}
	public String getNotifyFailed() {
		return notifyFailed;
	}
	public void setNotifyFailed(String notifyFailed) {
		this.notifyFailed = notifyFailed;
	}
	public String getImgID() {
		return imgID;
	}
	public void setImgID(String imgID) {
		this.imgID = imgID;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	public ArrayList<Image> getImages() {
		return images;
	}
	public void setImages(ArrayList<Image> images) {
		this.images = images;
	}
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	
	
}

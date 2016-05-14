package model.bo;

import java.util.ArrayList;

import model.bean.Image;
import model.dao.ManageIntroduceDAO;

public class ManageIntroduceBO {

	private ManageIntroduceDAO manageIntroduceDAO;
	public ManageIntroduceBO(){
		manageIntroduceDAO= new ManageIntroduceDAO();
	}
	public ArrayList<Image> getListImage() {
		return manageIntroduceDAO.getListImage();
	}
	public boolean addNewImage(String imageName) {
		return manageIntroduceDAO.addNewImage(imageName);
	}
	public boolean updateBanner(String imageID, String status) {
		return manageIntroduceDAO.updateBanner(imageID,status);
	}

}

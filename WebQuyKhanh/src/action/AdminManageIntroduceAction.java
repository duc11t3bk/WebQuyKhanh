package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import common.FileProcess;
import common.StringProcess;
import form.ManageIntroduceForm;
import model.bean.Image;
import model.bo.ManageIntroduceBO;

public class AdminManageIntroduceAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ManageIntroduceForm manageIntroduceForm=(ManageIntroduceForm) form;
		ManageIntroduceBO manageIntroduceBO= new ManageIntroduceBO();
		String submit= StringProcess.toUTF8(manageIntroduceForm.getSubmit());
		System.out.println("submit"+manageIntroduceForm.getSubmit());
		System.out.println("submit"+StringProcess.toUTF8(manageIntroduceForm.getSubmit()));
		if("Tải lên".equals(submit)){
			FormFile file=manageIntroduceForm.getFile();
			String imageName=FileProcess.uploadFile(file, getServlet(), "image");
			if(imageName!=null){
				if(manageIntroduceBO.addNewImage(imageName)){
					manageIntroduceForm.setNotifySuccess("Tải lên thành công !");
				}
				else{
					manageIntroduceForm.setNotifyFailed("Tải lên thất bại !");
				}
			}
			else{
				manageIntroduceForm.setNotifyFailed("Bạn chưa chọn ảnh !");
			}
		}
		if("Lưu".equals(submit)){
			String leftBanner=manageIntroduceForm.getLeftBanner();
			String rightBanner=manageIntroduceForm.getRightBanner();
			if(manageIntroduceBO.updateBanner(leftBanner,"left")&&
			manageIntroduceBO.updateBanner(rightBanner,"right")){
				manageIntroduceForm.setNotifySuccess("Cập nhật banner thành công !");
			}
			else{
				manageIntroduceForm.setNotifyFailed("Cập nhật banner thất bại !");
			}
		}
		ArrayList<Image> images=manageIntroduceBO.getListImage();
		manageIntroduceForm.setImages(images);
		return mapping.findForward("showPageManageIntroduce");
	}
}

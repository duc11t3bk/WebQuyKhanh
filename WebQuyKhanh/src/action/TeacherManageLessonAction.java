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
import common.Validate;
import form.JapaneseForm;
import model.bo.JapaneseBO;

public class TeacherManageLessonAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JapaneseForm japaneseForm= (JapaneseForm)form;
		JapaneseBO japaneseBO= new JapaneseBO();
		String lessonID=japaneseForm.getLessonID();
		String action=japaneseForm.getAction();
		String submit=japaneseForm.getSubmit();
		if("Tải lên".equals(StringProcess.toUTF8(japaneseForm.getSubmit()))){
			FormFile fileExcel= japaneseForm.getFileExcel();
			ArrayList<FormFile> filesAudio=japaneseForm.getFilesAudio();
			if("vocabulary".equals(action)){
				if ((!Validate.isEmpty(fileExcel.getFileName()))
						&& (!Validate.isEmpty(filesAudio.get(0).getFileName()))) {
					String fileExcelName = FileProcess.uploadFile(fileExcel, getServlet(), "japanese/excel");
					String filePath = "/home/davy/Git/WebQuyKhanh/WebContent/japanese/excel/" + fileExcelName;
					// String fileExcelName=FileProcess.uploadFile(fileExcel,
					// getServlet(), "japanese\\excel");
					// String
					// filePath="C:\\Users\\viettel\\Documents\\gitspace\\WebQuyKhanh\\WebQuyKhanh\\WebContent\\japanese\\excel\\"+fileExcelName;
					/** upload file excel */
					japaneseBO.importFileExcel(lessonID, filePath);
					/** delete file excel after import data */
					FileProcess.deleteOldFile(getServlet(), fileExcelName, "japanese/excel");
					/** delete file audio */
					ArrayList<String> oldFilesAudio = japaneseBO.getFilesAudio(lessonID);
					for (int i = 0; i < oldFilesAudio.size(); i++) {
						FileProcess.deleteOldFile(getServlet(), oldFilesAudio.get(i), "japanese/audio/" + lessonID);
					}
					FileProcess.deleteOldFile(getServlet(), lessonID, "japanese/audio");
					/** upload file audio */
					for (int i = 0; i < filesAudio.size(); i++) {
						FileProcess.uploadFile(filesAudio.get(i), getServlet(), "japanese/audio/" + lessonID);
					}
					japaneseForm.setNotifySuccess("Tải lên thành công");
				} else {
					japaneseForm.setNotifyError("Bạn phải chọn file để tải lên !");
				}
			}
			else{
				if("translate".equals(action)){
					if(!Validate.isEmpty(fileExcel.getFileName())){
						String fileExcelName=FileProcess.uploadFile(fileExcel, getServlet(), "japanese/excel");
						String filePath = "/home/davy/Git/WebQuyKhanh/WebContent/japanese/excel/" + fileExcelName;
						japaneseBO.importFileExcel(lessonID, filePath);
						FileProcess.deleteOldFile(getServlet(), fileExcelName, "japanese/excel");
						japaneseForm.setNotifySuccess("Tải lên thành công");
					}
					else{
						japaneseForm.setNotifyError("Bạn phải chọn file để tải lên !");
					}
				}
			}
		}
		if("Xóa".equals(submit)){	
			if("vocabulary".equals(action)){
				/**delete file audio */
				ArrayList<String> oldFilesAudio=japaneseBO.getFilesAudio(lessonID);
				for(int i=0; i<oldFilesAudio.size(); i++){
					System.out.println(""+oldFilesAudio.get(i));
					FileProcess.deleteOldFile(getServlet(), oldFilesAudio.get(i), "japanese/audio/"+lessonID);
				}
				FileProcess.deleteOldFile(getServlet(), lessonID, "japanese/audio");
				/**delete data from database*/
				japaneseBO.deleteLesson(lessonID);
				return mapping.findForward("showListLevelVocabulary");
			}
			else 
				if("translate".equals(action)){
					japaneseBO.deleteLesson(lessonID);
					return mapping.findForward("showListLevelTranslate");
			}
		}
		japaneseForm.setLesson(japaneseBO.getLesson(lessonID));
		japaneseForm.setListData(japaneseBO.getListData(lessonID));
		return mapping.findForward("showLesson");
	}
}

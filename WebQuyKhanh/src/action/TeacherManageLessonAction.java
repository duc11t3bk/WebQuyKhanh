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
			if(!Validate.isEmpty(fileExcel.getFileName())&&(filesAudio.size()!=0)){
				String fileExcelName=FileProcess.uploadFile(fileExcel, getServlet(), "japanese/excel");
				String filePath="/home/davy/Git/WebQuyKhanh/WebContent/japanese/excel/"+fileExcelName;
				System.out.println("filePath= "+filePath);
				/**upload file excel*/
				japaneseBO.importFileExcel(lessonID,filePath);
				FileProcess.deleteOldFile(getServlet(), fileExcelName, "japanese/excel");
				/**delete file audio*/
				ArrayList<String> filesAudioOld=japaneseBO.getFilesAudio(lessonID);
				for(int i=0; i<filesAudioOld.size(); i++){
					FileProcess.deleteOldFile(getServlet(), filesAudioOld.get(i), "japanese/audio/"+lessonID);
				}
				FileProcess.deleteOldFile(getServlet(), lessonID, "japanese/audio");
				/**upload file audio*/
				for(int i=0; i<filesAudio.size(); i++){
					FileProcess.uploadFile(filesAudio.get(i), getServlet(), "japanese/audio/"+lessonID);
				}
			}
		}
		if("Xóa".equals(submit)){
			japaneseBO.deleteLesson(lessonID);
			if("vocabulary".equals(action)){
				ArrayList<String> filesAudio=japaneseBO.getFilesAudio(lessonID);
				for(int i=0; i<filesAudio.size(); i++){
					FileProcess.deleteOldFile(getServlet(), filesAudio.get(i), "japanese/audio/"+lessonID);
				}
				FileProcess.deleteOldFile(getServlet(), lessonID, "japanese/audio");
				return mapping.findForward("showListLevelVocabulary");
			}
			else 
				if("translate".equals(action)){
					return mapping.findForward("showListLevelTranslate");
			}
		}
		japaneseForm.setLesson(japaneseBO.getLesson(lessonID));
		japaneseForm.setListData(japaneseBO.getListData(lessonID));
		return mapping.findForward("showLesson");
	}
}

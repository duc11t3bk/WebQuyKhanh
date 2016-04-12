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
		if("Tải lên".equals(japaneseForm.getSubmit())){
			FormFile fileExcel= japaneseForm.getFileExcel();
			FormFile[] fileAudio=japaneseForm.getFileAudio();
			
			System.out.println(""+fileAudio[0].getFileName());
			
			if(!Validate.isEmpty(fileExcel.getFileName())){
				String fileExcelName=FileProcess.uploadFile(fileExcel, getServlet(), "japanese/excel");
				String filePath="/home/davy/Git/WebQuyKhanh/WebContent/japanese/excel/"+fileExcelName;
				System.out.println("filePath= "+filePath);
				japaneseBO.importFileExcel(lessonID,filePath);
			}
		}
		if("Xóa".equals(submit)){
			japaneseBO.deleteLesson(lessonID);
			if("vocabulary".equals(action)){
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

package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.JapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.LessonStatus;
import model.bean.WordStatus;
import model.bo.JapaneseBO;

public class MemberManageLesson extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		String memberID= loginForm.getMember().getMemberID();
		JapaneseForm japaneseForm=(JapaneseForm)form;
		JapaneseBO japaneseBO= new JapaneseBO();
		String lessonID=japaneseForm.getLessonID();
		System.out.println("lesson ID"+lessonID);
		Lesson lesson= japaneseBO.getLesson(lessonID);
		LessonStatus lessonStatus=japaneseBO.getLessonStatus(memberID,lessonID);
		ArrayList<JapaneseData> listData= japaneseBO.getListData(lessonID);
		japaneseForm.setLesson(lesson);
		japaneseForm.setLessonStatus(lessonStatus);
		japaneseForm.setListData(listData);
		if("voca".equals(lesson.getCategory())){
			ArrayList<WordStatus> wordStatus= japaneseBO.getListWordStatus(memberID, lessonID);
			japaneseForm.setListWordStatus(wordStatus);
		}
		if("tran".equals(lesson.getCategory())){
			
		}
		return mapping.findForward("showLessonData");
	}
}

package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.JapaneseForm;
import model.bean.Lesson;
import model.bean.Level;
import model.bo.HomeBO;
import model.bo.JapaneseBO;

public class MemberManageLevel extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JapaneseForm japaneseForm = (JapaneseForm) form;
		String action = japaneseForm.getAction();
		JapaneseBO japaneseBO = new JapaneseBO();
		HomeBO homeBO= new HomeBO();
		ArrayList<Level> listLevel = japaneseBO.getListLevel(action);
		ArrayList<Lesson> listLesson = japaneseBO.getListLesson(action);
		japaneseForm.setListLevel(listLevel);
		japaneseForm.setListLesson(listLesson);
		japaneseForm.setListPostsNews(homeBO.getListPostsNews());
		return mapping.findForward("showListLevel");
	}
}

package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import form.JapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.LessonStatus;
import model.bean.WordStatus;
import model.bo.JapaneseBO;

public class MemberManageLesson extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		String memberID= loginForm.getMember().getMemberID();
		JapaneseForm japaneseForm=(JapaneseForm)form;
		JapaneseBO japaneseBO= new JapaneseBO();
		String lessonID=japaneseForm.getLessonID();
		String learnOption=japaneseForm.getLearnOption();
		System.out.println("lesson ID"+lessonID);
		System.out.println("learn option"+learnOption);
		Lesson lesson= japaneseBO.getLesson(lessonID);
		LessonStatus lessonStatus=japaneseBO.getLessonStatus(memberID,lessonID);
		ArrayList<JapaneseData> listData= japaneseBO.getListData(lessonID);
		japaneseForm.setLesson(lesson);
		lessonStatus.setComplete(lessonStatus.getComplete()*100/lesson.getTotalData());
		japaneseForm.setLessonStatus(lessonStatus);
		japaneseForm.setListData(listData);
		ArrayList<WordStatus> wordStatus= japaneseBO.getListWordStatus(memberID, lessonID);
		japaneseForm.setListWordStatus(wordStatus);
		if("voca".equals(lesson.getCategory())){
			japaneseForm.setAction("vocabulary");
			if("review".equals(learnOption)){
				boolean checkReviewVocabulary=japaneseBO.checkReviewVocabulary(memberID,lessonID);
				JSONArray jsonArray= new JSONArray();
				JSONObject jsonObjectChild= new JSONObject();
				if(checkReviewVocabulary){
					jsonObjectChild.put("result", "can_review");
				}
				else{
					jsonObjectChild.put("result", "cant_review");
					jsonObjectChild.put("message", "Bạn phải học thuộc ít nhất năm từ trước khi ôn tập !");
				}
				jsonArray.add(jsonObjectChild);
				PrintWriter write= response.getWriter();
				write.println(jsonArray.toString());
				write.flush();
				write.close();
				return null;
			}
		}
		if("tran".equals(lesson.getCategory())){
			japaneseForm.setAction("translate");
			if("review".equals(learnOption)){
				boolean checkReviewTranslate=japaneseBO.checkReviewTranslate(memberID,lessonID);
				JSONArray jsonArray= new JSONArray();
				JSONObject jsonObject= new JSONObject();
				if(checkReviewTranslate){
					jsonObject.put("result", "can_review");
				}
				else{
					jsonObject.put("result", "cant_review");
					jsonObject.put("message", "Bạn phải hoàn thành ít nhất một câu trước khi ôn tập !");
				}
				jsonArray.add(jsonObject);
				PrintWriter write=response.getWriter();
				write.println(jsonArray.toString());
				write.flush();
				write.close();
				return null;
			}
		}
		return mapping.findForward("showLessonData");
	}
}

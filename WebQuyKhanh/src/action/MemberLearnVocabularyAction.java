package action;

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
import form.LearnJapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bo.LearnJapaneseBO;

public class MemberLearnVocabularyAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		LearnJapaneseForm learnJapaneseForm=(LearnJapaneseForm)form;
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		String lessonID= learnJapaneseForm.getLessonID();
		String memberID= loginForm.getMember().getMemberID();
		LearnJapaneseBO learnJapaneseBO= new LearnJapaneseBO();
		ArrayList<JapaneseData> listNewWords= learnJapaneseBO.getListNewWords(memberID, lessonID);
		JSONObject jsonObject= new JSONObject();
		/**five word need to learn*/
		JSONArray jsonArrayPrimaryWord= new JSONArray();
		/**three word use to answer*/
		JSONArray jsonArrayExtraWord= new JSONArray();
		for(int i=0; i<listNewWords.size(); i++){
			JSONObject jsonObjectChild= new JSONObject();
			jsonObjectChild.put("data_id", listNewWords.get(i).getDataID());
			jsonObjectChild.put("lesson_id", listNewWords.get(i).getLessonID());
			jsonObjectChild.put("level_id",listNewWords.get(i).getLevelID());
			jsonObjectChild.put("japanese", listNewWords.get(i).getJapanese());
			jsonObjectChild.put("vietnamese", listNewWords.get(i).getVietnamese());
			jsonObjectChild.put("audio", listNewWords.get(i).getDataSound());
			if(i<5){
				jsonArrayPrimaryWord.add(jsonObjectChild);
			}
			else{
				jsonArrayExtraWord.add(jsonObjectChild);
			}
		}
		jsonObject.put("primary_word", jsonArrayPrimaryWord);
		jsonObject.put("extra_word", jsonArrayExtraWord);
		System.out.println(""+jsonObject.toString());
		learnJapaneseForm.setDataResponse(jsonObject.toString());
		return mapping.findForward("startLearning");
	}
}

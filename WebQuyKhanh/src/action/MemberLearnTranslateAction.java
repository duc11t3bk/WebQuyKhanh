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
import org.json.simple.parser.JSONParser;

import form.LearnJapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bo.JapaneseBO;
import model.bo.LearnJapaneseBO;

public class MemberLearnTranslateAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		LearnJapaneseForm learnJapaneseForm=(LearnJapaneseForm)form;
		String memberID=loginForm.getMember().getMemberID();
		String lessonID=learnJapaneseForm.getLessonID();
		String dataReceive=learnJapaneseForm.getDataReceive();
		LearnJapaneseBO learnJapaneseBO= new LearnJapaneseBO();
		JapaneseBO japaneseBO= new JapaneseBO();
		if(dataReceive==null){
			ArrayList<JapaneseData> sentences=learnJapaneseBO.getListSentences(memberID,lessonID);
			JSONArray jsonArray= new JSONArray();
			JSONObject jsonObject= new JSONObject();
			for(int i=0; i<sentences.size(); i++){
				JSONObject jsonObjectChild= new JSONObject();
				jsonObjectChild.put("data_id", sentences.get(i).getDataID());
				jsonObjectChild.put("lesson_id", sentences.get(i).getLessonID());
				jsonObjectChild.put("level_id", sentences.get(i).getLevelID());
				jsonObjectChild.put("japanese", sentences.get(i).getJapanese());
				jsonObjectChild.put("vietnamese", sentences.get(i).getVietnamese());
				jsonArray.add(jsonObjectChild);
			}
			jsonObject.put("sentences", jsonArray);
			learnJapaneseForm.setDataResponse(jsonObject.toString());
			learnJapaneseForm.setListData(sentences);
			learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
			return mapping.findForward("startTranslate");
		}
		else{
			System.out.println(""+dataReceive);
			JSONParser jsonParser= new JSONParser();
			JSONArray jsonArray=(JSONArray)jsonParser.parse(dataReceive);
			ArrayList<JapaneseData> listData= new ArrayList<JapaneseData>();
			for(int i=0; i<jsonArray.size(); i++){
				JSONObject jsonObject=(JSONObject)jsonArray.get(i);
				JapaneseData japaneseData= new JapaneseData();
				/**continuew */
			}
			return mapping.findForward("finishTranslate");
		}
	}

}

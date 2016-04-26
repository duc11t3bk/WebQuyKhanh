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

import common.StringProcess;
import form.LearnJapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bean.WordStatus;
import model.bo.JapaneseBO;
import model.bo.LearnJapaneseBO;

public class MemberLearnTranslateAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		LearnJapaneseForm learnJapaneseForm = (LearnJapaneseForm) form;
		String memberID = loginForm.getMember().getMemberID();
		String lessonID = learnJapaneseForm.getLessonID();
		String dataReceive = learnJapaneseForm.getDataReceive();
		String learnOption=learnJapaneseForm.getLearnOption();
		LearnJapaneseBO learnJapaneseBO = new LearnJapaneseBO();
		JapaneseBO japaneseBO = new JapaneseBO();
		if (dataReceive == null) {
			if("learn".equals(learnOption)){
				ArrayList<JapaneseData> sentences = learnJapaneseBO.getListSentences(memberID, lessonID);
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				for (int i = 0; i < sentences.size(); i++) {
					JSONObject jsonObjectChild = new JSONObject();
					jsonObjectChild.put("data_id", sentences.get(i).getDataID());
					jsonObjectChild.put("lesson_id", sentences.get(i).getLessonID());
					jsonObjectChild.put("level_id", sentences.get(i).getLevelID());
					jsonObjectChild.put("japanese", sentences.get(i).getJapanese());
					jsonObjectChild.put("vietnamese", sentences.get(i).getVietnamese());
					jsonArray.add(jsonObjectChild);
				}
				jsonObject.put("sentences", jsonArray);
				learnJapaneseForm.setDataResponse(jsonObject.toString());
				learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
				return mapping.findForward("startTranslate");
			}
			else{
				/**
				 * learnOption= review
				 * */
				ArrayList<JapaneseData> sentencesReview=learnJapaneseBO.getListReview(memberID, lessonID);
				JSONArray jsonArray= new JSONArray();
				JSONObject jsonObject= new JSONObject();
				for(int i=0; i<sentencesReview.size(); i++){
					JSONObject jsonObjectChild= new JSONObject();
					jsonObjectChild.put("data_id", sentencesReview.get(i).getDataID());
					jsonObjectChild.put("lesson_id", sentencesReview.get(i).getLessonID());
					jsonObjectChild.put("level_id", sentencesReview.get(i).getLevelID());
					jsonObjectChild.put("japanese", sentencesReview.get(i).getJapanese());
					jsonObjectChild.put("vietnamese", sentencesReview.get(i).getVietnamese());
					jsonArray.add(jsonObjectChild);
				}
				jsonObject.put("sentences", jsonArray);
				learnJapaneseForm.setDataResponse(jsonObject.toString());
				learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
				return mapping.findForward("startReview");
			}
		} else {
			/**
			 * finish translate
			 * */
			System.out.println("" + dataReceive);
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(dataReceive);
			ArrayList<JapaneseData> listData = new ArrayList<JapaneseData>();
			ArrayList<WordStatus> listWordStatus = new ArrayList<WordStatus>();
			int totalComplete = 0;
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				JapaneseData japaneseData = new JapaneseData();
				WordStatus wordStatus = new WordStatus();
				japaneseData.setDataID(jsonObject.get("data_id").toString());
				japaneseData.setJapanese(StringProcess.toUTF8(jsonObject.get("japanese").toString()));
				japaneseData.setVietnamese(StringProcess.toUTF8(jsonObject.get("vietnamese").toString()));
				wordStatus.setDataID(jsonObject.get("data_id").toString());
				wordStatus.setAccuracy(Integer.valueOf(jsonObject.get("complete").toString()));
				wordStatus.setMemberID(memberID);
				totalComplete += wordStatus.getAccuracy();
				listData.add(japaneseData);
				listWordStatus.add(wordStatus);
			}
			if("learn".equals(learnOption)){
				if ((!learnJapaneseBO.updateWordStatus(listWordStatus)
						|| (!learnJapaneseBO.updateLessonStatus(listWordStatus, memberID, lessonID)))) {
					return mapping.findForward("occurError");
				}
			}
			for (int i = 0; i < listWordStatus.size(); i++) {
				listWordStatus.get(i).setAccuracy(StringProcess.convertAccuracy(listWordStatus.get(i).getAccuracy()));
			}
			learnJapaneseForm.setTotalQuestion(listData.size());
			learnJapaneseForm.setTrueAnswers(totalComplete/5);
			learnJapaneseForm.setAccuracy((totalComplete*100/5)/(listData.size()));
			learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
			learnJapaneseForm.setListData(listData);
			learnJapaneseForm.setListWordStatus(listWordStatus);
			return mapping.findForward("finishTranslate");
		}
	}

}

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
import form.JapaneseForm;
import form.LearnJapaneseForm;
import form.LoginForm;
import model.bean.JapaneseData;
import model.bean.WordStatus;
import model.bo.JapaneseBO;
import model.bo.LearnJapaneseBO;

public class MemberLearnVocabularyAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		LearnJapaneseForm learnJapaneseForm = (LearnJapaneseForm) form;
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		String lessonID = learnJapaneseForm.getLessonID();
		String learnOption= learnJapaneseForm.getLearnOption();
		String memberID = loginForm.getMember().getMemberID();
		LearnJapaneseBO learnJapaneseBO = new LearnJapaneseBO();
		JapaneseBO japaneseBO= new JapaneseBO();
		String dataReceive = learnJapaneseForm.getDataReceive();
		if (dataReceive == null) {
			if("learn".equals(learnOption)){
				ArrayList<JapaneseData> listNewWords = learnJapaneseBO.getListNewWords(memberID, lessonID);
				JSONObject jsonObject = new JSONObject();
				/** five word need to learn */
				JSONArray jsonArrayPrimaryWord = new JSONArray();
				/** three word use to answer */
				JSONArray jsonArrayExtraWord = new JSONArray();
				for (int i = 0; i < listNewWords.size(); i++) {
					JSONObject jsonObjectChild = new JSONObject();
					jsonObjectChild.put("data_id", listNewWords.get(i).getDataID());
					jsonObjectChild.put("lesson_id", listNewWords.get(i).getLessonID());
					jsonObjectChild.put("level_id", listNewWords.get(i).getLevelID());
					jsonObjectChild.put("japanese", listNewWords.get(i).getJapanese());
					jsonObjectChild.put("vietnamese", listNewWords.get(i).getVietnamese());
					jsonObjectChild.put("audio", listNewWords.get(i).getDataSound());
					if (i < 5) {
						jsonArrayPrimaryWord.add(jsonObjectChild);
					} else {
						jsonArrayExtraWord.add(jsonObjectChild);
					}
				}
				jsonObject.put("primary_word", jsonArrayPrimaryWord);
				jsonObject.put("extra_word", jsonArrayExtraWord);
				System.out.println("" + jsonObject.toString());
				learnJapaneseForm.setDataResponse(jsonObject.toString());
				learnJapaneseForm.setLessonID(lessonID);
				learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
				return mapping.findForward("startLearning");
			}
			else{
				/**
				 * learnOption=review
				 * 
				 * */
				ArrayList<JapaneseData> listReview= learnJapaneseBO.getListReview(memberID, lessonID);
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject= new JSONObject();
				for(int i=0; i<listReview.size(); i++){
					JSONObject jsonObjectChild= new JSONObject();
					jsonObjectChild.put("data_id", listReview.get(i).getDataID());
					jsonObjectChild.put("lesson_id", listReview.get(i).getLessonID());
					jsonObjectChild.put("level_id", listReview.get(i).getLevelID());
					jsonObjectChild.put("japanese", listReview.get(i).getJapanese());
					jsonObjectChild.put("vietnamese", listReview.get(i).getVietnamese());
					jsonObjectChild.put("audio", listReview.get(i).getDataSound());
					jsonArray.add(jsonObjectChild);
				}
				jsonObject.put("review_word", jsonArray);
				learnJapaneseForm.setDataResponse(jsonObject.toString());
				learnJapaneseForm.setLessonID(lessonID);
				learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
				return mapping.findForward("startReviewing");
			}
		} else {
			/**
			 * data receive !=null 
			 * */
			System.out.println("" + dataReceive);
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(dataReceive);
			ArrayList<WordStatus> listWordStatus = new ArrayList<WordStatus>();
			ArrayList<JapaneseData> listNewWords= new ArrayList<JapaneseData>();
			int trueAnswers = 0;
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				WordStatus wordStatus = new WordStatus();
				wordStatus.setDataID(jsonObject.get("data_id").toString());
				wordStatus.setMemberID(memberID);
				wordStatus.setAccuracy(Integer.valueOf(jsonObject.get("accuracy").toString()));
				listWordStatus.add(wordStatus);
				JapaneseData data= new JapaneseData();
				data.setJapanese(StringProcess.toUTF8(jsonObject.get("japanese").toString()));
				data.setVietnamese(StringProcess.toUTF8(jsonObject.get("vietnamese").toString()));
				listNewWords.add(data);
				trueAnswers += wordStatus.getAccuracy();
			}
			if("learn".equals(learnOption)){
				if ((!learnJapaneseBO.updateWordStatus(listWordStatus)) || (!learnJapaneseBO.updateLessonStatus(listWordStatus,memberID,lessonID))) {
					return mapping.findForward("occurError");
				}
			}
			for (int i = 0; i < listWordStatus.size(); i++) {
				listWordStatus.get(i).setAccuracy(StringProcess.convertAccuracy(listWordStatus.get(i).getAccuracy()));
			}
			learnJapaneseForm.setListData(listNewWords);
			learnJapaneseForm.setListWordStatus(listWordStatus);
			learnJapaneseForm.setTrueAnswers(trueAnswers);
			if("learn".equals(learnOption)){
				learnJapaneseForm.setAccuracy((trueAnswers * 100) / JapaneseData.TOTAL_QUESTIONS);
			}
			else{
				learnJapaneseForm.setAccuracy((trueAnswers*100)/(5*listNewWords.size()));
			}
			learnJapaneseForm.setLesson(japaneseBO.getLesson(lessonID));
			System.out.println("listData"+learnJapaneseForm.getListData().size());
			return mapping.findForward("finishLearning");
		}
	}
}

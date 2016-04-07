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

import common.StringProcess;
import common.Validate;
import form.JapaneseForm;
import model.bean.Lesson;
import model.bean.Level;
import model.bo.JapaneseBO;

public class TeacherManageJapaneseAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		JapaneseForm japaneseForm = (JapaneseForm) form;
		String action = japaneseForm.getAction();
		String submit = japaneseForm.getSubmit();
		if ("vocabulary".equals(action)) {
			JapaneseBO japaneseBO = new JapaneseBO();
			if(submit!=null){
				if("Tạo mục mới".equals(submit)){
					String levelName=StringProcess.toUTF8(japaneseForm.getLevelName());
					Level newLevel= new Level();
					newLevel.setLevelName(levelName);
					newLevel.setCategory("voca");
					japaneseBO.addNewLevel(newLevel);
				}
				if("Tạo bài mới".equals(submit)){
					String lessonName=StringProcess.toUTF8(japaneseForm.getLessonName());
					String levelID=japaneseForm.getLevelID();
					
				}
			}
			ArrayList<Level> listLevel = japaneseBO.getListLevel(action);
			ArrayList<Lesson> listLesson = japaneseBO.getListLesson(action);
			japaneseForm.setListLevel(listLevel);
			japaneseForm.setListLesson(listLesson);
			return mapping.findForward("showListLevel");
		}
		if ("translate".equals(action)) {
			String levelID = japaneseForm.getLevelID();
			if (levelID == null) {

				return mapping.findForward("showListLevel");
			} else {

				return mapping.findForward("showListLesson");
			}
		}
		if("checkvalidatelevel".equals(action)){
			String levelName=StringProcess.toUTF8(japaneseForm.getLevelName());
			JSONArray jsonArray=checkValidateLevel(levelName);
			PrintWriter write=response.getWriter();
			write.println(jsonArray.toString());
			return null;
		}
		return super.execute(mapping, form, request, response);
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidateLevel(String levelName){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean check=true;
		if(Validate.isEmpty(levelName)){
			check=false;
			jsonObject.put("levelNameError", "Tên mục không được bỏ trống");
		}
		if(check){
			jsonObject.put("result", "success");
			jsonArray.add(jsonObject);
		}
		else{
			jsonObject.put("result","failed");
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
}

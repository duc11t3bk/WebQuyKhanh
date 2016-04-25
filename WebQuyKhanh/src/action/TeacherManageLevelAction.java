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
import model.bean.JapaneseData;
import model.bean.Lesson;
import model.bean.Level;
import model.bo.JapaneseBO;

public class TeacherManageLevelAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		JapaneseForm japaneseForm = (JapaneseForm) form;
		String action = japaneseForm.getAction();
		String submit = StringProcess.toUTF8(japaneseForm.getSubmit());
		System.out.println("action"+action);
		System.out.println("type="+japaneseForm.getType());
		if ("vocabulary".equals(action)) {
			JapaneseBO japaneseBO = new JapaneseBO();
			String type=japaneseForm.getType();
			if(type!=null){
				if("add-level".equals(type)){
					String levelName=japaneseForm.getLevelName();
					JSONArray jsonArray=checkValidate(levelName);
					JSONObject jsonObject=(JSONObject)jsonArray.get(0);
					String result=jsonObject.get("result").toString();
					if("success".equals(result)){
						Level level= new Level();
						level.setLevelName(levelName);
						level.setCategory("voca");
						japaneseBO.addNewLevel(level);
					}
					PrintWriter write=response.getWriter();
					write.println(jsonArray.toString());
					write.flush();
					write.close();
					return null;
				}
				if("add-lesson".equals(type)){
					String lessonName=japaneseForm.getLessonName();
					String levelID= japaneseForm.getLevelID();
					JSONArray jsonArray=checkValidate(lessonName);
					JSONObject jsonObject=(JSONObject)jsonArray.get(0);
					String result=jsonObject.get("result").toString();
					if("success".equals(result)){
						Lesson lesson= new Lesson();
						lesson.setLessonName(lessonName);
						lesson.setLevelID(levelID);
						japaneseBO.addNewLesson(lesson);
					}
					PrintWriter write=response.getWriter();
					write.println(jsonArray.toString());
					write.flush();
					write.close();
					return null;
				}
				if("delete".equals(type)){
					String levelID=japaneseForm.getLevelID();
					if(!japaneseBO.deleteLevel(levelID)){
						System.out.println("xóa lỗi");
						japaneseForm.setDeleteLevelError("Bạn phải xóa các bài học trong mục trước");
					}
					System.out.println("xóa không lỗi");
				}
			}
			ArrayList<Level> listLevel = japaneseBO.getListLevel(action);
			ArrayList<Lesson> listLesson = japaneseBO.getListLesson(action);
			japaneseForm.setListLevel(listLevel);
			japaneseForm.setListLesson(listLesson);
			return mapping.findForward("showListLevel");
		}
		if ("translate".equals(action)) {
			JapaneseBO japaneseBO = new JapaneseBO();
			String type=japaneseForm.getType();
			if("add-level".equals(type)){
				String levelName=japaneseForm.getLevelName();
				JSONArray jsonArray=checkValidate(levelName);
				JSONObject jsonObject= (JSONObject)jsonArray.get(0);
				String result=jsonObject.get("result").toString();
				if("success".equals(result)){
					Level level= new Level();
					level.setLevelName(levelName);
					level.setCategory("tran");
					japaneseBO.addNewLevel(level);
				}
				PrintWriter write=response.getWriter();
				write.println(jsonArray.toString());
				write.flush();
				write.close();
				return null;
			}
			if("add-lesson".equals(type)){
				String lessonName= japaneseForm.getLessonName();
				String levelID= japaneseForm.getLevelID();
				System.out.println("lessonName= "+lessonName);
				JSONArray jsonArray= checkValidate(lessonName);
				JSONObject jsonObject= (JSONObject)jsonArray.get(0);
				String result=jsonObject.get("result").toString();
				if("success".equals(result)){
					Lesson lesson= new Lesson();
					lesson.setLessonName(lessonName);
					lesson.setLevelID(levelID);
					japaneseBO.addNewLesson(lesson);
				}
				PrintWriter write=response.getWriter();
				write.println(jsonArray.toString());
				write.flush();
				write.close();
				return null;
			}
			if("delete".equals(type)){
				String levelID=japaneseForm.getLevelID();
				if(!japaneseBO.deleteLevel(levelID)){
					japaneseForm.setDeleteLevelError("Bạn phải xóa các bài học trong mục trước");
				}
			}
			ArrayList<Level> listLevel= japaneseBO.getListLevel(action);
			ArrayList<Lesson> listLesson= japaneseBO.getListLesson(action);
			japaneseForm.setListLevel(listLevel);
			japaneseForm.setListLesson(listLesson);
			return mapping.findForward("showListLevel");
		}
		return super.execute(mapping, form, request, response);
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidate(String data){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean check=true;
		if(Validate.isEmpty(data)){
			check=false;
			jsonObject.put("message", "Tên không được bỏ trống");
		}
		if(check){
			jsonObject.put("result", "success");
			jsonObject.put("message", "Tạo mới thành công");
			jsonArray.add(jsonObject);
		}
		else{
			jsonObject.put("result","failed");
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
}

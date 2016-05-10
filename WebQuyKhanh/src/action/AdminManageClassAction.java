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
import org.json.simple.parser.JSONParser;

import common.Validate;
import form.ClassForm;
import model.bean.Class;
import model.bo.ClassBO;

public class AdminManageClassAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ClassForm classForm= (ClassForm)form;
		ClassBO classBO= new ClassBO();
		String action=classForm.getAction();

		if("add".equals(action)){
			String jsonData= classForm.getJsonData();
			JSONParser jsonParser= new JSONParser();
			JSONObject jsonObject= (JSONObject)jsonParser.parse(jsonData);
			Class myClass= new Class();
			myClass.setClassName(jsonObject.get("className").toString());
			if("".equals(jsonObject.get("classFee").toString())){
				myClass.setClassFee(0);
			}else{
				myClass.setClassFee(Integer.valueOf(jsonObject.get("classFee").toString()));
			}			
			myClass.setClassTime(jsonObject.get("classTime").toString());
			myClass.setClassRoom(jsonObject.get("classRoom").toString());
			JSONArray jsonArrayCheckValidate=checkValidate(myClass);
			JSONObject jsonObjectCheckValidate=(JSONObject)jsonArrayCheckValidate.get(0);
			String result= jsonObjectCheckValidate.get("result").toString();
			if("success".equals(result)){
				classBO.addNewClass(myClass);
			}
			PrintWriter write=response.getWriter();
			write.println(""+jsonArrayCheckValidate.toString());
			write.flush();
			write.close();
			return null;
		}
		if("view".equals(action)){
			String classID= classForm.getClassID();
			Class myClass= classBO.getClass(classID);
			JSONObject jsonObjectClass= new JSONObject();
			jsonObjectClass.put("classID", myClass.getClassID());
			jsonObjectClass.put("className", myClass.getClassName());
			jsonObjectClass.put("classFee", myClass.getClassFee());
			jsonObjectClass.put("classTime", myClass.getClassTime());
			jsonObjectClass.put("classRoom", myClass.getClassRoom());
			PrintWriter write=response.getWriter();
			write.println(""+jsonObjectClass.toString());
			write.flush();
			write.close();
			return null;
		}
		if("update".equals(action)){
			String jsonData=classForm.getJsonData();
			JSONParser jsonParser= new JSONParser();
			JSONObject jsonObject= (JSONObject)jsonParser.parse(jsonData);
			Class myClass= new Class();
			myClass.setClassID(jsonObject.get("classID").toString());
			myClass.setClassName(jsonObject.get("className").toString());
			if("".equals(jsonObject.get("classFee").toString())){
				myClass.setClassFee(0);
			}else{
				myClass.setClassFee(Integer.valueOf(jsonObject.get("classFee").toString()));
			}			
			myClass.setClassTime(jsonObject.get("classTime").toString());
			myClass.setClassRoom(jsonObject.get("classRoom").toString());
			JSONArray jsonArrayCheckValidate=checkValidate(myClass);
			JSONObject jsonObjectCheckValidate=(JSONObject)jsonArrayCheckValidate.get(0);
			String result= jsonObjectCheckValidate.get("result").toString();
			if("success".equals(result)){
				classBO.updateClass(myClass);
			}
			PrintWriter write=response.getWriter();
			write.println(""+jsonArrayCheckValidate.toString());
			write.flush();
			write.close();
			return null;
		}
		if("delete".equals(action)){
			String classID= classForm.getClassID();
			if(!classBO.deleteClass(classID)){
				return mapping.findForward("occurError");
			}
		}
		ArrayList<Class> listClass= classBO.getListClass();
		classForm.setListClass(listClass);
		return mapping.findForward("showListClass");
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidate(Class myClass){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean checkValidate=true;
		if(Validate.isEmpty(myClass.getClassName())){
			checkValidate=false;
			jsonObject.put("classNameError", "Tên lớp không được để trống !");
		}
		if(myClass.getClassFee()==0){
			checkValidate=false;
			jsonObject.put("classFeeError", "Bạn chưa nhập học phí cho lớp này !");
		}
		if(Validate.isEmpty(myClass.getClassTime())){
			checkValidate=false;
			jsonObject.put("classTimeError", "Bạn chưa nhập thời gian học !");
		}
		if(Validate.isEmpty(myClass.getClassRoom())){
			checkValidate=false;
			jsonObject.put("classRoomError", "Bạn chưa chọn phòng học !");
		}
		if(checkValidate){
			jsonObject.put("result", "success");
			jsonArray.add(jsonObject);
		}
		else{
			jsonObject.put("result", "failed");
			jsonArray.add(jsonObject);
		}
		return jsonArray;		
	}
}

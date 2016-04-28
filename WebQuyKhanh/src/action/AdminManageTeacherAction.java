package action;

import java.io.PrintWriter;

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
import common.Validate;
import form.TeacherForm;
import model.bean.Member;
import model.bean.Teacher;
import model.bo.MemberBO;
import model.bo.TeacherBO;

public class AdminManageTeacherAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		TeacherForm teacherForm= (TeacherForm)form;
		TeacherBO teacherBO= new TeacherBO();
		String action=teacherForm.getAction();
		String dataRegister=teacherForm.getDataRegister();
		if(dataRegister !=null ){
			JSONParser jsonParse= new JSONParser();
			JSONObject jsonTeacherObject=(JSONObject)jsonParse.parse(dataRegister);
			JSONArray jsonArray=checkValidate(jsonTeacherObject);
			JSONObject jsonObject=(JSONObject)jsonArray.get(0);
			String result=jsonObject.get("result").toString();
			if("success".equals(result)){
				Teacher teacher= new Teacher();
				teacher.setName(jsonTeacherObject.get("name").toString());
				teacher.setEmail(jsonTeacherObject.get("email").toString());
				teacher.setPassword(jsonTeacherObject.get("password").toString());
				teacherBO.addNewTeacher(teacher);				
			}
			PrintWriter write= response.getWriter();
			write.println(""+jsonArray.toString());
			write.flush();
			write.close();
			return null;
		}
		if("delete".equals(action)){
			String teacherID=teacherForm.getTeacherID();
			if(!teacherBO.deleteTeacher(teacherID)){
				return mapping.findForward("occurError");
			}
		}
		teacherForm.setTeachers(teacherBO.getListTeacher());
		return mapping.findForward("showListTeacher");
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidate(JSONObject teacher){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean checkValidate=true;
		String name=teacher.get("name").toString();
		String email=StringProcess.toUTF8(teacher.get("email").toString());
		String password=teacher.get("password").toString();
		String retypePassword=teacher.get("retypePassword").toString();
		System.out.println("name"+name);
		System.out.println("email"+email);
		System.out.println("password"+password);
		System.out.println("retypepassword"+retypePassword);
		if(Validate.isEmpty(name)){
			checkValidate=false;
			jsonObject.put("nameError", "Họ, tên không được để trống !");
		}
		if(Validate.isEmpty(email)){
			checkValidate=false;
			jsonObject.put("emailError", "Email không được để trống !");
		}
		else{
			if(Validate.emailNotValid(email)){
				checkValidate=false;
				jsonObject.put("emailError","Email không hợp lệ !");
			}
			else{
				MemberBO memberBO= new MemberBO();
				if(memberBO.isEmailExist(email)){
					checkValidate=false;
					jsonObject.put("emailError", "Email đã tồn tại !");
				}
			}
		}
		if(Validate.isEmpty(password)){
			checkValidate=false;
			jsonObject.put("passwordError","Mật khẩu không được để trống !");
		}
		else{
			if(Validate.lengthPasswordNotValid(password)){
				checkValidate=false;
				jsonObject.put("passwordError", "Mật khẩu phải lớn hơn 6 kí tự !");
			}
		}
		if(Validate.isEmpty(retypePassword)){
			checkValidate=false;
			jsonObject.put("retypePasswordError", "Bạn chưa xác nhận lại mật khẩu !");
		}
		else{
			if(!retypePassword.equals(password)){
					checkValidate=false;
					jsonObject.put("retypePasswordError", "Xác nhận mật khẩu không đúng !");
			}
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

package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.StuckThreadDetectionValve;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import common.StringProcess;
import common.Validate;
import form.StudentForm;
import model.bean.Class;
import model.bean.Student;
import model.bo.MemberBO;
import model.bo.StudentBO;

public class AdminManageStudentAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		StudentForm studentForm=(StudentForm)form;
		StudentBO studentBO= new StudentBO();
		String action=studentForm.getAction();
		if(action!=null){
			String studentID=studentForm.getStudentID();
			if("view".equals(action)){
				Student student=studentBO.getStudent(studentID);
				JSONObject jsonObject= new JSONObject();
				jsonObject.put("studentID", student.getStudentID());
				jsonObject.put("name", student.getName());
				jsonObject.put("email", student.getEmail());
				jsonObject.put("phoneNumber", student.getPhoneNumber());
				jsonObject.put("classID", student.getClassID());
				jsonObject.put("className", student.getClassName());
				jsonObject.put("classFee", student.getClassFee());
				jsonObject.put("amountPaid", student.getAmountPaid());
				PrintWriter write=response.getWriter();
				write.println(""+jsonObject.toString());
				write.flush();
				write.close();
				return null;
			}
			if("update".equals(action)){
				String jsonStudent=studentForm.getJsonStudent();
				JSONParser jsonParser= new JSONParser();
				JSONObject jsonObject= (JSONObject)jsonParser.parse(jsonStudent);
				Student student= new Student();
				student.setStudentID(jsonObject.get("studentID").toString());
				student.setName(StringProcess.toUTF8(jsonObject.get("name").toString()));
				System.out.println("name "+student.getName());
				student.setEmail(jsonObject.get("email").toString());
				student.setPhoneNumber(jsonObject.get("phoneNumber").toString());
				student.setClassID(jsonObject.get("classID").toString());
				student.setAmountPaid(Integer.valueOf(jsonObject.get("amountPaid").toString()));
				JSONArray jsonArrayCheckValidate=checkValidate(student);
				JSONObject jsonObjectCheckValidate=(JSONObject)jsonArrayCheckValidate.get(0);
				String result=jsonObjectCheckValidate.get("result").toString();
				if("success".equals(result)){
					//studentBO.updateStudentInfor(student);
				}
				PrintWriter write= response.getWriter();
				write.println(""+jsonArrayCheckValidate.toString());
				write.flush();
				write.close();
				return null;
			}
			if("delete".equals(action)){
				
			}
		}
		ArrayList<Student> students= studentBO.getListStudent();
		ArrayList<Class> listClass=studentBO.getListClass();
		studentForm.setStudents(students);
		studentForm.setListClass(listClass);
		return mapping.findForward("showListStudent");
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidate(Student student){
		boolean checkValidate=true;
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();

		if(Validate.isEmpty(student.getName())){
			checkValidate=false;
			jsonObject.put("nameError", "Họ, tên không được để trống !");
		}
		if(Validate.isEmpty(student.getEmail())){
			checkValidate=false;
			jsonObject.put("emailError", "Email không được để trống !");
		}
		else{
			if(Validate.emailNotValid(student.getEmail())){
				checkValidate=false;
				jsonObject.put("emailError", "Email không đúng định dạng !");
			}
		}
		if(Validate.isEmpty(student.getPhoneNumber())){
			checkValidate=false;
			jsonObject.put("phoneNumberError", "Số điện thoại không được để trống !");
		}
		else {
			if(Validate.lengthPhoneNumberNotValid(student.getPhoneNumber())){
				checkValidate=false;
				jsonObject.put("phoneNumberError", "Số điện thoại phải >= 9 chữ số !");
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

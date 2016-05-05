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

import form.StudentForm;
import model.bean.Class;
import model.bean.Student;
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
}

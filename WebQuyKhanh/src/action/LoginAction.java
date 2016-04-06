package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.Validate;
import form.LoginForm;
import model.bean.Member;
import model.bo.MemberBO;

public class LoginAction extends Action {
	
	public static int ADMIN=3;
	public static int TEACHER=1;
	public static int MEMBER=0;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		LoginForm loginForm = (LoginForm) form;
		String email = loginForm.getEmail();
		String password = loginForm.getPassword();
		JSONArray jsonArray;
		jsonArray=checkLoginValidate(email, password,loginForm);
		
		PrintWriter out= response.getWriter();
		out.println(jsonArray.toString());
		out.flush();
		out.close();
		return null;
	
	}
	
	@SuppressWarnings("unchecked")
	public JSONArray checkLoginValidate(String email, String password, LoginForm loginForm){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean checkValidate=true;
		if (Validate.isEmpty(email)) {
			checkValidate=false; 
			jsonObject.put("emailError","Email trống");
		} else {
			if (Validate.emailNotValid(email)) {
				checkValidate=false; 
				jsonObject.put("emailError","Email không đúng định dạng");
			}
		}
		if (Validate.isEmpty(password)) {
			checkValidate=false; 
			jsonObject.put("passwordError","Password trống");
		}
		
		if(!checkValidate){
			jsonObject.put("checkValidate","false");
			jsonArray.add(jsonObject);
			return jsonArray;
		}
		else{
			jsonObject.put("checkValidate","true");
			MemberBO memberBO= new MemberBO();
			Member member=memberBO.checkLogin(email, password);
			if(member!=null){
				loginForm.setMember(member);
				jsonObject.put("login", "success");				
			}
			else{
				jsonObject.put("login", "failed");
			}
			jsonArray.add(jsonObject);
			return jsonArray;
		}
	}
}

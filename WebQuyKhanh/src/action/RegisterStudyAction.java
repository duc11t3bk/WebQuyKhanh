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

import common.Validate;
import form.ClassForm;
import form.RegisterStudyForm;
import model.bean.Class;
import model.bean.Posts;
import model.bean.RegisterStudy;
import model.bo.ClassBO;
import model.bo.HomeBO;
import model.bo.RegisterStudyBO;

public class RegisterStudyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		RegisterStudyForm registerStudyForm= (RegisterStudyForm)form;
		RegisterStudyBO registerStudyBO= new RegisterStudyBO();
		String action=registerStudyForm.getAction();
		String email=registerStudyForm.getEmail();
		String phoneNumber=registerStudyForm.getPhoneNumber();
		RegisterStudy registerStudy= new RegisterStudy();
		registerStudy.setEmail(email);
		registerStudy.setPhoneNumber(phoneNumber);
		if("studyabroad".equals(action)){
			JSONArray jsonArrayCheckValidate=checkValidate(email,phoneNumber);
			JSONObject jsonObject=(JSONObject)jsonArrayCheckValidate.get(0);
			String result=jsonObject.get("result").toString();
			if("success".equals(result)){
				registerStudy.setClassID(null);
				registerStudy.setCategory(RegisterStudy.TUVANDUHOC);
				registerStudyBO.addNewRegister(registerStudy);
			}
			PrintWriter write=response.getWriter();
			write.println(""+jsonArrayCheckValidate.toString());
			write.flush();
			write.close();
			return null;
		}
		if("registerstudy".equals(action)){
			String submit=registerStudyForm.getSubmit();
			if(submit!=null){
				String classID= registerStudyForm.getClassID();
				JSONArray jsonArrayCheckValidate=checkValidate(email, phoneNumber);
				JSONObject jsonObject= (JSONObject)jsonArrayCheckValidate.get(0);
				String result=jsonObject.get("result").toString();
				if("success".equals(result)){
					registerStudy.setClassID(classID);
					registerStudy.setCategory(RegisterStudy.DANGKYHOC);
					registerStudyBO.addNewRegister(registerStudy);
				}
				PrintWriter write=response.getWriter();
				write.println(""+jsonArrayCheckValidate.toString());
				write.flush();
				write.close();
				return null;
			}
			HomeBO homeBO = new HomeBO();
			ArrayList<Posts> listPostsNews= homeBO.getListPostsNews();
			registerStudyForm.setListPostsNews(listPostsNews);
			ClassBO classBO= new ClassBO();
			ArrayList<Class> listClass=classBO.getListClass();
			registerStudyForm.setListClass(listClass);
			return mapping.findForward("showPageRegisterStudy");
		}
		return super.execute(mapping, form, request, response);
	}
	@SuppressWarnings("unchecked")
	public JSONArray checkValidate(String email, String phoneNumber){
		JSONArray jsonArray= new JSONArray();
		JSONObject jsonObject= new JSONObject();
		boolean checkValidate=true;
		if(Validate.isEmpty(email)){
			checkValidate=false;
			jsonObject.put("emailError", "Bạn phải nhập email !");
		}
		else{
			if(Validate.emailNotValid(email)){
				checkValidate=false;
				jsonObject.put("emailError", "Email không đúng định dạng !");
			}
			else{
				RegisterStudyBO registerStudyBO = new RegisterStudyBO();
				if(registerStudyBO.emailExist(email)){
					checkValidate=false;
					jsonObject.put("emailError", "Bạn đã đăng ký tư vấn, xin vui lòng đợi chúng tôi liên lạc");
				}
			}
		}
		if(Validate.isEmpty(phoneNumber)){
			checkValidate=false;
			jsonObject.put("phoneNumberError", "Bạn phải nhập số điện thoại !");
		}
		else{
			if(Validate.lengthPhoneNumberNotValid(phoneNumber)){
				checkValidate=false;
				jsonObject.put("phoneNumberErro", "Số điện thoại phải >= 9 chữ số !");
			}	
		}
		if(checkValidate){
			jsonObject.put("result", "success");
		}
		else{
			jsonObject.put("result", "failed");
		}
		jsonArray.add(jsonObject);
		return jsonArray;
	}
}

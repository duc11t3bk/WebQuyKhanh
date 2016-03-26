package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.Validate;
import form.LoginForm;
import model.bo.LoginBO;

public class LoginAction extends Action {

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
		String submit = loginForm.getSubmit();
		
		System.out.println(""+loginForm.getEmailError());
		System.out.println(""+loginForm.getPasswordError());
		boolean checkValid=true;
		if (submit != null) {
			checkValid=checkLoginValidate(email, password, loginForm);
		}
		if (!checkValid) {
			PrintWriter out= response.getWriter();
			out.println("email trống");
			out.flush();
			return null;
		} else {
			LoginBO loginBO = new LoginBO();
			if (loginBO.checkLogin(email, password)) {
				return mapping.findForward("login-success");
			} else {
				return mapping.findForward("login-failed");
			}
		}
	}
	
	public boolean checkLoginValidate(String email, String password, LoginForm loginForm){
		boolean checkValid = true;
		loginForm.setEmailError("");
		loginForm.setPasswordError("");
		if (Validate.isEmpty(email)) {
			checkValid = false;
			loginForm.setEmailError("Email trống");
			System.out.println("" + loginForm.getEmailError());
		} else {
			if (!Validate.emailValid(email)) {
				checkValid=false;
				loginForm.setEmailError("Email vừa nhập không đúng");
			}
		}
		if (Validate.isEmpty(password)) {
			checkValid = false;
			loginForm.setPasswordError("Passsword trống");
		}
		return checkValid;
	}
}

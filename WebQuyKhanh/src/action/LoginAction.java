package action;

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

		LoginForm loginForm = (LoginForm) form;
		String email = loginForm.getEmail();
		String password = loginForm.getPassword();
		boolean checkValid = false;
		if (Validate.isEmpty(email)) {
			checkValid = true;
			loginForm.setEmailError("Email trống");
			System.out.println(""+loginForm.getEmailError());
		}else{
			if(!Validate.emailValid(email)){
				loginForm.setEmailError("Email vừa nhập không đúng");
			}
		}
		if (Validate.isEmpty(password)) {
			checkValid = true;
			loginForm.setPasswordError("Passsword trống");
		}
		
		if (checkValid) {
			return mapping.findForward("login-failed");
		} else {
			LoginBO loginBO = new LoginBO();

			if (loginBO.checkLogin(email, password)) {
				return mapping.findForward("login-success");
			} else {
				return mapping.findForward("login-failed");
			}
		}
	}
}

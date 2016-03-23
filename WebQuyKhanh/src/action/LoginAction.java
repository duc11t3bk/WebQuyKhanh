package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import form.LoginForm;
import model.bo.LoginBO;


public class LoginAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		LoginForm loginForm= (LoginForm)form;
		String email=loginForm.getEmail();
		String password=loginForm.getPassword();
		LoginBO loginBO= new LoginBO();
		
		if(loginBO.checkLogin(email, password)){
			return mapping.findForward("login-success");
		}
		else{
			return mapping.findForward("login-failed");
		}		
	}	
}

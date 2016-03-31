package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.LoginForm;

public class LogoutAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		System.out.println("Email"+loginForm.getMember().getEmail());
		loginForm.setMember(null);
		return mapping.findForward("logout-success");
	}

}

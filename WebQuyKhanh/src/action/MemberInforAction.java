package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.LoginForm;
import form.MemberForm;

public class MemberInforAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		MemberForm memberForm= (MemberForm)form;
		memberForm.setFile(null);
		memberForm.setEmail(loginForm.getMember().getEmail());
		memberForm.setPhoneNumber(loginForm.getMember().getPhoneNumber());
		
		return mapping.findForward("showMemberInfor");
	}
}

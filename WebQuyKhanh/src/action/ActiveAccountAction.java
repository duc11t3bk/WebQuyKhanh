package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.MemberForm;
import model.bo.MemberBO;

public class ActiveAccountAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MemberForm memberForm=(MemberForm)form;
		MemberBO memberBO= new MemberBO();
		String uuid=memberForm.getUuid();
		String memberID= memberForm.getMemberID();
		if(!memberBO.activeAccount(memberID,uuid)){
			return mapping.findForward("occurError");
		}
		return mapping.findForward("active-success");
	}
}

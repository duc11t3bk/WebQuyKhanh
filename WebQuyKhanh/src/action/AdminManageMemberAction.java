package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.MemberForm;
import model.bean.Member;
import model.bo.MemberBO;

public class AdminManageMemberAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MemberForm memberForm=(MemberForm)form;
		MemberBO memberBO = new MemberBO();
		String action=memberForm.getAction();
		memberForm.setEmail("");
		memberForm.setPhoneNumber("");
		if("delete".equals(action)){
			String memberID=memberForm.getMemberID();
			if(!memberBO.deleteMember(memberID)){
				return mapping.findForward("occurError");
			}
		}
		ArrayList<Member> members= memberBO.getListMember();
		memberForm.setMembers(members);
		
		return mapping.findForward("showListMember");
	}
}

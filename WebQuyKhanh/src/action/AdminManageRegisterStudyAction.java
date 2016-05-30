package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.StringProcess;
import form.RegisterStudyForm;
import model.bean.RegisterStudy;
import model.bo.RegisterStudyBO;

public class AdminManageRegisterStudyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		RegisterStudyForm registerStudyForm= (RegisterStudyForm)form;
		RegisterStudyBO registerStudyBO= new RegisterStudyBO();
		
		if("delete".equals(StringProcess.toUTF8(registerStudyForm.getSubmit()))){
			String registerID= registerStudyForm.getRegisterID();
			if(!registerStudyBO.deleteRegister(registerID)){
				return mapping.findForward("occurError");
			}
		}
		ArrayList<RegisterStudy> listRegisterStudy= registerStudyBO.getListRegisterStudy();
		registerStudyForm.setListRegisterStudy(listRegisterStudy);
		return mapping.findForward("showListRegisterStudy");
	}

}

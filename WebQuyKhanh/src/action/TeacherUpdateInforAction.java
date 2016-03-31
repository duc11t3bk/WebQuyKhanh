package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import common.FileProcess;
import common.StringProcess;
import common.Validate;
import form.LoginForm;
import form.MemberForm;
import form.TeacherForm;
import model.bean.Teacher;
import model.bo.MemberBO;
import model.dao.MemberDAO;

public class TeacherUpdateInforAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		TeacherForm teacherForm = (TeacherForm) form;
		teacherForm.setMember(loginForm.getMember());
		MemberBO memberBO = new MemberBO();

		if ("Đổi mật khẩu".equals(StringProcess.toUTF8(teacherForm.getSubmit()))) {
			if (validateChangePassword(teacherForm)) {
				memberBO.updatePassword(teacherForm.getMember().getMemberID(), teacherForm.getNewPassword());
				return mapping.findForward("updateSuccess");
			}
		}
		if("Lưu".equals(StringProcess.toUTF8(teacherForm.getSubmit()))){
			FormFile file= teacherForm.getFile();
			if(!"".equals(file.getFileName())){
				String imageName=FileProcess.uploadImage(file,getServlet(),"avata");
				String filePath=getServlet().getServletContext().getRealPath("/")+"avata";
				FileProcess.deleteOldImage(filePath, loginForm.getMember().getImage());
			}
			
			return mapping.findForward("updateSuccess");
		}
		teacherForm.setEmail(teacherForm.getMember().getEmail());
		teacherForm.setPhoneNumber(teacherForm.getMember().getPhoneNumber());
		Teacher teacherInfor = memberBO.getTeacherInfor(teacherForm.getMember().getTeacherID());
		teacherForm.setTeacher(teacherInfor);
		teacherForm.setName(teacherInfor.getName());
		teacherForm.setDayOfBirth(teacherInfor.getDayOfBirth());
		teacherForm.setSex(teacherInfor.getSex());
		teacherForm.setAddress(teacherInfor.getAddress());
		teacherForm.setCertificate(teacherInfor.getCertificate());
		teacherForm.setDayOfContract(teacherInfor.getDayOfContract());

		return mapping.findForward("showTeacherInfor");
	}

	public boolean validateChangePassword(TeacherForm memberForm) {
		boolean checkValidate = true;
		memberForm.setPasswordError("");
		memberForm.setNewPasswordError("");
		memberForm.setRetypePasswordError("");
		String password = memberForm.getPassword();
		String newPassword = memberForm.getNewPassword();
		String retypePassword = memberForm.getRetypePassword();
		if (Validate.isEmpty(password)) {
			checkValidate = false;
			memberForm.setPasswordError("Mật khẩu trống");
		} else {
			if (Validate.lengthPasswordNotValid(password)) {
				checkValidate = false;
				memberForm.setPasswordError("Mật khẩu phải >= 6 kí tự");
			} else {
				if (!memberForm.getMember().getPassword().equals(password)) {
					checkValidate = false;
					memberForm.setPasswordError("Mật khẩu bạn nhập không chính xác");
				}
			}
		}
		if (Validate.isEmpty(newPassword)) {
			checkValidate = false;
			memberForm.setNewPasswordError("Bạn chưa nhập mật khẩu mới");
		} else {
			if (Validate.lengthPasswordNotValid(newPassword)) {
				checkValidate = false;
				memberForm.setNewPasswordError("Mật khẩu phải >= 6 kí tự");
			}
		}
		if (Validate.isEmpty(retypePassword)) {
			checkValidate = false;
			memberForm.setRetypePasswordError("Bạn chưa xác nhận mật khẩu");
		} else {
			if (Validate.lengthPasswordNotValid(retypePassword)) {
				checkValidate = false;
				memberForm.setRetypePasswordError("Mật khẩu phải >= 6 kí tự");
			} else {
				if (!retypePassword.equals(newPassword)) {
					checkValidate = false;
					memberForm.setRetypePasswordError("Xác nhận mật khẩu không đúng");
				}
			}
		}
		return checkValidate;
	}
	public boolean checkValidateInfor(TeacherForm teacherForm){
		boolean checkValidate=true;
		teacherForm.setNameError("");
		teacherForm.setPhoneNumberError("");
		teacherForm.setDayOfBirthError("");
		teacherForm.setDayOfContractError("");
		teacherForm.setAddressError("");
		teacherForm.setCertificateError("");
		
		return false;
	}
}

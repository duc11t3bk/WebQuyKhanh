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
import model.bean.Member;
import model.bean.Teacher;
import model.bo.MemberBO;
import model.bo.TeacherBO;
import model.dao.MemberDAO;

public class TeacherUpdateInforAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		TeacherForm teacherForm = (TeacherForm) form;
		String memberID= teacherForm.getMemberID();
		MemberBO memberBO = new MemberBO();
		if(memberID==null){
			teacherForm.setMember(loginForm.getMember());
		}
		else{
			teacherForm.setMember(memberBO.getMember(memberID));
		}
		Teacher teacher = memberBO.getTeacherInfor(teacherForm.getMember().getTeacherID());
		teacherForm.setTeacher(teacher);
		teacherForm.setEmail(teacherForm.getMember().getEmail());
		if ("Đổi mật khẩu".equals(StringProcess.toUTF8(teacherForm.getSubmit()))) {
			if (validateChangePassword(teacherForm)) {
				memberBO.updatePassword(teacherForm.getMember().getMemberID(), teacherForm.getNewPassword());
				return mapping.findForward("updateSuccess");
			}
		}
		if ("Lưu".equals(StringProcess.toUTF8(teacherForm.getSubmit()))) {
			FormFile file = teacherForm.getFile();
			String imageName = "";
			if (!"".equals(file.getFileName())) {
				imageName = FileProcess.uploadFile(file, getServlet(), "avata");
				FileProcess.deleteOldFile(getServlet(), teacherForm.getMember().getImage(),"avata");
			}
			if (checkValidateInfor(teacherForm)) {
				Member memberInfor = new Member();
				memberInfor.setMemberID(teacherForm.getMember().getMemberID());
				memberInfor.setImage(imageName);
				memberInfor.setPhoneNumber(teacherForm.getPhoneNumber());
				memberBO.updateMemberInfor(memberInfor);

				Teacher teacherInfor = new Teacher();
				teacherInfor.setTeacherID(teacherForm.getMember().getTeacherID());
				teacherInfor.setName(StringProcess.toUTF8(teacherForm.getName()));
				teacherInfor.setDayOfBirth(teacherForm.getDayOfBirth());
				teacherInfor.setSex(teacherForm.getSex());
				teacherInfor.setAddress(StringProcess.toUTF8(teacherForm.getAddress()));
				teacherInfor.setCertificate(StringProcess.toUTF8(teacherForm.getCertificate()));
				teacherInfor.setDayOfContract(teacherForm.getDayOfContract());
				memberBO.updateTeacherInfor(teacherInfor);
				
				System.out.println("name="+teacherInfor.getName()+"address="+teacherInfor.getAddress()+"certificate"+teacherInfor.getCertificate());
				return mapping.findForward("updateSuccess");
			}
			teacherForm.setName(StringProcess.toUTF8(teacherForm.getName()));
			teacherForm.setAddress(StringProcess.toUTF8(teacherForm.getAddress()));
			teacherForm.setCertificate(StringProcess.toUTF8(teacherForm.getCertificate()));
		} else {		
			teacherForm.setPhoneNumber(teacherForm.getMember().getPhoneNumber());
			teacherForm.setName(teacher.getName());
			teacherForm.setDayOfBirth(teacher.getDayOfBirth());
			teacherForm.setSex(teacher.getSex());
			teacherForm.setAddress(teacher.getAddress());
			teacherForm.setCertificate(teacher.getCertificate());
			teacherForm.setDayOfContract(teacher.getDayOfContract());
			teacherForm.setImage(teacherForm.getMember().getImage());
		}
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

	public boolean checkValidateInfor(TeacherForm teacherForm) {
		boolean checkValidate = true;
		teacherForm.setNameError("");
		teacherForm.setPhoneNumberError("");
		teacherForm.setDayOfBirthError("");
		teacherForm.setDayOfContractError("");
		teacherForm.setAddressError("");
		teacherForm.setCertificateError("");
		String name = teacherForm.getName();
		String dayOfBirth = teacherForm.getDayOfBirth();
		String phoneNumber = teacherForm.getPhoneNumber();
		String address = teacherForm.getAddress();
		String certificate = teacherForm.getCertificate();
		String dayOfContract = teacherForm.getDayOfContract();

		if (Validate.isEmpty(name)) {
			checkValidate = false;
			teacherForm.setNameError("Bạn phải điền họ, tên");
		}
		if (Validate.isEmpty(phoneNumber)) {
			checkValidate = false;
			teacherForm.setPhoneNumberError("Bạn phải điền số điện thoại");
		} else {
			if (Validate.lengthPhoneNumberNotValid(phoneNumber)) {
				checkValidate = false;
				teacherForm.setPhoneNumberError("Số điện thoại phải >= 9 chữ số");
			}
		}
		if (Validate.isEmpty(dayOfBirth)) {
			checkValidate = false;
			teacherForm.setDayOfBirthError("Bạn phải điền ngày sinh");
		} else {
			if (Validate.dateNotValid(dayOfBirth)) {
				checkValidate = false;
				teacherForm.setDayOfBirthError("Ngày không hợp lệ, hãy nhập lại");
			}
		}
		if (Validate.isEmpty(address)) {
			checkValidate = false;
			teacherForm.setAddressError("Bạn phải điền địa chỉ");
		}
		if (Validate.isEmpty(certificate)) {
			checkValidate = false;
			teacherForm.setCertificateError("Bạn phải điền thông tin về bằng cấp");
		}
		if (Validate.isEmpty(dayOfContract)) {
			checkValidate = false;
			teacherForm.setDayOfContractError("Bạn phải điền ngày kí hợp đồng");
		} else {
			if (Validate.dateNotValid(dayOfContract)) {
				checkValidate = false;
				teacherForm.setDayOfContractError("Ngày không hợp lệ, hãy nhập lại");
			}
		}
		return checkValidate;
	}
}

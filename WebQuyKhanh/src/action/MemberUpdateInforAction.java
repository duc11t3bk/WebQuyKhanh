package action;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.upload.FormFile;

import common.FileProcess;
import common.StringProcess;
import common.Validate;
import form.LoginForm;
import form.MemberForm;
import model.bean.Member;
import model.bo.MemberBO;

public class MemberUpdateInforAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		MemberForm memberForm = (MemberForm) form;
		memberForm.setMember(loginForm.getMember());
		memberForm.setEmail(loginForm.getMember().getEmail());
		if ("Đổi mật khẩu".equals(StringProcess.toUTF8(memberForm.getSubmit()))) {
			if (validateChangePassword(memberForm)) {
				MemberBO memberBO = new MemberBO();
				memberBO.updatePassword(memberForm.getMember().getMemberID(), memberForm.getNewPassword());
				return mapping.findForward("updateSuccess");
			}
		}
		if ("Lưu".equals(StringProcess.toUTF8(memberForm.getSubmit()))) {
			FormFile file = memberForm.getFile();
			String imageName = "";
			if (!"".equals(file.getFileName())) {
				imageName = FileProcess.uploadImage(file, getServlet(), "avata");
				String filePath = getServlet().getServletContext().getRealPath("/") + "avata";
				FileProcess.deleteOldImage(filePath, memberForm.getMember().getImage());
				System.out.println("" + imageName);
			}
			MemberBO memberBO = new MemberBO();
			Member member= new Member();
			member.setMemberID(memberForm.getMember().getMemberID());
			member.setImage(imageName);
			member.setPhoneNumber(memberForm.getPhoneNumber());
			memberBO.updateMemberInfor(member);
			return mapping.findForward("updateSuccess");
		} else {
			memberForm.setPhoneNumber(loginForm.getMember().getPhoneNumber());
		}
		return mapping.findForward("showMemberInfor");
	}

	public boolean validateChangePassword(MemberForm memberForm) {
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

	public static void main(String[] args) {
		MemberUpdateInforAction test = new MemberUpdateInforAction();
		String filePath = "/home/davy/Pictures";
		String imageName = "3k8.png";
	}
}

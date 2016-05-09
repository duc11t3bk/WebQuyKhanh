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
		MemberBO memberBO = new MemberBO();
		String memberID= memberForm.getMemberID();
		System.out.println("memberID"+memberID);
		if(Validate.isEmpty(memberID)){
			memberForm.setMember(loginForm.getMember());
			memberForm.setEmail(loginForm.getMember().getEmail());
			memberForm.setMemberID(memberID);
		}
		else{
			//when admin manange member information
			memberForm.setMember(memberBO.getMember(memberID));
			memberForm.setEmail(memberForm.getMember().getEmail());
			memberForm.setMemberID(memberForm.getMember().getMemberID());
		}
		if ("Đổi mật khẩu".equals(StringProcess.toUTF8(memberForm.getSubmit()))) {
			if (validateChangePassword(memberForm)) {
				memberBO.updatePassword(memberForm.getMember().getMemberID(), memberForm.getNewPassword());
				if(Validate.isEmpty(memberID)){
					return mapping.findForward("updateSuccess");
				}
				else{
					memberForm.setEmail("");
					memberForm.setPhoneNumber("");
					return mapping.findForward("adminShowListMember");
				}
			}
		}
		if ("Lưu".equals(StringProcess.toUTF8(memberForm.getSubmit()))) {
			FormFile file = memberForm.getFile();
			String imageName = "";
			if (!"".equals(file.getFileName())) {
				imageName = FileProcess.uploadFile(file, getServlet(), "avata");
				FileProcess.deleteOldFile(getServlet(), memberForm.getMember().getImage(),"avata");
				System.out.println("" + imageName);
			}
			Member member= new Member();
			member.setMemberID(memberForm.getMember().getMemberID());
			member.setImage(imageName);
			member.setPhoneNumber(memberForm.getPhoneNumber());
			System.out.println("phone   "+member.getPhoneNumber());
			memberBO.updateMemberInfor(member);
			if(Validate.isEmpty(memberID)){
				return mapping.findForward("updateSuccess");
			}
			else{
				memberForm.setEmail("");
				memberForm.setPhoneNumber("");
				return mapping.findForward("adminShowListMember");
			}
		} else {
			memberForm.setPhoneNumber(memberForm.getMember().getPhoneNumber());
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

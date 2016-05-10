package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.Validate;
import form.MemberForm;
import model.bean.Member;
import model.bo.MemberBO;

public class RegisterMemberAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/text; charset=utf-8");
		response.setHeader("cache-control","no-cache");
		MemberForm memberForm = (MemberForm)form;
		String email = memberForm.getEmail();
		String phoneNumber = memberForm.getPhoneNumber();
		String password = memberForm.getPassword();
		String retypePassword = memberForm.getRetypePassword();
		System.out.println(""+email+password+phoneNumber+retypePassword);
		JSONArray jsonArray = checkValidate(email, phoneNumber, password, retypePassword);
		JSONObject jsonObject= (JSONObject) jsonArray.get(0);
		MemberBO memberBO= new MemberBO();
		if(((String)jsonObject.get("register")).equals("success")){
			Member memberInfor= new Member();
			memberInfor.setTeacherID(null);
			memberInfor.setEmail(email);
			memberInfor.setPhoneNumber(phoneNumber);
			memberInfor.setPassword(password);
			memberInfor.setImage("");			
			memberInfor.setPriority(0);
			Date date= new Date();
			SimpleDateFormat spdf= new SimpleDateFormat("yyyy-MM-dd");
			memberInfor.setDateattended(spdf.format(date));
			memberBO.registerMember(memberInfor);
		}
		PrintWriter write=response.getWriter();
		write.println(jsonArray.toString());
		write.flush();
		write.close();
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	public JSONArray checkValidate(String email, String phoneNumber, String password, String retypePassword) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		MemberBO memberBO = new MemberBO();

		boolean checkValidate = true;
		if (Validate.isEmpty(email)) {
			checkValidate = false;
			jsonObject.put("emailError", "Email trống !");
		} else {
			if (Validate.emailNotValid(email)) {
				checkValidate = false;
				jsonObject.put("emailError", "Email không đúng định dạng !");
			} else if (memberBO.isEmailExist(email)) {
				checkValidate = false;
				jsonObject.put("emailError", "Email đã tồn tại !");
			}
		}
		if (Validate.isEmpty(phoneNumber)) {
			checkValidate = false;
			jsonObject.put("phoneNumberError", "Số điện thoại trống !");
		} else {
			if (Validate.lengthPhoneNumberNotValid(phoneNumber)) {
				checkValidate = false;
				jsonObject.put("phoneNumberError", "Số điện thoại phải >= 9 số !");
			}
		}
		if (Validate.isEmpty(password)) {
			checkValidate = false;
			jsonObject.put("passwordError", "Mật khẩu trống !");
		} else {
			if (Validate.lengthPasswordNotValid(password)) {
				checkValidate = false;
				jsonObject.put("passwordError", "Mật khẩu phải >= 6 kí tự !");
			}
		}
		if (Validate.isEmpty(retypePassword)) {
			checkValidate = false;
			jsonObject.put("retypePasswordError", "Bạn chưa xác nhận mật khẩu !");
		} else {
			if (Validate.lengthPasswordNotValid(retypePassword)) {
				checkValidate = false;
				jsonObject.put("retypePasswordError", "Mật khẩu phải >= 6 kí tự !");
			} else {
				if (!Validate.isEmpty(password) && !Validate.lengthPasswordNotValid(password)
						&& !retypePassword.equals(password)) {
					checkValidate = false;
					jsonObject.put("retypePasswordError", "Xác nhận mật khẩu không đúng !");
				}

			}
		}
		if (checkValidate) {
			jsonObject.put("register", "success");
			jsonObject.put("message", "Bạn đã đăng ký thành công !");
			jsonArray.add(jsonObject);
			return jsonArray;
		} else {
			jsonObject.put("register", "failed");
			jsonArray.add(jsonObject);
			return jsonArray;
		}
	}
}

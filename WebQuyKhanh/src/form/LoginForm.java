package form;

import org.apache.struts.action.ActionForm;

import model.bean.Member;

public class LoginForm extends ActionForm{

	private String email;
	private String password;
	private String submit;
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	
	
	
}

package common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
	
	private static Pattern pattern;
	private static Matcher matcher;
	
	
	public static final String EMAIL_PATTERN ="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public static boolean isEmpty(String s){
		if(s==null || s.length()==0) return true;
		return false;
	}
	
	public static boolean emailNotValid(String email){
		pattern= Pattern.compile(EMAIL_PATTERN);
		matcher= pattern.matcher(email);
		return !matcher.matches();
	}
	public static boolean lengthPhoneNumberNotValid(String phoneNumber){
		return (phoneNumber.length() <9 ) ? true : false;
	}
	public static boolean lengthPasswordNotValid(String password){
		return (password.length() < 6 ) ? true : false;
	}
}

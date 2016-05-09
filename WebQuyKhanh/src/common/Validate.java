package common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
	
	private static Pattern pattern;
	private static Matcher matcher;
	
	
	public static final String EMAIL_PATTERN ="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public static boolean isEmpty(String s){
		if(s==null || s.length()==0||s=="") return true;
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
	public static boolean dateNotValid(String day){
		SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date currentDay= new Date();
			Date dayOfBirth = sdf.parse(day);
//			System.out.println("dayOfBirth"+dayOfBirth+"currentDay"+currentDay);
//			System.out.println(""+dayOfBirth.after(currentDay));
			return dayOfBirth.after(currentDay) ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public static void main(String[] args){
		Validate.dateNotValid("08-08-2020");
	}
}

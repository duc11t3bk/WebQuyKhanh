package common;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.bean.JapaneseData;

public class StringProcess {

	public static String toUTF8(String input){
		try {
			if(Validate.isEmpty(input)) return null;
			byte[] isoString=input.getBytes("iso-8859-1");
			String utf8String= new String(isoString,"utf-8");
			return utf8String;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String formatDate(String source, String formatIn, String formatOut){
		SimpleDateFormat sdfIn= new SimpleDateFormat(formatIn);
		SimpleDateFormat sdfOut= new SimpleDateFormat(formatOut);
		try {
			Date date= sdfIn.parse(source);
			return sdfOut.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
	}
	public static int convertAccuracy(int accuracy){
		return (accuracy*100)/JapaneseData.NUMBER_QUESTION;
	}
	public static void main (String[] args){
		System.out.println(""+StringProcess.formatDate("1993-11-26", "yyyy-MM-dd", "dd-MM-yyyy"));
	}
}


package common; 


public class StringProcess {

	public static String toUTF8(String input){
		try {
			if(Validate.isEmpty(input)) return null;
			byte[] isoString=input.getBytes("iso-8859-1");
			String utf8String= new String(isoString,"utf-8");
			System.out.println(""+utf8String);
			return utf8String;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}


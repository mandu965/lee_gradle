package lee.comm.util;

public class LeeUtil {
	static public long StringToLong(String str) {
		long var = 0;
		try {
			var = Long.parseLong(str);
		}catch(NumberFormatException e) {
			System.out.println("error : " + e);
		}
		return var;
	}
}

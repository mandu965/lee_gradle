package lee.domain;

import lombok.Data;

@Data
public class ReflectVo {
	private String str;
	private String str2;
	private int num;
	
	public ReflectVo() {
		
	}
	
	private void function_one() {
		System.out.println("function_one call");	
	}
	private void function_two(String str) {
		System.out.println("function_two call " + str);
	}
}

package lee.comm.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import lee.domain.ReflectVo;

public class ReflectTest {
	/**
	가져올수 있는 정보
	ClassName
	Class Modifiers (public, private, synchronized 등)
	Package Info
	Superclass
	Implemented Interfaces
	Constructors
	MethodsFields
	Annotations
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InstantiationException 
	*/
	
	//클래스 정보
	//필드 조작
	public void objectAccessTest() throws Exception {
		
		ReflectVo reflectVo = new ReflectVo(); //해당 클래스의 인스턴스 생성

		//Object obj=vo;
		Class c = Class.forName("lee.domain.ReflectVo");  // 클래스 얻기
		boolean isClassIncetance = c.isInstance(new ReflectVo());  // instanceOf 기능과 같음
		Class[] itfc = c.getInterfaces();  // 구현한 모든 인터페이스들 얻기 - 구현은 여러개 가능하므로 Class[]  배열
		Class sc = c.getSuperclass();  // 상속받은 슈퍼클래스 얻기 - 상속은 하나만 가능하므로 단일 변수
		Constructor csrList[] = c.getDeclaredConstructors();  // 모든 생성자 얻기
		
		Field[] allFd = c.getDeclaredFields();
		//c.getFields() 
		
		Method[] allMs = c.getDeclaredMethods();  // 모든 메소드들 얻기 - 상속받은것들 포함
		//c.getMethods();
		
		Method[] myMs = c.getDeclaredMethods();  // 모든 메소드들 얻기 - 상속받은것들은 불포함
		//Method m = c.getMethod("메소드명", "파라미터타입");  // 특정 메소드 얻기

		System.out.println("isClassIncetance= : " + isClassIncetance);
		
		Object array=null;
		String name = "";
		for (Field field : allFd){
	            field.setAccessible(true);
	            name = field.getName();
	            System.out.println("필드타입 : " + field.getType());
	            System.out.println("필드명 : " + field.getName());
		}
		
		for (Method mthd : allMs){
			mthd.setAccessible(true);
			System.out.println("메소드명 : " + mthd.getName());
			if(mthd.getName().equals("function_one")) {
				mthd.invoke(reflectVo, null);
			}else if(mthd.getName().equals("function_two")) {
				mthd.invoke(reflectVo, "두번째 메소드 파라미터 ");
			}
		}
	}

}

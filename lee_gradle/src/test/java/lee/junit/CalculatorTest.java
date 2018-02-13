package lee.junit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;

public class CalculatorTest {
	
	//@Test(timeout=5000)  : 시간단위 : 밀리초
	//@Test(expected=RuntimeException.class) : RuntimeException이 발생해야 성공
	//@Ignore(value=”test”)
	
	//@Before 해당 테스트 클래스의 객체를 초기화하는 작업
	//@After 해당 테스트  실행 수 실행
	
	//@BeforeClass 테스트 클래스 실행 전 한번 실행
	//@AfterClass 테스트 클래스 실행 후 한번 실행
	@Test
	public void testSum( ) {
		Calculator cal = new Calculator();
		int result = cal.sum(10, 20);
		assertEquals(20,  result, 10);
	}

}

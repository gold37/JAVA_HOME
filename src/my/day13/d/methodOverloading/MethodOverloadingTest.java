package my.day13.d.methodOverloading;

public class MethodOverloadingTest {

	// === 메소드의 오버로딩(overloading) === //
	/*
	 	메소드 생성시 메소드의 이름은 중복을 허락한다.
	 	단, 메소드의 파라미터 갯수, 타입, 순서가 달라야 한다.
	 	
	 */
	
	public int sum(int a, int b) {
		return a+b;
	}
	
	protected int sum(int a, int b, int c) { // 파라미터 갯수 다르게
		return a+b+c;
	}
	
	public int sum(short a, int b) { // 파라미터 타입 다르게
		return a+b;
	}
	
	public int sum(int b, short a) { // 파라미터 순서 다르게
		return a+b;
	}
	
	 
	
}

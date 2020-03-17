package my.day12.d.finalTest;

public class Parent {

	String name = "서강준";
	int point = 100;
	
	final double PI = 3.141592;
	// 변수 PI는 final이 붙었기 때문에 3.141592가 들어오고 더 이상 다른 값은 들어올 수 없다
	// 이러한 변수 PI를 상수변수라고 부른다.
	
	void test1Method() {
		System.out.println("=== 테스트1 메소드입니다 ===\n");
	} // 자식 클래스에서 재정의 가능

	final void test2Method() {
		System.out.println("=== 테스트2 메소드입니다 ===\n");
	} // 자식 클래스에서 재정의 불가능
	
}

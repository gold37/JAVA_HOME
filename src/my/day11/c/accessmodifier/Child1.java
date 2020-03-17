package my.day11.c.accessmodifier;

public class Child1 extends Parent {

	void viewInfo() {
		super.id = "less";  // public 동그라미(초록색)
		super.pwd = "1234";  // protected 마름모(노랑색)
		super.name = "이순신"; // default 삼각형(파랑색)
		// super.birthday 불가능 ----> birthday는 private기 때문에 자기 클래스에서만 가능! 동일 패키지여도 안됨 
		// 사각형 (빨강색) 접근불가
	}
}

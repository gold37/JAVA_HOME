package my.day11.d.accessmodifier;

import my.day11.c.accessmodifier.Parent;

public class Child2 extends Parent {
	
	void viewInfo() {
		super.id = "less";  // public 동그라미
		super.pwd = "1234";  // protected 마름모
		// super.name 불가능 ----> name은 default기 때문에 다른 패키지에서는 못함
		// super.birthday 불가능 ----> birthday도 private기 때문에 자기 클래스에서만 가능! 동일 패키지여도 안됨
	}
}

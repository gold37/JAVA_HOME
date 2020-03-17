package my.day12.f.superConstructor;

public class Parent {

	String id = "eomjh";
	String pwd;
	
	public Parent() { // 부모클래스의 기본 생성자
		id = "eomjh";
		pwd = "1234";
		System.out.println("[확인용] Parent 클래스의 기본생성자 호출\n");
	}
}

package my.day12.f.superConstructor;

public class Child extends Parent {

	String name;
	
	/*
	public Child() {
		super(); // 부모클래스의 기본 생성자 --> 생략되어져있음
		name = "엄정화";
	}
	*/
	
	void childInfo() {
		String info = "1.아이디: "+super.id+"\n"
					 +"2.암호: "+super.pwd+"\n"
					 + "3.성명: "+this.name;
		
		System.out.println(info);
	}
}

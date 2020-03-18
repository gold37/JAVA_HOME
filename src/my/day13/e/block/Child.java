package my.day13.e.block;

public class Child extends Parent {
	
	String name = "공유"; // 1빠  . 첫번째 : 멤버변수의 초기화
	static String address = "서울시";
	
	static { // 두번째
		// === static 초기화 블럭 === Oracle 할때 사용할거임
		// 인스턴스를 생성하기전에 먼저 호출되어지는데 오로지 1번만 호출됨 ☆★☆★
		// 주로 환경설정할때 사용 ex) 가수무대 한번만 설치하고 다른가수들도 사용하는것처럼
		System.out.println("*** Child 클래스의 static 초기화 블럭 호출됨");
		
		// name = "이순신"; // 오류. static 초기화 블럭에는 static 변수만 사용이 가능하다
		address = "경기도";
		System.out.println("*** 주소: "+ address);
	}
	
	{ // 세번째
		// === 인스턴스 초기화 블럭 === 
		System.out.println(">>> Child 클래스의 인스턴스 초기화 블럭 호출됨");
		name = "우도환"; // 2빠
	}
	
	public Child() { // === 생성자 ===
		super();	 // 네번째
		
		// 다섯번째
		System.out.println(">>> Child 클래스의 기본생성자 호출됨");
		name = "서강준"; // 3빠 -> 덮어 씌임
	}
}

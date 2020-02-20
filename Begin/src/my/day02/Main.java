package my.day02;

public class Main {

	int age;
	String id, pwd, name, email; //인스턴스
	static String address;	
	
/*
 * 	
 */
	
	void showInfo() {
		System.out.println(">>> 회원 정보 <<<");
		System.out.println("1. ID: " + id);
		System.out.println("2. PWD: " + pwd);
		System.out.println("3. NAME: " + name);
		System.out.println("4. EMAIL: " + email);
		System.out.println("5. AGE: " + age);
	}
	
	void test1() { //메소드, 행위
		int point = 0; //지역변수이므로 test1안에서만 사용됨
		System.out.println("메소드 test1 호출");
		System.out.println("point : " + point);
	}
	
	void test2() { //메소드, 행위
		int point = 10; 
		System.out.println("메소드 test2 호출");
		System.out.println("point : " + point);
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Main ma1 = new Main(); //인스턴스화
		ma1.id = "leess";
		ma1.pwd = "***";
		ma1.name = "이순신";
		ma1.email = "leess@daum.net";
	
		
		Main ma2 = new Main(); //인스턴스화
		ma2.id = "honggd";
		ma2.pwd = "password";
		ma2.name = "홍길동";
		ma2.email = "honggd@hanmail.com";
		
		ma1.showInfo();
		System.out.println("\n");
		ma2.showInfo();
		
		System.out.println("\n#############");
		
		int point=100; //지역변수 반드시 초기화 할 것
		System.out.println("point: " + point);
		
		String str= null; //지역변수 반드시 초기화 할 것
		System.out.println("str:" + str);
		
		Main ma3 = new Main();
		ma3.showInfo();
		
		System.out.println("\n");
		
		ma3.test1();
		/*
		 * 메소드 test1 호출 
		 * point : 0
		 */
		ma2.test2();
		/*
		 * 메소드 test2 호출 
		 * point : 10
		 */
	}

}

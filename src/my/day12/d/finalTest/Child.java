package my.day12.d.finalTest;

public class Child extends Parent {

	/*
	 * ↓ 눈에 안보이지만 이렇게 Parent에서 상속 받아왔음
	 * String name = "홍길똥"; int point = 100;
	 * 
	 * double PI = 3.141592;
	 */
	
	
	void childInfo_1() {
		System.out.println("1.성명: "+super.name+"\n"
						 + "2.포인트: "+super.point+"\n"
						 + "3.원주율: "+super.PI+"\n"
						 + "4.반지름이 2인 원넓이: "+(super.PI*2*2)+"\n");
	}
	
	void childInfo_2() {
		name = "박보검"; // 앞에 super(==this)가 생략돼있음 눈에 안보이지만 Parent에서 상속받아왔기 때문
		point = 500;
		// PI = 1.23456; // 부모 클래스에서 PI가 final로 정의됐기 때문에 새로운 값을 부여할 수 없다
		
		childInfo_1();
	}
	
	@Override
	void test1Method() {
		System.out.println("=== This is test method 1 !! lol ===\n");
	}

	/*
	@Override // 상속받은 test2Method() 메소드는 final이므로 메소드의 오버라이딩(재정의)가 불가능하다
	void test2Method() {
		System.out.println("=== This is test method 2 !! lol ===\n");
	} 
	*/

}

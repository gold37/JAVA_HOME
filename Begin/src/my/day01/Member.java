package my.day01;

public class Member { //회원

	/*
	 * 쇼핑몰 프로그램을 작성하고자 한다면 
	 * 회원, 제품, 장바구니, 주문내역 등등의 많은 부품이 필요
	 * 부품의 설계도면을 클래스라고 보면됨
	 */
		
	String id; //스트링은 문자열, id 변수에는 문자열이 들어온다!!!
	String pwd; 
	String name;
	String email;

	static String address; 
	
	// behavior == method 
	void showInfo() {
		System.out.println("=== 회원정보 ===");
		System.out.println("1.아이디: "+ id); // +는 문자열 결합을 나타냄
		System.out.println("2.암호: " + pwd);
		System.out.println("3.성명: " + name);
		System.out.println("4.이메일: " + email);
		System.out.println("5.주소: " + address);
	}
	
}

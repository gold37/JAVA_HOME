package my.day01;

//import my.day01.Member;
//동일 패키지 속에 있는 클래스는 import를 안해도 사용 가능

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Member Class를 인스턴스화 한다.
		Member kjwMbr = new Member(); // 메모리에 올려서 만들겠다. 
		kjwMbr.id = "kjw";
		kjwMbr.pwd = "123";
		kjwMbr.name = "곽지원";
		kjwMbr.email = "kjw@naver.com";
		
		Member shhMbr = new Member(); // Member 클래스를 인스턴스화 한다. 인스턴스 명은 kjwMbr
		shhMbr.id = "shh";
		shhMbr.pwd = "abc";
		shhMbr.name = "신현호";
		shhMbr.email = "shh@naver.com";

		Member.address = "경기도 수원시";
		// static 변수는 '클래스명.static변수명'으로 사용한다.
		
		kjwMbr.showInfo();
		
		System.out.println("\n");
		
		shhMbr.showInfo();
		
	}

}

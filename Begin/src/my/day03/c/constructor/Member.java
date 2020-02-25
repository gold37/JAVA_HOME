package my.day03.c.constructor;

public class Member {
	
	// field , attribute , property 속성
	
	String userid;
	String passwd;
	String name;
	int age;
	int point;
	
	// ***** 생성자 (== constructor) *****
	/*
	 * 생성자란?
	 * - 객체를 생성 (instance화) new 해준것
	 * - 객체를 생성할 때 마다 자동적으로 호출되어져 실행되어지는 어떠한 행위를 기술한 것
	 * 
	 * ※ 생성자 규칙
	 * 1) 생성자 이름은 반드시 클래스명과 같게
	 * 2) 반환타입 기술 XXXXXXX 
	 * 
	 */
	
	
	
	// 1. 기본생성자
	public Member() { //클래스명과 같은 생성자이기 때문에 리턴타입 없어야 함
		
		System.out.println(">> Member클래스의 기본 생성자를 호출 하셨습니다.");
		name = "익명";
	}
	
	// 2. 파라미터(==매개변수)가 있는 생성자
	//		매개변수란 괄호 속에 들어오는 변수
	public Member(String userid, String passwd, String name, int age, int point) {
		//파랑색은 인스턴스 변수 or static변수 
		//갈색은 지역변수
		
		userid = userid;
		// 지역변수이름과 인스턴스변수 이름 또는 static변수 이름이 같을경우,
		// 지역변수이름이 우선한다. so this 사용
		
		this.userid = userid; //파랑색 필드명과 같게 해주는게 좋음 근데 매번 같게못하니까 대명사처럼 this를 써줌 ex) 핸드폰과 볼펜을 저것,이것으로 부르듯이
		this.passwd = passwd; //인스턴스임을 표현하기위해 this를 써줌
		this.name = name;
		this.age = age;
		this.point = point;
		//this란 
	}
	
	//behavior, method, 행위, 기능
	//↓리턴타입이 없고, 파라미터가 없는 메소드 
	public void showInfo() {
		System.out.println("\n==="+name+"님의 회원정보 ===");
		System.out.println("1.ID: "+ userid);
		System.out.println("2.PW: " + passwd);
		System.out.println("3.NAME: " + name);
		System.out.println("4.AGE: " + age);
		System.out.println("5.POINT: " + point);
	}
	
	//↓리턴타입이 없고(리턴값이 없는 리턴타입. 반환할 형이 없으니까), 파라미터가 있는 메소드
	//void란? 해당 메소드를 실행만 해줄 뿐 리턴시켜주는 값이 없음을 말함
	public void changeInfo(String userid, String passwd, int point) {
		this.userid = userid;
		this.passwd = passwd;
		this.point = point;
	}
	
	
	//↓리턴타입이 있고 파라미터가 없는 메소드
	public String getMemberInfo() {
		String newInfo = ">> 회원정보 <<\n"+
				"▷아이디: " + userid
				+"\n▷암호: " + passwd
				+"\n▷성명: " + name
				+"\n▷나이: " + age+"세"
				+"\n▷포인트: "+ point+"Point";
		
		return newInfo; // newInfo의 정보를 Main에 있는 getMemberInfo에게 넘겨줘라
	}
	
	
//	public String changePasswd(String passwd) {
//		
//		String oldPwd = this.passwd;
//		this.passwd = passwd;
//		String msg = name+"님의 암호가 "+oldPwd+"에서"+passwd+"로 바꼈습니다.";
//		
//		return msg;
//	}
//	
	
	//↓리턴값이 있고, 파라미터도 있는 메소드
	public String changePasswd(String newPasswd) {
		
		String oldPasswd = passwd; //원래암호를 기억
		passwd = newPasswd; //새로운 암호 입력
		
		return name+"님의 암호가 \""+oldPasswd+"\"에서\""+passwd+"\"로 바꼈습니다.";
	}
	
	
}

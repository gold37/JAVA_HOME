package my.day12.c;

public class Gujikja extends Member { 
	/*
		 extends Member --> 부모(Member)에게 상속받아서 쓰겠다
		 Gujikja 클래스는 Member 클래스에서 정의해둔 field, method를 상속받아서 사용하겠다는 의미
		 Gujikja 클래스는 Member 클래스의 자식 클래스가 된다.	
		 Member 클래스는 Gujikja 클래스의 부모 클래스가 된다.	
	*/	
	
	// Gujikja 클래스의 field, attribute, property, 속성 정하기 (추상화)
	String birthday;
	
	
	// Gujikja 클래스의 behavior, method, 기능 정하기 (추상화)
	void showInfoGujikja() { // 구직자 정보 보여주기
	
		String info = "=========구직자 정보=========\n"
				+ "1.아이디: "+this.id+"\n"
				+ "2.암   호: "+this.pwd+"\n"
				+ "3.성   명: "+this.name+"\n"
				+ "4.생년월일: "+this.birthday+"\n";
		
		System.out.println(info);
		
	}// end of void showInfoGujikja() -----------------


	@Override // 메소드의 오버라이딩 (== 재정의)
	public void showInfo() {
		
		String info = "=========구직자 정보=========\n"
				+ "1.아이디: "+this.id+"\n"
				+ "2.암   호: "+this.pwd+"\n"
				+ "3.성   명: "+this.name+"\n"
				+ "4.생년월일: "+this.birthday+"\n";
		
		System.out.println(info);
		
	}
	
}

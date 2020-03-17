package my.day11.b.inheritance;

public class Company extends Member {
	/*
		 extends Member --> 부모(Member)에게 상속받아서 쓰겠다
		 Company 클래스는 Member 클래스에서 정의해둔 field, method를 상속받아서 사용하겠다는 의미
		 Company 클래스는 Member 클래스의 자식 클래스가 된다.	
		 Member 클래스는 Gujikja 클래스의 부모 클래스가 된다.	
	 */	

	// Company 클래스의  field, attribute, property, 속성 정하기 (추상화)
	String jobtype; // 회사 직종 타입 (제조업, 서비스업, IT , .. )
	
	//Gujikja 클래스의 behavior, method, 기능 정하기 (추상화)
	void showInfoCompany() {
		
		String info = "=========구직자 정보=========\n"
				+ "1.아이디: "+this.id+"\n"
				+ "2.암   호: "+this.pwd+"\n"
				+ "3.회사명: "+this.name+"\n"
				+ "4.직종명: "+this.jobtype+"\n";
		
		System.out.println(info);
		
	} // end of void showInfoCompany() -------------
	
	
	
}

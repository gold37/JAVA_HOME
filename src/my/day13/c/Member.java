package my.day13.c;

public abstract class Member implements InterMember { 
	// InterMember 인터페이스를 implements 하고 있어서 Member에 재정의 해야되는데 해봐야 자식클래스에서 재정의하고 있기 때문에 Override 안하고 abstract를 썼음
	
	// Member 클래스의 field, attribute, property, 속성 정하기 (추상화)
	String id, pwd, name; // Gujikja와 Company에서 공동으로 사용	
	// ---> id, pwd, name을 인터페이스 하면 final이 되기 때문에 변경이 불가능하게된다. 그러면 안되니까 얘네는 class로 해야됨
	
	// Member 클래스의 behavior, method, 기능 정하기 (추상화)
	@Override
	public boolean isExists(String id, String pwd) { // 아이디, 패스워드 유무 확인
		if(id.equals(this.id)&& pwd.equals(this.pwd)) { 
			return true; 
		}else { 
			return false; 
		} 
	}// end of boolean isExists(String id, String pwd)------------------
	 
}

package my.day11.b.inheritance;

public class Member {
	
	// Member 클래스의 field, attribute, property, 속성 정하기 (추상화)
	String id, pwd, name; // Gujikja와 Company에서 공동으로 사용
	
	
	// Member 클래스의 behavior, method, 기능 정하기 (추상화)
	boolean isExists(String id, String pwd) { // 아이디, 패스워드 유무 확인
		if(id.equals(this.id)&& pwd.equals(this.pwd)) {
			return true;
		}
		else {
			return false;
		}
	}// end of boolean isExists(String id, String pwd)------------------

}

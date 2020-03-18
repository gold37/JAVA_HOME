package my.day13.c;

public interface InterMember {
	
	// 미완성 메소드(==추상 메소드) 작성하기. 원래 메소드는 { } 가 있어야 하는데 얘는 없음
	void showInfo();  // public abstract가 생략되어져있음
	// 구직자 또는 구인회사의 정보를 출력해주는 메소드
	
	boolean isExists(String id, String pwd); // 미완성 메소드(추상메소드)
	// 구직자 또는 구인회사로 로그인시 아이디와 암호가 존재하는지 여부를 알려주는 메소드
	
}

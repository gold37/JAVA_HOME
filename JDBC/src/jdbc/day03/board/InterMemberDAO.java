package jdbc.day03.board;

import java.util.Map;

public interface InterMemberDAO {
	// DAO : Database Access Object 데이터베이스에 접근할 수 있는 객체
	// MVC 패턴에서 M (model) 도 DB와 연관된 일을 함
	
	int memberRegister(MemberDTO member); // 회원가입 메소드
	
	MemberDTO login(Map<String, String> paraMap); // 로그인 처리 메소드
	// -> DB에서 select 되어진 행에 아이디와 암호가 있으면 Member객체를 돌려주겠다.
}

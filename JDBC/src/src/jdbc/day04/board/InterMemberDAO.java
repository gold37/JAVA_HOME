package jdbc.day04.board;

import java.util.Map;

public interface InterMemberDAO {  // DAO(Database Access Object)

	int memberRegister(MemberDTO member);  // 회원가입 메소드
	                                       // DTO(Data Transfer Object) 쉽게말하면 행(row)이다. 
	
	MemberDTO login(Map<String, String> paraMap); // 로그인 처리 메소드
	
	// 게시판에서 글을 쓴 작성자에게 포인트 10 올려주기
	int updateMemberPoint(String userid);
	
}

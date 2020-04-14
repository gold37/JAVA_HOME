package jdbc.day04.board;

import java.util.List;
import java.util.Map;

public interface InterBoardDAO {

	// 게시판 글쓰기
	int write(BoardDTO bdto); // 추상 메소드 만듬
	// 		  ▲ 한 행 넣기

	List<BoardDTO> boardList(); // 글 목록 보기

	BoardDTO viewContents(Map<String,String> paraMap); // 글내용보기

	void updateViewCount(String boardNo); // 조회수 1 증가 시키기

	int updateBoard(Map<String, String> paraMap); // 글 수정하기 
}

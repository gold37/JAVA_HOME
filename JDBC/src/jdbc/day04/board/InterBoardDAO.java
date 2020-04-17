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

	int deleteBoard(String boardNo); // 글 삭제하기

	int writeComment(CommentDTO cmdto); // 댓글쓰기

	List<CommentDTO> commentList(String boardNo); // 특정 글에 대한 댓글들 내용 

	Map<String, Integer> statisticsByWeek(); // 최근 일주일간 일자별 게시글 작성건수

	List<Map<String, String>> statisticsByCurrentMonth(); // 이번달 일자별 게시글 작성건수
	
}

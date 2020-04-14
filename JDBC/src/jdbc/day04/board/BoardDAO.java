package jdbc.day04.board;

import java.sql.*;
import java.util.*;

import jdbc.connection.MyDBConnection;

public class BoardDAO implements InterBoardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private void close() {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	} // end of close()-----------
	
	
	@Override
	public int write(BoardDTO bdto) {
		
		int result = 0;
		
		try {
			conn = MyDBConnection.getConn();
			
			String sql = " insert into jdbc_board(boardno, FK_userid, subject, contents, boardpwd) "
					   + " values(board_seq.nextval, ?, ?, ?, ?) "; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bdto.getFk_userid()); 
			pstmt.setString(2, bdto.getSubject());
			pstmt.setString(3, bdto.getContents());
			pstmt.setString(4, bdto.getBoardpwd());
			 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}	
		
		return result;
		
		
	}


	// --- 글 목록보기 --- // 
	@Override
	public List<BoardDTO> boardList() {

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			conn = MyDBConnection.getConn();
			
			String sql = " select A.boardno as 글번호\n"+
						 "      , A.subject as 글제목\n"+
						 "      , B.name as 글쓴이\n"+
						 "      ,to_char( A.writeday,'yyyy-mm-dd hh24:mi:ss')  as 작성일자\n"+
						 "      , A.viewcount  as 조회수\n"+
						 " from jdbc_board  A  join  jdbc_member B\n"+
						 " on A.fk_userid = B.userid\n"+
						 " order by 1 desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				BoardDTO bdto = new BoardDTO();
				bdto.setBoardno(rs.getInt(1));
				bdto.setSubject(rs.getString(2));
				
				// join 문장
				MemberDTO member = new MemberDTO();
				member.setName(rs.getString(3));

				bdto.setMember(member);
				//
				
				bdto.setWriteday(rs.getString(4));
				bdto.setviewcount(rs.getInt(5));
				
				boardList.add(bdto);
				
			}// end of while(rs.next()) -------------
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return boardList;
	}

	// --- 글 내용보기 --- // 
	@Override
	public BoardDTO viewContents(Map<String,String> paraMap) {
		
		// 글내용, 작성자ID 
		BoardDTO bdto = null;
		
		try {
			conn = MyDBConnection.getConn();
			
			// 글내용, 작성자ID
			String sql = " select contents, fk_userid, subject "
					   + " from jdbc_board ";
			
			if(paraMap.get("boardpwd") != null) { 
				sql += " where boardno = ? " +
					   " and boardpwd = ? ";
			
				pstmt = conn.prepareStatement(sql); // Exception처리하라고 빨간줄 뜸. 그래서 try 사용함
				
				pstmt.setString(1, paraMap.get("boardNo"));
				pstmt.setString(2, paraMap.get("boardpwd"));
			}
			else {
				sql += " where boardno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("boardNo"));
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bdto = new BoardDTO(); // select할 행이 있다.
				bdto.setContents(rs.getString(1));
				bdto.setFk_userid(rs.getString(2));
				bdto.setSubject(rs.getString(3));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return bdto;
	}// end of public BoardDTO viewContents(Map<String,String> paraMap)---------

	
	
	// --- 조회수 1 증가 시키기 --- //
	@Override
	public void updateViewCount(String boardNo) {

		try {
			conn = MyDBConnection.getConn();
		
			String sql = " update jdbc_board set viewcount = viewcount +1 "
					   + " where boardno = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			pstmt.executeUpdate();
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}// end of updateViewCount(String boardNo)-----------

	// === 글 수정하기 ===  
		@Override
		public int updateBoard(Map<String, String> paraMap) {
			
			int result = 0;
			
			try {
				conn = MyDBConnection.getConn();
				
				String sql = " update jdbc_board set subject = ? "
						   + "                     , contents = ?  "
						   + " where boardno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("subject"));
				pstmt.setString(2, paraMap.get("contents"));
				pstmt.setString(3, paraMap.get("boardNo"));
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return result;
		}// end of public int updateBoard(Map<String, String> paraMap)------ 
}

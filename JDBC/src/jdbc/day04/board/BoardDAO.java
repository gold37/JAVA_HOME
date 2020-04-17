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
			
			String sql =" select  B.boardno, b.subject, M.name\n"+
						"         ,    to_char(B.writeday, 'yyyy-mm-dd hh24:mi:ss') as writeday\n"+
						"         ,    B.viewcount\n"+
						"         ,    nvl(C.COMMENTCNT, 0) as COMMENTCNT\n "+
						" from jdbc_board B JOIN jdbc_member M\n "+
						" on B.fk_userid = M.userid\n "+
						" LEFT JOIN ( select fk_boardno, count(*) as COMMENTCNT\n "+
						" from jdbc_comment\n "+
						" group by fk_boardno ) C\n "+
						" on B.boardno = c.fk_boardno\n "+
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
				bdto.setCommentcnt(rs.getInt(6));
				
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
					
			String sql = " select contents, fk_userid, subject "
					   + " from jdbc_board ";
			
			if(paraMap.get("boardPasswd") != null) { 
				sql += " where boardno = ? " +
					   " and boardpasswd = ? ";
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("boardNo"));
				pstmt.setString(2, paraMap.get("boardPasswd"));
			}
			else {
				sql += " where boardno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("boardNo"));
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bdto = new BoardDTO();
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
		}// end of updateBoard(Map<String, String> paraMap)------ 

		
		
		// === 글 삭제하기 ===  
		@Override
		public int deleteBoard(String boardNo) {

			int result = 0;
			
			try {
				conn = MyDBConnection.getConn();
				
				String sql = " delete from jdbc_board "
						   + " where boardno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardNo);
				
				result = pstmt.executeUpdate(); // 정상적이라면 1값이 나옴
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return result;	
			
		}// end of deleteBoard(String boardNo)

		
		// === 댓글 쓰기 === 
		@Override
		public int writeComment(CommentDTO cmdto) {

			int result = 0;
			
			try {
				conn = MyDBConnection.getConn();
				
				String sql = " insert into jdbc_comment(commentno, fk_boardno, fk_userid, contents) "
						   + " values(seq_comment.nextval, ?, ?, ?) "; 
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cmdto.getFk_boardno()); 
				pstmt.setString(2, cmdto.getFk_userid());
				pstmt.setString(3, cmdto.getContents());
				 
				result = pstmt.executeUpdate();
				
				if(result == 1) {
					conn.commit();
				}
				
			}catch(SQLIntegrityConstraintViolationException e) { // 제약조건이 위배됐을 경우 나오는 에러
				System.out.println(cmdto.getFk_boardno()+"번은 존재하지않는 원글 번호입니다.");
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}	
			
			return result;
		}


		// === 특정 글에 대한 댓글들 내용 === 
		@Override
		public List<CommentDTO> commentList(String boardNo) {
			
			
			List<CommentDTO> commentList = null; // 기존의 해오던 방식대로 new 해도 됨
			
			try {
				conn = MyDBConnection.getConn();
				
				String sql = " select C.commentno, C.contents, M.name, to_char(C.writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday "
						   + " from jdbc_member M join jdbc_comment C "
					   	   + " on M.userid = C.fk_userid "
						   + " where C.fk_boardno = ? "
						   + " order by 1 desc ";
				
				pstmt =	conn.prepareStatement(sql);
				pstmt.setString(1, boardNo);
				
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()) {
					
					cnt++; // 0에서 ++해서 1
					
					if(cnt==1) {
						commentList = new ArrayList<CommentDTO>();
					}
									
					CommentDTO cdto = new CommentDTO();
					cdto.setCommentno(rs.getInt(1)); 
					cdto.setContents(rs.getString(2)); // 댓글내용
					
					MemberDTO member = new MemberDTO();
					member.setName(rs.getString(3)); // 작성자 이름
					
					cdto.setMember(member);
					
					cdto.setWriteday(rs.getString(4));
									
					commentList.add(cdto);
				}// end of while-------------------------------------------
							
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return commentList;
		}// end of commentList(String boardNo)-------------


		// === 최근 일주일간 일자별 게시글 작성건수 ===
		@Override
		public Map<String, Integer> statisticsByWeek() {

			Map<String, Integer> resultMap = new HashMap<String, Integer>();
			
			try {
			
				conn = MyDBConnection.getConn();
				
				String sql =    "select  COUNT(*) as TOTAL\n"+
								"\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 6, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS6\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 5, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS5\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 4, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS4\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 3, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS3\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 2, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS2\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 1, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS1\n"+
								"            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate, 'yyyy-mm-dd' ), 1, 0)) as  TODAY\n"+
								"from jdbc_board\n"+
								"where  func_midnight( sysdate ) -  func_midnight( writeday ) < 7";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				resultMap.put("TOTAL", rs.getInt(1));
				resultMap.put("PREVIOUS6", rs.getInt(2));
				resultMap.put("PREVIOUS5", rs.getInt(3));
				resultMap.put("PREVIOUS4", rs.getInt(4));
				resultMap.put("PREVIOUS3", rs.getInt(5));
				resultMap.put("PREVIOUS2", rs.getInt(6));
				resultMap.put("PREVIOUS1", rs.getInt(7));
				resultMap.put("TODAY", rs.getInt(8));
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return resultMap;
			
		}// end of statisticsByWeek()--------------------


		// === 이번달 일자별 게시글 작성건수 ===
		@Override
		public List<Map<String, String>> statisticsByCurrentMonth() {

			List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
			
			try {
				
				conn = MyDBConnection.getConn();
				

				String sql = "select decode (grouping ( to_char(writeday, 'yyyymmdd')),0, to_char(writeday, 'yyyymmdd'), '전체') as Writeday -- grouping은 항상 0과 1밖에 안나옴. 0은 실제 데이터, 1은 null 값\n"+
							 "          , count(*) as CNT\n"+
							 "from jdbc_board\n"+
							 "where to_char(writeday, 'yyyymm') = to_char(sysdate, 'yyyymm')\n"+
							 "group by rollup ( to_char(writeday, 'yyyymmdd'))";
							
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					Map<String, String> map = new HashMap<String, String>();
					
					map.put("WRITEDAY", rs.getString(1));
					map.put("CNT", String.valueOf(rs.getInt(2)));
					
					mapList.add(map);
					
				} // end of while ------------------
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return mapList;
		} // end of statisticsByCurrentMonth()------------
		
		
		
		
		
}

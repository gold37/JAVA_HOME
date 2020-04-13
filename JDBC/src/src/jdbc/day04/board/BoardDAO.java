package jdbc.day04.board;

import java.sql.*;


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

}

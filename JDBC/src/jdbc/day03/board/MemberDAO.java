package jdbc.day03.board;

import java.sql.*;
import java.util.*;

public class MemberDAO implements InterMemberDAO {

	// *** 회원가입 메소드 *** //
	
	@Override
	public int memberRegister(MemberDTO member) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		 try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "myorauser", "eclass");
					
					
					String sql = " insert into jdbc_member(userseq, userid, pwd, name, mobile) "
							   + " values(user_seq.nextval, ?, ?, ?, ?) ";
				
					pstmt = conn.prepareStatement(sql);	
					pstmt.setString(1, member.getUserid()); 
					pstmt.setString(2, member.getPwd());
					pstmt.setString(3, member.getName());
					pstmt.setString(4, member.getMobile());
					
					result = pstmt.executeUpdate();
					
					
					
				} catch (ClassNotFoundException e) {
					System.out.println(">>> ojdbc6.jar 파일이 없거나 라이브러리에 등록이 안되었습니다.");
					e.printStackTrace();
				} catch (SQLIntegrityConstraintViolationException e) {
					System.out.println("에러메시지 : "+ e.getMessage());
					System.out.println("에러코드번호 : " + e.getErrorCode());
					System.out.println("이미 존재하는 아이디입니다. 다른 아이디를 입력하세요!");
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					
					try {
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
		return result;
	} // end of memberRegister() --------------

	@Override
	public MemberDTO login(Map<String, String> paraMap) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "myorauser", "eclass");
			
			
			String sql = " select userseq, userid, pwd, name, mobile, point, to_char(registerday, 'yyyy-mm-dd') AS registerday, status \n"+
						 " from jdbc_member\n"+
						 " where status = 1 \n"+
						 " and userid = ? \n"+
						 " and pwd = ? ";
		
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, paraMap.get("userid")); 
			pstmt.setString(2, paraMap.get("pwd"));
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				
				member.setUserseq(rs.getInt(1));
				member.setUserid(rs.getString(2));
				member.setPwd(rs.getString(3));
				member.setName(rs.getString(4));
				member.setMobile(rs.getString(5));
				member.setPoint(rs.getInt(6));
				member.setRegisterday(rs.getString(7));
				member.setStatus(rs.getInt(8));
				
			}
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(">>> ojdbc6.jar 파일이 없거나 라이브러리에 등록이 안되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return null;
	} // end of login(Map paramap)-----------
	
		
}

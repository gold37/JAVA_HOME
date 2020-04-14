package jdbc.day04.board;

import java.sql.*;
import java.util.*;

import jdbc.connection.MyDBConnection;

public class MemberDAO implements InterMemberDAO {

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
	
	// **** DB에 회원가입 메소드  **** // 
	@Override
	public int memberRegister(MemberDTO member) {
		
		int result = 0;
		
		try {

			conn = MyDBConnection.getConn();
			
			String sql = " insert into jdbc_member(userseq, userid, pwd, name, mobile) "
					   + " values(user_seq.nextval, ?, ?, ?, ?) "; 
			 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserid()); 
			pstmt.setString(2, member.getpwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getMobile());
			 
			result = pstmt.executeUpdate(); 
			
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("에러메시지 : "+e.getMessage());
			System.out.println("에러코드번호 : "+e.getErrorCode());
			System.out.println(">>> 아이디가 중복되었습니다. 새로운 아이디를 입력하세요!! ");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}		
		
		return result;
	}// end of public int memberRegister(MemberDTO member)------------

	
	// **** 로그인 처리 메소드  **** // 
	@Override
	public MemberDTO login(Map<String, String> paraMap) {
		
		MemberDTO member = null;
		
		try {
			
			conn = MyDBConnection.getConn(); // 매번 끊고 다시 하는게 아니라 연결된것을 계속 씀
						
			String sql = " select userseq, userid, pwd, name, mobile, point, to_char(registerday, 'yyyy-mm-dd') AS registerday, status \n"+ 
					     " from jdbc_member \n"+
					     " where status = 1 \n"+
					     " and userid = ? \n"+
					     " and pwd = ? ";
			 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid") ); 
			pstmt.setString(2, paraMap.get("pwd"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				
				member.setUserseq(rs.getInt(1));
				member.setUserid(rs.getString(2));
				member.setpwd(rs.getString(3));
				member.setName(rs.getString(4));
				member.setMobile(rs.getString(5));
				member.setPoint(rs.getInt(6));
				member.setRegisterday(rs.getString(7));
				member.setStatus(rs.getInt(8));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}		
		
		return member;
	}// end of public MemberDTO login(Map paramap)----------------- 

	
	// **** 포인트 추가 메소드  **** //
	@Override
	public int updateMemberPoint(String userid) {
		int result = 0;
		
		conn = MyDBConnection.getConn();
		
		try {
			String sql = " update jdbc_member set point = point + 10 "
					   + " where userid = ? ";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}

}





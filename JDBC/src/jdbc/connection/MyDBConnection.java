package jdbc.connection;

import java.sql.*;

public class MyDBConnection {

	// --> 1번째로 호출(작동) 되는 것  : static 변수
	// 리턴해줄 Connection 객체
	private static Connection conn = null;
	
	// --> 2번째로 호출(작동) 되는 것 : static 초기화 블럭
	static {
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "myorauser", "eclass");    
			
			conn.setAutoCommit(false); // 수동 commit으로 전환. 글썼는데 포인트 안올라갔을 경우엔 rollback 해줘야하기때문에. 
			
		} catch (ClassNotFoundException e) {
			System.out.println(">> ojdbc6.jar 파일이 없거나 라이브러리에 등록이 안 되었습니다.");
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	} // end of static {} ----------------
	
	
	// --> 3번째로 호출(작동) : static 메소드
	public static Connection getConn() {  // Connection conn을 리턴시켜주기
		return conn;
	}
	
	// --> 4번째로 호출(작동) : 생성자 
	private MyDBConnection() {} 
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	// == Connection conn 객체 자원 반납하기 == // 
	public static void closeConnection() {
		
		try {
		
			if(conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	} // end of closeConnection() -------------
	
	
	
	
	
}

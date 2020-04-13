/*
	===== Statement 와 PreparedStatement =====
	Statement 와 PreparedStatement 의 가장 큰 차이점은 캐시 사용유무 이다. 
	이들은 쿼리문장(SQL문)을 분석([==파싱 parsing] 문법검사, 인덱스 사용유무)하고 컴파일 후 실행된다.
	Statement는 매번 쿼리문장(SQL문)을 수행할때 마다 모든 단계(파싱 parsing)를 거치지만
	PreparedStatement 는 처음 한번만 모든 단계(파싱 parsing)를 수행한 후 캐시에 담아 재사용한다.
	그러므로 동일한 쿼리문장(SQL문)을 수행시 PreparedStatement가 DB에 훨씬 적은 부하를 주므로 성능이 좋아진다. 
	   또한  Statement 는 사용자가 입력한 단어(검색어 또는 입력단어)들이 보여지지만
	PreparedStatement 는 위치홀더(?)를 사용하므로 입력한 단어(검색어 또는 입력단어)들이 보여지지 않으므로 
	Statement 보다 PreparedStatement 가 보안성이 높으므로 PreparedStatement 를 주로 사용한다.
	    	
*/


package jdbc.day02.preparedstatement;

import java.sql.*;
import java.util.Scanner;

public class JdbcTest02_Insert {

	public static void main(String[] args) {
		
		Connection conn = null;
		/*

		  또는
		 Connection conn; 
		  오라클 데이터베이스 서버와  연결을 맺어줌
		
		 Connection은 어떤 집,
		 SQL문은 편지,
		 Statement는 우편배달부
		
		 */
		 PreparedStatement pstmt = null;
		 /*
			
			개발자가 SQL문(편지)을 작성했는데,
			작성한 SQL문을 어느 오라클 서버에서 실행할지 결정해야한다.
			이때 어느 오라클 서버인지는 Connection conn에서 알고,
			Connection conn에 전송할 SQL문(편지)은 PreparedStatement stmt(우편배달부)를 통해 전송된다.
			
		  */
		 
		 Scanner sc = new Scanner(System.in);
		
		
		 try {
		// 1. 오라클 드라이버 로딩
		 
			/*
			     === OracleDriver(오라클 드라이버)의 역할 ===
			     1). OracleDriver 를 메모리에 로딩시켜준다.
			     2). OracleDriver 객체를 생성해준다.
			     3). OracleDriver 객체를 DriverManager에 등록시켜준다. 
			         --> DriverManager 는 여러 드라이버들을 Vector에 저장하여 관리해주는 클래스이다. 
		    */
			 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		// 2. 어떤 오라클 서버에 연결 할래? 
			System.out.print("▷ 연결할 오라클 서버의 IP 주소: ");
			String ip = sc.nextLine();
			
			System.out.print("▷ 오라클 사용자명: ");
			String userName = sc.nextLine();
			
			System.out.print("▷ 암호: ");
			String pwd = sc.nextLine();
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@"+ip+":1521:xe", userName, pwd);
			// 연결하고자하는 서버의 ip, 오라클 서버에 붙는 계정명, 계정 암호
			// @localhost:1521 == @127.0.0.1:1521 -> 소켓이라 부름

			// >>> 수동 커밋으로 전환하기 <<< //
			conn.setAutoCommit(false);
			
			
		// 3. SQL문(편지)을 작성한다.
			System.out.print("▷ 글쓴이: ");
			String name = sc.nextLine();
			
			System.out.print("▷ 내용: ");
			String msg = sc.nextLine();
			
			
			String sql = " insert into jdbc_tbl_memo2(no, name, msg) "
					   + " values(jdbc_seq_memo2.nextval, ?, ?) ";
					// varchar2 일땐 '홑따옴표' 안하면 오류인데  위치홀더 (?)를 쓰면 홑따옴표도 안써도되고 안전하기도 함
			
			System.out.println("SQL : "+sql); // 내용 다 보이기 때문에 정보유출 가능성 있음. 안보이게 하기위해 prepared statement사용
		
		// 4. 연결한 오라클서버(conn)에 SQL문(편지)을 전달할 Statement객체 (우편배달부) 생성하기
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, name); // 1첫번째 ?에 name을 넣으라는 뜻. 1부터 시작하기 때문에 0쓰면 오류
			pstmt.setString(2, msg);
			
			
		// 5. Statement stmt 객체(우편배달부)가 작성된 SQL문(편지)을 오라클서버에 보내서 실행이 되어지도록 한다.
			int n = pstmt.executeUpdate();
			
			/*
			
				 pstmt.executeUpdate(); 에서 
				  실행되어질 sql문이 DDL문(create, alter, drop, truncate)이라면 리턴값이 0 이 나온다.
				  실행되어질 sql문이 DML문(insert, update, delete)이라면 리턴값이 적용된 행의갯수가 나온다. 	
				  
			*/
	//		System.out.println(n+"개 행이 입력됨");
			
			if(n==1) {
				
				do {
					System.out.print("▷ 입력하시겠습니까? [Y/N]");
					String yn = sc.nextLine();
					
					if("Y".equalsIgnoreCase(yn)) {
						conn.commit();
						System.out.println(">> 데이터 입력 성공 !!");
						break;
					}
					else if("N".equalsIgnoreCase(yn)) {
						conn.rollback();
						System.out.println(">> 데이터 입력 취소 !!");
						break;
					}
					else {
						System.out.println(">> Y 또는 N만 입력하세요");
					}
				} while (true);
				
			}
			else {
				System.out.println(">>> 삑 -- 데이터 입력에 오류가 발생했습니다 <<<");
			}
			
			// >>> 자동 커밋으로 전환하기 <<< //
			conn.setAutoCommit(true); 
			
		} catch (ClassNotFoundException e) {
			System.out.println(">>> ojdbc6.jar 파일이 없거나 라이브러리에 등록이 안되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 6. 사용했던 자원 반납하기
			/*
			 	반납의 순서는 생성순서의 역순으로 한다.
			 	
			 */
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		 
		sc.close();
	} // end of main () ---------------------
}

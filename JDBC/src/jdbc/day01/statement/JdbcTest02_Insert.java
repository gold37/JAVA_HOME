package jdbc.day01.statement;

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
		 Statement stmt = null;
		 /*
			
			개발자가 SQL문(편지)을 작성했는데,
			작성한 SQL문을 어느 오라클 서버에서 실행할지 결정해야한다.
			이때 어느 오라클 서버인지는 Connection conn에서 알고,
			Connection conn에 전송할 SQL문(편지)은 Statement stmt(우편배달부)를 통해 전송된다.
			
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
			
		// 3. 연결한 오라클서버(conn)에 SQL문(편지)을 전달할 Statement객체 (우편배달부) 생성하기
			stmt = conn.createStatement();
			
		// 4. SQL문(편지)을 작성한다.
			System.out.print("▷ 글쓴이: ");
			String name = sc.nextLine();
			
			System.out.print("▷ 내용: ");
			String msg = sc.nextLine();
			
			
			String sql = " insert into jdbc_tbl_memo(no, name, msg) "
					   + " values(jdbc_seq_memo.nextval, '"+name+"', '"+msg+"') ";
			
		// 5. Statement stmt 객체(우편배달부)가 작성된 SQL문(편지)을 오라클서버에 보내서 실행이 되어지도록 한다.
			int n = stmt.executeUpdate(sql);
			
			/*
			
				 stmt.executeUpdate(sql); 에서 
				  파라미터로 들어오는 sql 은 오로지 DML(insert, update, delete)문 사용이 가능하다.
				 stmt.executeUpdate(sql); 을 실행한 결과는 int 타입으로 숫자를 돌려주는데 
				 sql 이 insert 이라면 insert 되어진 행의 갯수를 돌려주고,
				 sql 이 update 이라면 update 되어진 행의 갯수를 돌려주고,
				 sql 이 delete 이라면 delete 되어진 행의 갯수를 돌려준다.
				  
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
				if(stmt != null) stmt.close();
				if(stmt != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		 
		sc.close();
	} // end of main () ---------------------
}

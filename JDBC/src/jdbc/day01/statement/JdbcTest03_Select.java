package jdbc.day01.statement;

import java.sql.*;
import java.util.Scanner;

public class JdbcTest03_Select {

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
		 
		 ResultSet rs = null;
		 // ▲ select 되어진 결과물을 저장하는 용도에 쓰임
		 
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
			
		// 3. 연결한 오라클서버(conn)에 SQL문(편지)을 전달할 Statement객체 (우편배달부) 생성하기
			stmt = conn.createStatement();
			
		// 4. SQL문(편지)을 작성한다.
			String sql = "select no, name, msg, to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') as writeday\n"+
						 "from jdbc_tbl_memo\n"+
						 "order by no desc";
			
		// 5. Statement stmt 객체(우편배달부)가 작성된 SQL문(편지)을 오라클서버에 보내서 실행이 되어지도록 한다.
			rs = stmt.executeQuery(sql);

			// stmt.executeQuery(sql); 에서 
			// 파라미터인 sql 은 오로지 select문 들어온다.
			// stmt.executeQuery(sql); 을 실행하면 select 되어진 결과물을 가져오는데 
			// 그 타입은 ResultSet 으로 가져온다.
			/*
			   === 인터페이스 ResultSet 의 주요한 메소드 ===
			   1. next()  : select 되어진 결과물에서 커서를 다음으로 옮겨주는 것. 리턴타입은 boolean
			   2. first() : select 되어진 결과물에서 커서를 가장 처음으로 옮겨주는 것. 리턴타입은 boolean
			   3. last()  : select 되어진 결과물에서 커서를 가장 마지막으로 옮겨주는 것 . 리턴타입은 boolean
			   
			   == 커서가 위치한 행에서 컬럼의 값을 읽어들이는 메소드 ==
			   getInt(숫자) : 컬럼의 타입이 숫자이면서 정수로 읽어들이때
			                  파라미터 숫자는 컬럼의 위치값 
			                 
			   getInt(문자) : 컬럼의 타입이 숫자이면서 정수로 읽어들이때
			                  파라미터 문자는 컬럼명 또는 alias명 
			                  
			   getLong(숫자) : 컬럼의 타입이 숫자이면서 정수로 읽어들이때
			                     파라미터 숫자는 컬럼의 위치값 
			                 
			   getLong(문자) : 컬럼의 타입이 숫자이면서 정수로 읽어들이때
			                     파라미터 문자는 컬럼명 또는 alias명                
			   
			   getFloat(숫자) : 컬럼의 타입이 숫자이면서 실수로 읽어들이때
			                      파라미터 숫자는 컬럼의 위치값 
			                 
			   getFloat(문자) : 컬럼의 타입이 숫자이면서 실수로 읽어들이때
			                      파라미터 문자는 컬럼명 또는 alias명 
			                      
			   getDouble(숫자) : 컬럼의 타입이 숫자이면서 실수로 읽어들이때
			                        파라미터 숫자는 컬럼의 위치값 
			                 
			   getDouble(문자) : 컬럼의 타입이 숫자이면서 실수로 읽어들이때
			                        파라미터 문자는 컬럼명 또는 alias명    
			                        
			   getString(숫자) : 컬럼의 타입이 문자열로 읽어들이때
			                        파라미터 숫자는 컬럼의 위치값 
			                 
			   getString(문자) : 컬럼의 타입이 문자열로 읽어들이때
			                        파라미터 문자는 컬럼명 또는 alias명                                                        
			*/
			System.out.println("------------------------------------------------------");
			System.out.println("글번호 \t 글쓴이 \t 글내용 \t 작성일자 \t");
			System.out.println("------------------------------------------------------");
			
			while(rs.next()) {
				/*
				 	rs.next()는 select 되어진 결과물에서 커서의 위치(행의 위치)를 다음으로 옮긴 후
				 	행이 존재하면 true, 행이 존재하지않으면 false를 반환한다.
				*/
				int no = rs.getInt(1); // order by 1 하는것과 같은 의미
				//또는 rs.getInt("no");
				String name = rs.getString(2);
				// 또는 rs.getString("name"); 또는 rs.getString("NAME"); 
				String msg = rs.getString(3); 
				String writeday = rs.getString(4);
				
				System.out.println(no+"\t"+name+"\t"+msg+"\t"+writeday);
			}
		
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

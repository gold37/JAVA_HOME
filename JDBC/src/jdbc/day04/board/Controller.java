package jdbc.day04.board;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import jdbc.connection.MyDBConnection;

public class Controller {

	InterMemberDAO mbrdao = new MemberDAO(); // 실제로 DB에 insert해줄 DAO (Data Access Object) => 데이터베이스에 연결하여 관련된 업무(DDL문, DML문, DQL문)를 처리해주는 객체
	// 원래 회원가입 메소드 안에 있던건데 로그인에도 쓸거라서 계속 new해주지 말고 밖으로 빼내서 계속 쓰려고 뺌
	
	InterBoardDAO bdao = new BoardDAO();
	
	// --- 회원가입 메소드 ---
	public int memberRegister(Scanner sc) {
		// memberRegister 메소드 만들어 줌
		int result = 0; // return 타입 int
		
		System.out.println("\n >>> --- 회원가입 --- <<< \n");

		System.out.print("1. 아이디 : ");
		String userid = sc.nextLine();
		
		System.out.print("2. 암호 : ");
		String pwd = sc.nextLine();
		
		System.out.print("3. 회원명 : ");
		String name = sc.nextLine();
		
		System.out.print("4. 연락처(휴대폰) : ");
		String mobile = sc.nextLine();
		
		MemberDTO member = new MemberDTO(); // Data Transfer Object => 데이터 전송 단위(객체) => 행(row)
		member.setUserid(userid); // 입력받은것을 set 객체에 넣음
		member.setpwd(pwd);
		member.setName(name);
		member.setMobile(mobile);
		
		result = mbrdao.memberRegister(member);
		
		if(result == 1) {
		
			Connection conn = MyDBConnection.getConn();
			
			do {
				System.out.print(">> 회원가입을 정말 하시겠습니까? [Y/N]");
				String yn = sc.nextLine();
			
				try {
					if("y".equalsIgnoreCase(yn)) {
					conn.commit();
					break;
					}
					else if ("n".equalsIgnoreCase(yn)) {
					conn.rollback();
					result = 0;
					break;
				}else {
					System.out.println("Y 또는 N만 입력하세요!");
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} while (true);
			
		}// end of if(result == 1) --------------------
		
		return result;
	} // end of memberRegister(Scanner sc)--------

	
	
	// --- 로그인 ---
	public MemberDTO login(Scanner sc) {//로그인된 사람이 누구인지 알아야 하기 때문에 return타입 MemberDTO
		
		MemberDTO loginMember = null;
		
		System.out.print("▷ 아이디 : ");
		String userid = sc.nextLine();
		
		System.out.print("▷ 암호 : ");
		String pwd = sc.nextLine();
		
		Map<String, String> paraMap = new HashMap<String, String>(); 
		paraMap.put("userid", userid); 
		//      ▲ Map에 값을 넣자는 메소드
		paraMap.put("pwd", pwd);
		
		loginMember = mbrdao.login(paraMap);
		
		return loginMember;
		
	}// end of MemberDTO login(Scanner sc)------------



	// --- 글쓰기 ---
	public int write(MemberDTO loginMember, Scanner sc) {
		
		int result = 0;
		System.out.println("\n ++ 글쓰기 ++");
		
		System.out.println("1.작성자 명 : "+loginMember.getName()); // 작성자 이름 자동으로 보이게함
		
		System.out.print("2.글제목 : ");
		String subject = sc.nextLine();
		
		System.out.print("3.글내용 : ");
		String contents = sc.nextLine();
		
		System.out.print("4.글암호 : ");
		String boardpwd = sc.nextLine();
		
		BoardDTO bdto = new BoardDTO();
		bdto.setFk_userid(loginMember.getUserid()); // 글쓴이 아이디 가져오기
		bdto.setSubject(subject); 
		bdto.setContents(contents);
		bdto.setBoardpwd(boardpwd);
		
		// DAO에게 요청 보내기. 자주쓰니까 저~ 위에 밖으로 빼냄 
		
		int n1 = bdao.write(bdto); // 성공유무 알아오기. 성공하면 n1 => 1
		int n2 = mbrdao.updateMemberPoint(loginMember.getUserid()); // 성공유무 알아오기. 성공하면 n2 => 1
	
		Connection conn = MyDBConnection.getConn(); // 싱글톤패턴
		
		if(n1 == 1 && n2 == 1) {
			
			do {
				System.out.print(">> 글쓰기를 등록 하시겠습니까? [Y/N]");
				String yn = sc.nextLine();
				
				try {
					if("y".equalsIgnoreCase(yn)) {
						conn.commit();
						result = 1;
						break;
					}else if("n".equalsIgnoreCase(yn)) {
						conn.rollback();
						result = -1;
						break;
					}else {
						System.out.println(">> Y 또는 N만 입력하세요 !");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} while (true);
			
		} // end of if(n1 == 1 && n2 == 1)------------
		
		return result;
	} // end of write(MemberDTO loginMember, Scanner sc) ----------


	
	
	// --- 글 목록 보기 ---
	public void boardList() {
		
		List<BoardDTO> boardList = bdao.boardList(); 
		// 			   ▲ 사이즈가 0이냐(게시글 존재 X) 0보다 크냐?(게시글 존재 O) 절대 null값 존재 할 수 없음 
		  
		StringBuilder sb = new StringBuilder(); // sb에 차곡차곡 쌓을거임
		
		if(boardList.size() > 0) {
			// 게시글이 존재하는 경우
			
			for(int i=0; i<boardList.size(); i++) {
				sb.append(boardList.get(i).listInfo()+"\n"); // boardList에서 꺼내오고 순차적으로 하나씩 불러옴
			} // end of for() ------------------
			
			System.out.println("\n------------------- [게시글 목록] --------------------");
			System.out.println("글번호\t글제목\t작성자\t작성일자\t\t조회수");
			System.out.println("-----------------------------------------------------");
			System.out.println(sb.toString());
			
		}
		else {
			// 게시글이 존재하지 않는 경우
			System.out.println(">>> 글 목록이 없습니다. \n");
		}
	}// end of boardList()-----------
	
	
	// --- 글 내용 보기 ---
	public void viewContents(MemberDTO loginMember, Scanner sc) {
		System.out.println("\n >>> 글내용 보기 <<<");
		
		System.out.print("▷ 글번호 : ");
		String boardNo = sc.nextLine();
		
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("boardNo", boardNo);
		
		BoardDTO bdto = bdao.viewContents(paraMap);
		
		if(bdto != null) {
			// 존재하는 글 번호를 입력한 경우
			System.out.println("[글내용]"+bdto.getContents());
			
			if(!(bdto.getFk_userid().equals(loginMember.getUserid()))) {
			// 현재 로그인 된 사용자가 자신의 글이 아닌 다른 사용자가 쓴 글을 조회했을 경우에만 조회수 1증가
				bdao.updateViewCount(boardNo);  
				
			}
		}
		else {
			// 존재하지 않는 글 번호를 입력한 경우
			System.out.println(">> 글번호"+boardNo+"번은 목록에 존재하지 않습니다. \n");
		}
		
	}// end of viewContents(MemberDTO loginMember, Scanner sc)---------------
	
	// ---- 글 수정 하기 ----
	public int updateBoard(MemberDTO loginMember, Scanner sc) {
		
		int result = 0;
		
		Connection conn = MyDBConnection.getConn();
		
		System.out.println("\n>>> 글 수정 하기 <<<");
		
		Map<String,String> paraMap = new HashMap<String,String>();
		
		System.out.print("▷수정할 글번호 : ");
		String boardNo = sc.nextLine(); 
		paraMap.put("boardNo", boardNo);
		
		BoardDTO bdto = bdao.viewContents(paraMap);
		
		if(bdto != null) {
			// 수정할 글번호가 글목록에 존재하는 경우이라면 
			
			if( bdto.getFk_userid().equals(loginMember.getUserid()) ) {
				// 로그인한 사용자가 쓴 글을 수정할 경우 
				
				System.out.print("▷글암호 : ");
				String boardpwd = sc.nextLine(); 
				paraMap.put("boardpwd", boardpwd);
				
				bdto = bdao.viewContents(paraMap); 
				
				if(bdto != null) {
					// 글암호가 올바른 경우이라면
					// 수정할 글을 보여주고서 글수정 작업에 들어간다.
					System.out.println("------------------------------");
					System.out.println("글제목 : " + bdto.getSubject());
					System.out.println("글내용 : " + bdto.getContents());
					System.out.println("------------------------------\n");
					
					System.out.print("▷글제목 : ");
					String subject = sc.nextLine();
					
					System.out.print("▷글내용 : ");
					String contents = sc.nextLine();
					
					paraMap.put("subject", subject);
					paraMap.put("contents", contents);
					
					int n = bdao.updateBoard(paraMap);
					
					if(n==1) {
						
						do {
							System.out.print("▷정말로 수정하시겠습니까?[Y/N] ");
							String yn = sc.nextLine();
							
							try {
								if("y".equalsIgnoreCase(yn)) {
									conn.commit();
									result = 5;
									break;
								}
								
								else if("n".equalsIgnoreCase(yn)) {
									conn.rollback();
									result = 4;
									break;
								}
								
								else {
									System.out.println(">> Y 또는 N 만 입력하세요!!");
								}
							} catch(SQLException e) {
								e.printStackTrace();
							}
							
						} while (true);
						
					}
					else {
						// update 작업이 실패한 경우이라면 
						result = 3;
					}
					
				}
				else {
					// 글암호가 틀린 경우이라면
					result = 2;
				}
				
			}
		
			else {
				// 로그인한 사용자가 쓴 글이 아닌 다른 사용자가 쓴 글을 수정할 경우
				result = 1;
			}
			
		}
				
		return result; 
		// 수정할 글번호가 글목록에 존재하지 않을 경우 0 을 리턴함. 
	}
		

	// ---- 글삭제하기 ----
	public int deleteBoard(MemberDTO loginMember, Scanner sc) {
		// TODO Auto-generated method stub
		return 0;
	}	

	// --- Connection 자원반납 ---
	public void appExit() {
		
		MyDBConnection.closeConnection();
		
	} // end of appExit() ------------



	
}
	

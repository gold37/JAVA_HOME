package jdbc.day04.board;

import java.util.*;

public class BoardView_Main {

	// === 회원 및 게시판의 내용(메뉴, 결과물 ....)을 보여주는 곳 === //
	// 어떤 입력화면 이나 출력 결과물을 보여주는 곳을 "View 단" 이라고 부른다.  

	// **** 시작 메뉴 **** //
	static void menu_Start() {
		
		System.out.println("\n >>> ----- 시작메뉴 ----- <<< \n"
				         + "1.로그인    2.회원가입    3.프로그램종료 \n "
				         + "------------------------------\n");
		System.out.print("▷ 메뉴번호선택 : ");
	} // end of menu_Start()-------------
	
	
	
	// **** 게시판 메뉴 **** //
	static MemberDTO menu_Board(MemberDTO loginMember, Scanner sc, Controller ctrl) {
		// ▲ loginMember를 return하기 때문에

		String menuNo = ""; // do 안에 선언하면 while()안에 선언할 수 없어서 밖으로 빼냄
		String adminMenu = ("admin".equals(loginMember.getUserid())) ? " 10.모든회원 정보 조회":""; 
		
		
		do {

			System.out.println("\n --------------- 게시판 메뉴["+loginMember.getName()+"님 로그인 중 ♪] ---------------- \n"
							 + "1.글 목록보기  2.글 내용보기  3.글쓰기  4.댓글쓰기  \n"
							 + "5.글 수정하기 6.글 삭제하기 7.최근 일주일간 일자별 게시글 작성 건수 \n"
							 + "8.이번달 일자별 게시글 작성건수 9.로그아웃"+adminMenu+"\n"
							 + "-------------------------------------------------------");
						 
			System.out.print("▷ 메뉴번호 선택 : ");
			menuNo = sc.nextLine();
			
			switch (menuNo) {
			case "1": // 글 목록보기
				ctrl.boardList();
				break;

			case "2": // 글 내용보기
				ctrl.viewContents(loginMember, sc);
				break;

			case "3": // 글쓰기
				int n = ctrl.write(loginMember, sc); // 로그인된 사람의 정보를 넘기고, 입력값도 받아옴
			//  ▲ insert 할거니까 return타입 int 
				if(n==1) {
					System.out.println(">> 글쓰기 성공! <<\n");
				}else if(n==-1) {
					System.out.println(">> 글쓰기 취소 << \n");
				}else {
					System.out.println(">> 글쓰기 실패 ㅠ_ㅠ <<\n");
				}
				
				break;

			case "4": // 댓글쓰기
				
				n = ctrl.writeComment(loginMember, sc);
				
				if(n==1)
					System.out.println(">> 댓글쓰기 성공 ! <<");
				else
					System.out.println(">> 댓글쓰기 실패 ! <<");
				
				break;
				
				
			case "5": // 글수정하기
				n = ctrl.updateBoard(loginMember, sc);
				
				if(n==0)
					System.out.println(">> 수정할 글번호가 글목록에 존재하지 않습니다. <<  \n");
				else if(n==1)
					System.out.println(">> 다른 사용자의 글은 수정불가 합니다!! <<  \n");
				else if(n==2)
					System.out.println(">> 글암호가 올바르지 않습니다 <<  \n");
				else if(n==3)
					System.out.println(">> 글 수정 실패!! << \n");
				else if(n==4)
					System.out.println(">> 글 수정 취소!! << \n");
				else if(n==5)
					System.out.println(">> 글 수정 성공!! << \n");
				break;	
				
				
			case "6": // 글삭제하기
				n = ctrl.deleteBoard(loginMember, sc);
				
				if(n==0) 
					System.out.println(">> 삭제할 글 번호가 목록에 존재하지 않습니다. << \n");
				else if(n==1)
					System.out.println(">> 글 삭제 성공!! << \n");
				else if(n==2)
					System.out.println(">> 글 암호가 올바르지 않습니다. << \n");
				else if(n==3)
					System.out.println(">> 글 삭제 실패!! <<");
				else if(n==4)
					System.out.println(">> 글 삭제 취소!! << \n");
				else if(n==5)
					System.out.println(">> 글 삭제 성공!! << \n");					
				break;	
				
				
			case "7" : // 최근 일주일간 일자별 게시글 작성건수
				ctrl.statisticsByWeek();
				break;
			
			case "8" : // 이번달 일자별 게시글 작성건수
				ctrl.statisticsByCurrentMonth();
				break;
				
			case "9": // 로그아웃
				loginMember = null; // 로그아웃하면 다른메뉴 못하게 확실하게 처리해줌
				System.out.println(">> 안녕히가세요 *^^* << \n");
				break;
				
			case "10": // 모든 회원 정보 조회(관리자 전용 메뉴)
				
				if("admin".equals(loginMember.getUserid())) {
					ctrl.selectAllMember();
					break;
				} else {
					System.out.println("메뉴에 없는 번호입니다.\n");
					break;
				}
				
			default:
				System.out.println("메뉴에 없는 번호입니다.\n");
				break;
			} // end of switch
			
		} while (!"9".equals(menuNo)); // 로그아웃 시 do~while 종료
		
		return loginMember; // null 값 반환
		// 또는 case "5"에 loginMember=null;를 지우고 return null;해줘도 됨
		
	} // end of menu_Board() ---------
	
	
	public static void main(String[] args) {
	
		Controller ctrl = new Controller(); // Controller 호출
		
		Scanner sc = new Scanner(System.in);
		
		String menuNo_Start = "";
		do {
			// >>> 시작메뉴 <<< //
			menu_Start();
			
			menuNo_Start = sc.nextLine();
			
			switch (menuNo_Start) {
				case "1":  // 로그인
					MemberDTO loginMember = ctrl.login(sc); // 로그인된 사람의 정보를 loginuser에 넘김
					
					if(loginMember != null) {
						System.out.println("\n Yeah ~ 로그인 성공 !! \n");
						loginMember = menu_Board(loginMember, sc, ctrl); // 로그인이 성공되면 menu_Board() 작업 수행
									// 		   	 ▲ 로그인된 사람 넘겨줌(~님 로그인중 하기위해서)
						//System.out.println("확인용:"+loginMember);
						//확인용:null
					}
					else {
						System.out.println("\n Nooo.. 로그인 실패 !! \n");
					}
					
					break;
					
				case "2":  // 회원가입
					int n = ctrl.memberRegister(sc); // n = Controller의 result값
				//  ▲ insert된 행의 갯수가 나오기 때문에 리턴 타입 int로 줌 
					if(n==1) {
						System.out.println("\n Yeah ~ 회원가입 성공 ");
					}
					else {
						System.out.println("\n Nooo.. 회원가입 실패 ");
					}
					break;	
					
				case "3":  // 프로그램종료
					
					ctrl.appExit(); // Connection 자원반납
					break;	
				
				default:
					System.out.println(">>> 시작메뉴에 없는 번호 입니다  <<<");
					break;
			}// end of switch-----------------------
			
		} while (!"3".equals(menuNo_Start));
		
		
		sc.close();
		
		System.out.println("~~~ 프로그램 종료 ~~~");

	}// end of main()--------------------------------------

}







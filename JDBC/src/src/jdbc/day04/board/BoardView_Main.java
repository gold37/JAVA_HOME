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
		
		do {
			
			System.out.println("\n --------------- 게시판 메뉴["+loginMember.getName()+"님 로그인 중 ♪] ---------------- \n"
							 + "1.글 목록보기  2.글 내용보기  3.글쓰기  4.댓글쓰기  5.로그아웃\n"
							 + "-------------------------------------------------------");
							 
			System.out.print("▷ 메뉴번호 선택 : ");
			menuNo = sc.nextLine();
			
			switch (menuNo) {
			case "1": // 글 목록보기
				
				break;

			case "2": // 글 내용보기
				
				break;

			case "3": // 글쓰기
				int n = ctrl.write(loginMember, sc); // 로그인된 사람의 정보를 넘기고, 입력값도 받아옴
			//  ▲ insert 할거니까 return타입 int 
				if(n==1) {
					System.out.println(">> 글쓰기 성공!\n");
				}else if(n==-1) {
					System.out.println(">> 글쓰기 취소 ");
				}else {
					System.out.println(">> 글쓰기 실패 ㅠ_ㅠ");
				}
				
				break;

			case "4": // 댓글쓰기
				
				break;

			case "5": // 로그아웃
				loginMember = null; // 로그아웃하면 다른메뉴 못하게 확실하게 처리해줌
				System.out.println(">> 안녕히가세요 *^^* << \n");
				break;

			default:
				System.out.println("메뉴에 없는 번호입니다.\n");
				break;
			} // end of switch
			
		} while (!"5".equals(menuNo)); // 로그아웃 시 do~while 종료
		
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







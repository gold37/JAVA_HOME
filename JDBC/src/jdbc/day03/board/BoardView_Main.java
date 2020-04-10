package jdbc.day03.board;

import java.util.*;

public class BoardView_Main {

	// == 게시판의 내용(메뉴, 결과물 등등)을 보여주는 곳
	// 무엇인가 입력화면이나 출력 결과물을 보여주는 곳을 "View 단" 이라고 부른다. 
	
	// *** 시작 메뉴 *** //
	static void menu_Start() {
		System.out.println("\n >>> ----- 시작메뉴 ------ <<< \n"
						 + "1. 로그인		2. 회원가입	3. 프로그램 종료\n"
						 + "--------------------------------------\n");
		System.out.print("♣ 메뉴 번호 선택 : ");
	} 
	
	
	
	// *** 회원가입 메뉴 *** //
	static void menu_Member(Scanner sc) {
		System.out.println("\n >>> ----- 회원가입 ------ <<< \n");
		
		System.out.print("1. 아이디 : ");
		String userid = sc.nextLine();

		System.out.print("2. 암호 : ");
		String pwd = sc.nextLine();

		System.out.print("3. 회원명 : ");
		String name = sc.nextLine();
		
		System.out.print("4. 연락처 : ");
		String mobile = sc.nextLine();
		
		MemberDTO member = new MemberDTO();
		member.setUserid(userid); // 은닉화(캡슐화)했기 때문에 set으로 받음 
		member.setPwd(pwd);
		member.setName(name);
		member.setMobile(mobile);
		
		InterMemberDAO mbrdao = new MemberDAO();
		int n = mbrdao.memberRegister(member);

		if(n==1) {
			System.out.println("\n짝짝짝 회원가입을 축하드립니다 !\n");
		}else {
			System.out.println("\nT^T 회원가입 실패 ..\n");
		}
		
	}// end of menu_Member(Scanner sc)----------------
	
	
	// *** 로그인 메뉴 *** //
	static MemberDTO login(Scanner sc) {
		
		MemberDTO member = null;
		
		System.out.print("▷ 아이디 : ");
		String userid = sc.nextLine();
		
		System.out.print("▷ 암호 : ");
		String pwd = sc.nextLine();
		
		
		Map<String, String> paraMap = new HashMap<String, String>();
		// 위의 Map은 key도 String value값도 String
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd);
		
		InterMemberDAO mbrdao = new MemberDAO();
		member = mbrdao.login(paraMap);
		
		if(member != null) {
			System.out.println("\n로그인 성공");
		}
		else {
			System.out.println("\n로그인 실패");
		}
		
		return member;
	} // end of login(Scanner sc)------------
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String menuNo_Start = ""; // while()안에 menuNo_Start 쓰려고 이렇게 밖으로 뺌
		
		do {
			// >>> 시작메뉴 <<< // 
			
			menu_Start();
			menuNo_Start = sc.nextLine();

			switch (menuNo_Start) {
			case "1": // 로그인
				MemberDTO loginuser = login(sc);
				break;
				
			case "2": // 회원가입
				menu_Member(sc);
				break;
				
			case "3": // 프로그램 종료
				
				break;
			
			default:
				System.out.println("삐익 X_X 시작 메뉴에 없는 번호입니다.");
				break;
			} // end of switch()--------
			
			
		} while (!"3".equals(menuNo_Start));
		
		sc.close();
		System.out.println("프로그램 종료.");
		
		
		
	} // end of main() ----------------------

}

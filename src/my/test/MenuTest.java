package my.test;

import java.util.Scanner;

public class MenuTest {

   
   static public class Gujikja {
      
//      *** Gujikja 클래스의 속성 정하기(추상화 작업 == 필요한 속성과 메소드를 만드는 작업) ***
      
      String userid;    // 아이디
      String passwd;    // 비밀번호
      String name;    // 성명
         
      
//      *** 생성자 정의하기 ***
      public Gujikja(){ }
      
      public Gujikja(String userid, String passwd, String name) {
         this.userid =userid;
         this.passwd = passwd;
         this.name = name;      
      }   
      
      
//      *** Gujikja 클래스의 기능 정하기 ***   
      boolean isGujikjaExists(String userid, String passwd) {
         if(this.userid.equals(userid) && 
            this.passwd.equals(passwd)) 
            return true;
         else
            return false;
      }//end of isGujikjaExists         
   }

   
   // 회원가입을 시켜주는 메소드
    static Gujikja register(Scanner sc, Gujikja[] gjArr) {
        System.out.println("\n>>> 회원가입 <<<");
      
      System.out.print("아이디 입력: ");
      String userid = sc.nextLine();
      
      System.out.print("암호 입력: ");
      String passwd = sc.nextLine();
      
      System.out.print("성명 입력: ");
      String name = sc.nextLine();
            
      Gujikja gj = new Gujikja(userid, passwd, name);
      
      boolean flag = false;
      
      for(int i=0; i<gjArr.length; i++) {
         if(gjArr[i] == null) {
            gjArr[i] = gj;
            flag = true;
            break;
         }
      }// end of for
      if(flag) {
         System.out.println("\n*** 회원가입을 축하드립니다. ***\n");
      }
      else {
         System.out.println(">> 정원이 마감되어 가입이 불가합니다. \n");
      }
      return null;
   }
   
//   === 로그인을 해주는 메소드 생성하기 ===
   static void login(Scanner sc, Gujikja[] gjArr) { 
         
      System.out.println("\n=== 로그인  ===");
      System.out.print("▷ 아이디 : ");
      String userid = sc.nextLine();
      
      System.out.print("▷  암호: ");
      String passwd = sc.nextLine();
      
      boolean flag = false;
      for(int i=0; i<gjArr.length; i++) {
         
         if(gjArr[i]!=null && 
            gjArr[i].isGujikjaExists(userid, passwd)) {           
            flag = true;
            break; // for문을 빠져나간다.
         }
         
      }//end of for ----------------------------------
      
      String result ="";
      if(flag == true) {
         
         do {
             System.out.println("\n=== 게시판 메뉴 ===\n"
                     +"1.목록보기  2.글쓰기 3.로그아웃\n");
 
              System.out.print("▶▶  메뉴번호 선택 => ");
            
            String menuNo = sc.nextLine();
            
            switch (menuNo) {            
               case "1":   //목록보기
                  System.out.println(">> 게시판 목록보기 입니다. <<");               
                  break;
               case "2":   //글쓰기   
                  System.out.println(">> 게시판 글쓰기 입니다. <<");
                  break;            
            }//end of switch----------------------------         
            if("3".equals(menuNo))
            break;         
         } while (true);
                  
      }
      else {
         result = ">>> 로그인 실패!!  <<<\n";
      }
      
      System.out.println(result);
               
   }//end of login ---------------------------------
   
   
   
   public static void main(String[] args) {
      // 먼저 생성되어진 구직자를 저장시키는 공간 만들기      
      Gujikja[] gjArr = new Gujikja[5];
      
      gjArr[0] = new Gujikja();      
      gjArr[0] = new Gujikja("leess", "1234", "이순신");
         
      Scanner sc = new Scanner(System.in);
      
      do {
         System.out.println("== 시작 메뉴  ==\n"
                  +"1.로그인  2.회원가입  3.프로그램종료\n");

           System.out.print("▶▶  메뉴번호 선택 => "); 
         
         String menuNo = sc.nextLine();
         
         switch (menuNo) {   
            case "1":   //로그인
               login(sc, gjArr);               
               break;
            case "2":   //회원가입      
               register(sc, gjArr);
               break;
            default:
               System.out.println(">>> 메뉴에 없는 것을 선택하셨습니다.\n");
               break;
         }//end of switch----------------------------
         
         if("3".equals(menuNo))
         break;
      
      } while (true);
               
      
      sc.close();
      System.out.println("\n>>> 프로그램 종료  <<<");
      
   }// end of main----------------------------------------------------

  
}


/*



package my.test;

import java.util.Scanner;

public class MenuTest {

	// === 시작 메뉴 메소드 === //
	static void startMenu() {
		
		System.out.println("\n  == 시작메뉴 ==\n"
				         + " 1.로그인  2.회원가입  3.프로그램종료\n");
		
		System.out.print("▷ 메뉴번호 선택 => ");
		
	}// end of void startMenu()--------------------------
	
	
	// === 로그인 처리 메소드 === //
	static boolean login(Scanner sc) {
		
		System.out.println("\n === 로그인 ===");
		
		System.out.print("▷ 아이디 : ");
		String id = sc.nextLine(); 
		
		System.out.print("▷ 암호 : ");
		String pwd = sc.nextLine(); 
		
		if("leess".equals(id) && "1234".equals(pwd))
			return true;
		else
			return false;
	}// end of void startMenu()--------------------------
	
	
	// === 게시판 메뉴 메소드 === //
	static void startBoard(Scanner sc) {
		
		String strMenuNo = "";
		
		do {
			System.out.println("\n  == 게시판 메뉴 ==\n"
			         + " 1.목록보기  2.글쓰기  3.로그아웃\n");
	
			System.out.print("▷ 메뉴번호 선택 => ");
			strMenuNo = sc.nextLine();
			
			switch (strMenuNo) {
				case "1":  // 목록보기
					System.out.println(">> 게시판 목록보기 입니다. <<");	
						
					break;
	
					
				case "2":  // 글쓰기
					System.out.println(">> 게시판 글쓰기 입니다. <<");
					
					break;
					
					
				case "3":  // 로그아웃
					
					break; // switch 의 break 인 것이다.	
					
				default:   // 메뉴에 없는 것을 선택한 경우 
					System.out.println(">>> 게시판 메뉴에 없는 번호 입니다.");
					break;
			} // end of switch-------------------
			
		} while( !("3".equals(strMenuNo) ) );

	}// end of void startBoard()--------------------------
	
	
	// === 회원가입 메소드 === //
	static void registerMember(Scanner sc) {
		
		System.out.println("\n  >>> 회원가입  <<<");
		
		System.out.print("1. 아이디 입력: ");
		String id = sc.nextLine();
		
		System.out.print("2. 암호 입력: ");
		String pwd = sc.nextLine();
		
		System.out.print("3. 성명 입력: ");
		String name = sc.nextLine();
		
		System.out.println("\n *** 회원가입을 축하드립니다. *** \n");
		
	}// end of void startBoard()--------------------------
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String strMenuNo = "";
		boolean isLogin = false;
		
		do {
			startMenu();
			
			strMenuNo = sc.nextLine(); 
			
			switch (strMenuNo) {
				case "1":  // 로그인
					isLogin = login(sc);
					
					if(isLogin) 
						startBoard(sc);
					else
						System.out.println(">> 로그인 실패 !! <<\n");	
						
					break;
	
					
				case "2":  // 회원가입
					registerMember(sc);
					
					break;
					
					
				case "3":  // 프로그램종료
					
					break; // switch 의 break 인 것이다.	
					
				default:   // 메뉴에 없는 것을 선택한 경우 
					System.out.println(">>> 메뉴에 없는 번호 입니다.\n");
					break;
				} // end of switch-------------------
			
		} while ( !("3".equals(strMenuNo)) ); // end of do~while-----------

		
		sc.close();
		System.out.println("\n>> ~~~ 프로그램 종료 ~~~ <<");
	}// end of main()---------------------------------

}



*/
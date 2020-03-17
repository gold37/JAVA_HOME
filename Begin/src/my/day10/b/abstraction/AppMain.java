package my.day10.b.abstraction;

import java.util.Scanner;

public class AppMain {

	// == 메뉴를 보여주는 메소드 생성하기 == //
	static void showMenu(Gujikja loginUser) { // 맨 처음엔 로그인하기 전이기 때문에 Gujikja loginUser의 초기 값이 null
		
		String str = "";
		
		if(loginUser != null) {
			str = "("+loginUser.name+"님)";
		}
		
		System.out.println("\t\t ▼ 메뉴 ▼ "+str+"\n"
							+"1.회원가입 2.로그인 3.로그아웃 4.마이페이지 5.모든 구직자 정보 6.종료\n");
		System.out.print("◈메뉴번호 선택 : ");
	}// end of void showMenu() ---------
	
	// == 로그인을 해주는 메소드 생성 == //
		static Gujikja login(Scanner sc, Gujikja[] gjArr) { // Scanner 쓸 수 있게 넘겨줌
		
		Gujikja loginUser = null; // 리턴해줄 Gujikja 인스턴스	
			
		System.out.print("◈ID: ");
		String userid = sc.nextLine();
		
		System.out.print("◈Password: ");
		String pwd = sc.nextLine();
		
		boolean flag= false; 
		for(int i=0; i<gjArr.length; i++) {
			if(gjArr[i] != null && gjArr[i].isGujikjaExists(userid, pwd)) {
				flag = true;
				loginUser = gjArr[i];
				break; // 아이디 있으면 for문 빠져나감
			} // 0~4까지 뺑뺑이 도는데 0은 null이 아니고 (== 홍길동을 넣음) && 홍길동 1234가 나오면서 true
			
		}// end of for ---------
		
		String result = "";
		if(flag) { // flag가 true이면 (=아이디가 있으면)
			result = "로그인 성공 >_<";	
		}else {
			result = "X_X 로그인 실패";
		}
		
		System.out.println(result+"\n");
		
		return loginUser;
	} // end of static void login() -------
	
	// 구직자로 등록되어진 모든 회원정보를 조회해주는 메소드 생성하기
	static void showAllGujikja(Gujikja[] gjArr) {
		
		System.out.println("--------------------------------------");
		System.out.println("아이디\t성명\t생년월일\t\t현재나이 ");
		System.out.println("--------------------------------------");
		
		boolean flag = false;
		for(int i=0; i<gjArr.length; i++) {
			if(gjArr[i] != null) { // 최소 한개 이상 들어오면
				flag = true;
				break;
		}// end of for -----------
		}
		if(!flag) { // 가입 된 구직자가 1도 없을 때
			System.out.println("\"등록된 구직자가 없습니다.\"");
		}else { // 가입된 구직자가 최소 1명 이상인 경우
			for(Gujikja gj : gjArr) {
				if(gj != null) {
					System.out.println(gj.getGujikjaInfo2()); //
				}
			}// end of for -------
		} // end of if ~ else -------
				
					
		}// end of static void showAllGujikja(gjArr)------
	
	static void register(Scanner sc, Gujikja[] gjArr) {
		System.out.println("==== 구직자 등록하기 ====");
		
		System.out.println("1.아이디:");
		String userid = sc.nextLine();

		System.out.println("2.비밀번호:");
		String pwd = sc.nextLine();
		
		System.out.println("3.이름:");
		String name = sc.nextLine();
		
		System.out.println("4.생년월일:");
		String birthday = sc.nextLine();
	
	
	Gujikja gj = new Gujikja(userid, pwd, name, birthday);
	
	boolean flag = false; // 방에 넣었다는 표식을 하기 위한 깃발
	
	for(int i=0; i<gjArr.length; i++) { // 저장장소 비었니 안비었니
		if(gjArr[i] == null) { // 배열의 방이 비었니?
			gjArr[i] = gj; // 방금 키보드에 입력한 값을 새로 생성한 방 gj에 넣어라
			flag = true;
			break;
		}
	}

	if(flag) {
		System.out.println(">> 가입을 축하드립니다!");
	}else {
		System.out.println(">> 정원이 마감되어 가입이 불가합니다.");
	}
	}
	
	public static void main(String[] args) {

		// 구직자 3명 생성하기
		Gujikja[] gjArr = new Gujikja[5]; // 먼저 생성되어진 구직자를 저장시키는 공간 만들기
		gjArr[0] = new Gujikja(); // 인스턴스 생성
		gjArr[0].userid = "hongs";
		gjArr[0].pwd = "1234";
		gjArr[0].name = "홍길동";
		gjArr[0].birthday = "19970825";
		
		gjArr[1] = new Gujikja("eomjh", "1324", "엄정화", "19690322");
		gjArr[2] = new Gujikja("leess", "1592", "이순신", "20011211");
		
		Scanner sc = new Scanner(System.in);
		
		Gujikja loginUser = null;
		
		do {
			showMenu(loginUser);
			
      		String menuNo = sc.nextLine();
      		
      		switch (menuNo) { // 메뉴번호를 기준으로 뭘 할지 결정 
      		// 변수의 타입은 byte,short,int,char,String만 가능
			case "1": // 회원가입
				// userid, 4개 받아와서 배열에 저장. 정원마감. 생년월일은 숫자만. 비밀번호 유효성검사. 
				register(sc, gjArr);
				break; // switch를 빠져나감

			case "2": // 로그인
				loginUser = login(sc, gjArr); // 넘겨받은 Scanner를 사용하겠음
				break;
				
			case "3": // 로그아웃
				String msg = "";
				
				if(loginUser == null) { // 로그인을 하지않은 상태(==로그아웃)
					msg ="X_X 로그인을 하셔야 로그아웃이 가능합니다.\n";
					}else {
						loginUser = null; // 로그인 후 로그아웃 하면 ~님 없애기
						msg=">> 로그아웃 되었습니다. 잘가요 ~ <<\n";
					}
				System.out.println(msg);
				break;
				
			case "4": // 마이페이지
				msg = "";
				if(loginUser == null) {
					msg="X_X 로그인부터 하세요!\n";
				}else {
					// 로그인된 구직자의 정보를 조회하도록 메소드를 호출
					loginUser.showGujikjaInfo();
				}
				System.out.println(msg);
				break;
				
			case "5": // 모든 구직자 정보
				showAllGujikja(gjArr);
				break;
				
			case "6": // 종료
				break;

			default: // 메뉴에 없는 번호를 입력한 경우
				System.out.println("X_X 잘못 입력하셨습니다.\n");
				break;
			}// end of switch ------
      		
      		if("6".equals(menuNo)) // 변수를 앞에 주면 혹시라도 null이 들어갈 수 있기 때문에 상수를 넣는게 가장 확실하다
			break; // do~while 문을 빠져나감
		} while (true);
		
		sc.close();
		System.out.println(">> 프로그램 종료 <<");

	}//end of main ------------
	
}

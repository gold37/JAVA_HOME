package my.day13.c;

import java.util.Scanner;

public class AppMain {
	
	static void loginGujikja(Scanner sc, InterMember[] mbrArr) {
		
		System.out.print("▷사용자ID: ");
		String id = sc.nextLine();
		
		System.out.print("▷암       호: ");
		String pwd = sc.nextLine();
		
		boolean flag = false;
		
		for(int i=0; i<mbrArr.length; i++) {
			if(mbrArr[i] != null && mbrArr[i] instanceof Gujikja && mbrArr[i].isExists(id, pwd)) { // mbrArr[i] 안에는 Gujikja와 Company가 들어있음
											// ▲ Gujikja와 Company에 동일한 아이디가 있을 수 있기 때문에 구직자 이름만 보여주기 위해서 이렇게 조건을 줌
				
				// instanceof 문법 : 객체명 instanceof 클래스명
				System.out.println("구직자("+( (Gujikja)mbrArr[i] ).name+")로 로그인하셨습니다 (•̀ᴗ•́) و ̑\n");
				
				mbrArr[i].showInfo(); 
				
				flag = true;
				break;
			}
		}// end of for -----------------
		
		if(!flag) {
			System.out.println("로그인에 실패하셨습니다 ໒( ̿ ᴥ ̿ )७");
		}
		
	}// end of static void loginGujikja()-----------------
	
	
	
	static void loginCompany(Scanner sc, InterMember[] mbrArr) {
		
		System.out.print("▷사용자ID: ");
		String id = sc.nextLine();
		
		System.out.print("▷암        호: ");
		String pwd = sc.nextLine();
		
		boolean flag = false;
		
		for(int i=0; i<mbrArr.length; i++) {
			if(mbrArr[i] != null && mbrArr[i] instanceof Company && mbrArr[i].isExists(id, pwd)) {
				System.out.println("구인회사("+( (Company)mbrArr[i] ).name+")로 로그인하셨습니다 ୧༼◕ ᴥ ◕༽୨\n");
				mbrArr[i].showInfo();
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			System.out.println("로그인에 실패하셨습니다 ໒( ̿ ᴥ ̿ )७");
		}
	}// end of static void loginCompany()-----------------

	

	public static void main(String[] args) {

		Gujikja g1 = new Gujikja();
		g1.id = "hongs";
		g1.pwd = "123";
		g1.name = "길동홍";
		g1.birthday = "19901225";
		
		Gujikja g2 = new Gujikja();
		g2.id = "KAKAO";
		g2.pwd = "aaa";
		g2.name = "지원이";
		g2.birthday = "19970825";
		
		
		Company c1 = new Company();
		c1.id = "KAKAO";
		c1.pwd = "aaa";
		c1.name = "카카오";
		c1.jobtype = "IT";
		
		Company c2 = new Company();
		c2.id = "SAMSUNG";
		c2.pwd = "bbb";
		c2.name = "삼성";
		c2.jobtype = "대기업";
		
		InterMember[] mbrArr = new InterMember[6]; 
		// 인터페이스는 객체화(InterMember i = new InterMember();) 할 수 없지만 저장소로만 쓰겠음
		// 할아버지거 손자가 쓸 수 있음
		mbrArr[0] = g1;
		mbrArr[1] = c1;
		mbrArr[2] = g2;
		mbrArr[3] = c2;
		
		
		//////////////////////////////////////////////////
		
		Scanner sc = new Scanner(System.in);
		boolean flag = false;
		
		do {
			System.out.print("▷ 로그인 선택(1.구직자 / 2.구인회사) => ");
			String no = sc.nextLine();
			
			switch (no) {
			case "1" :
				
				loginGujikja(sc, mbrArr);
				
				flag = true;
				break; // switch문을 빠져나옴
				
			case "2" :
				
				loginCompany(sc, mbrArr);
				
				flag = true;
				break;
			
			default :
				System.out.println("ಠ_ಠ  1 또는 2만 가능합니다!! \n");
				break;
			
			} // end of switch -------------
			
			if(flag) {
				break; // do while문을 빠져나옴
			}
		} while (true);
		
		sc.close();
		System.out.println("\n프로그램 종료! 잘가요₍₍ (ง ˙ω˙)ว ⁾⁾");
	}// end of main() -----------------------


}

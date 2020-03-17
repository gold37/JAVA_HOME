package my.day11.b.inheritance;

import java.util.Scanner;

public class AppMain {
	
	static void loginGujikja(Scanner sc, Gujikja[] gjArr) {
		
		System.out.print("▷사용자ID: ");
		String id = sc.nextLine();
		
		System.out.print("▷암       호: ");
		String pwd = sc.nextLine();
		
		boolean flag = false;
		
		for(int i=0; i<gjArr.length; i++) {
			if(gjArr[i] != null && gjArr[i].isExists(id, pwd)) { // 0~4
				System.out.println("구직자("+gjArr[i].name+")로 로그인하셨습니다 (•̀ᴗ•́) و ̑\n");
				gjArr[i].showInfoGujikja();
				flag = true;
				break;
			}
		}// end of for -----------------
		
		if(!flag) {
			System.out.println("로그인에 실패하셨습니다 ໒( ̿ ᴥ ̿ )७");
		}
		
	}// end of static void loginGujikja()-----------------
	
	
	
	static void loginCompany(Scanner sc, Company[] comArr) {
		
		System.out.print("▷사용자ID: ");
		String id = sc.nextLine();
		
		System.out.print("▷암        호: ");
		String pwd = sc.nextLine();
		
		boolean flag = false;
		
		for(int i=0; i<comArr.length; i++) {
			if(comArr[i] != null && comArr[i].isExists(id, pwd)) {
				System.out.println("구인회사("+comArr[i].name+")로 로그인하셨습니다 ୧༼◕ ᴥ ◕༽୨\n");
				comArr[i].showInfoCompany();
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			System.out.println("로그인에 실패하셨습니다 ໒( ̿ ᴥ ̿ )७");
		}
	}// end of static void loginCompany()-----------------

	

	public static void main(String[] args) {

		Gujikja[] gjArr = new Gujikja[5];
		Company[] comArr = new Company[5];
		
		gjArr[0] = new Gujikja();
		gjArr[1] = new Gujikja();
		
		gjArr[0].id = "hongs";
		gjArr[0].pwd = "123";
		gjArr[0].name = "길동홍";
		gjArr[0].birthday = "19901225";
		
		gjArr[1].id = "jwjw";
		gjArr[1].pwd = "987";
		gjArr[1].name = "지원이";
		gjArr[1].birthday = "19970825";
		
		
		comArr[0] = new Company();
		comArr[1] = new Company();
		
		comArr[0].id = "KAKAO";
		comArr[0].pwd = "aaa";
		comArr[0].name = "카카오";
		comArr[0].jobtype = "IT";

		comArr[1].id = "SAMSUNG";
		comArr[1].pwd = "bbb";
		comArr[1].name = "삼성";
		comArr[1].jobtype = "대기업";
		
		
		//////////////////////////////////////////////////
		
		Scanner sc = new Scanner(System.in);
		boolean flag = false;
		
		do {
			System.out.print("▷ 로그인 선택(1.구직자 / 2.구인회사) => ");
			String no = sc.nextLine();
			
			switch (no) {
			case "1" :
				
				loginGujikja(sc, gjArr);
				
				flag = true;
				break; // switch문을 빠져나옴
				
			case "2" :
				
				loginCompany(sc, comArr);
				
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

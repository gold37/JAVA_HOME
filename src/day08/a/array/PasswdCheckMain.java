package my.day08.a.array;

import java.util.Scanner;

public class PasswdCheckMain {

	public static void main(String[] args) {

		/*
			암호를 입력받고자 하는데 암호의 길이는 8글자 이상 15글자 이하야하고,
			암호는 반드시 영문 대문자, 영문 소문자, 숫자, 특수문자가 최소한 1개 이상은 들어가야한다
			
		 */
		
		Scanner sc = new Scanner(System.in);
		
		do {
			
			System.out.print("♣ 암호를 입력하세요: ");
			String pwd = sc.nextLine();
			
			// === 입력받은 암호 검사하기
			// 1.암호 길이를 통과한 다음 특수문자 확인
			int len = pwd.length();
			
			if(!(8<=len && len<=15)) {
				System.out.println("XㅁX 암호의 길이는 8글자 이상 15글자 이하이어야합니다.");
			}
			else { // 암호 길이 통과한 경우
				
				// 암호가 만약에 abc123D@# ---> 사용 가능한 암호
				// 암호가 만약에 abc123D ---> 사용 불가능한 암호
				
				char[] chrArr = pwd.toCharArray();
								//  ▲ 글자 한개한개 비교해야되기 때문에 String이 아닌 char타입을 사용
				// -------------------------------------
				// | a | b | c | 1 | 2 | 3 | D | @ | # |
				// -------------------------------------
				
				boolean flagUpper = false; // 영문 대문자 표식을 위한 깃발 
				boolean flagLower = false; // 영문 소문자 표식을 위한 깃발 
				boolean flagNumber = false; // 숫자 표식을 위한 깃발 
				boolean flagSpecial = false; // 특수문자 표식을 위한 깃발 
			
				
				/*
				
				
				
				for(int i=0; i<chrArr.length; i++) {
					char ch = chrArr[i];
					
					if('A'<=ch && ch<='Z') { // 영문 대문자인 경우
						flagUpper = true;
					}
					else if('a'<=ch && ch<='z') { // 영문 소문자인 경우
						flagLower = true;
					}
					else if('0'<=ch && ch<='9') { // 숫자인 경우
						flagNumber = true;
					}
					else { // 특수기호인 경우
						flagSpecial = true;
					}
					
				}// end of for -------------------------
				
				
				
				*/
				
				// ▲ 또는 확장 for문으로 구현 ▼
				
				for(char ch:chrArr) {
					
					if('A'<=ch && ch<='Z') { // 영문 대문자인 경우
						flagUpper = true;
					}
					else if('a'<=ch && ch<='z') { // 영문 소문자인 경우
						flagLower = true;
					}
					else if('0'<=ch && ch<='9') { // 숫자인 경우
						flagNumber = true;
					}
					else { // 특수기호인 경우
						flagSpecial = true;
					}
				
				} // end of for ----------------
				
				
				
				if(flagUpper && flagLower && flagNumber && flagSpecial) {
					// 암호 요구 조건에 충족하는 경우
					System.out.println("암호입력 성공");
					System.out.println("입력한 암호: "+ pwd);
					break;
				}
				else {
					// 암호의 길이는 올바르지만, 암호 요구 조건에 충족하지 않는 경우
					System.out.println(">> 암호는 영대문자,영소문자,숫자,특수문자가 혼합이 되어져야합니다");
				}
			}

		}while(true);
		
		sc.close();
		System.out.println(">>> 프로그램 종료 <<<"); //암호가 올바를 경우 
	}//end of main()----------

}

		// === 소수란? === 
		// 소수란? 1과 자기 자신으로밖에 나누어지지 않는 1 이외의 정수 
		// 예> 1 부터 10까지의 소수를 나타내면 
		//    2%2 ==> 0   2 는 소수
		//    3%3 ==> 0   3 는 소수
		//    4%2 ==> 0   4 는 소수가 아님
		//    5%5 ==> 0   5 는 소수
		//    6%2 ==> 0   6 는 소수가 아님
		//    7%7 ==> 0   7 는 소수
		//    8%2 ==> 0   8 는 소수가 아님
		//    9%3 ==> 0   9 는 소수가 아님
		//   10%2 ==> 0  10 는 소수가 아님  

package my.day07.b.dowhileTest;

import java.util.InputMismatchException;
import java.util.Scanner;

public class PrimeNumberMain {

	public static void main(String[] args) {

		/*
		 	실행결과
		 	
		 	▷시작 자연수 : 1
		 	▷끝 자연수 : 20
		 	1부터 20까지의 소수는?
		 	2 3 5 7 11 13 17 19 

		 	1부터 20까지의 소수의 개수? 8개
		 	1부터 20까지의 소수들의 합? 77
		 	
		 	=== 프로그램 종료 ===
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int startNo=0;
		int endNo=0;
		
		
		do { //시작 자연수 실행시 무조건 출력
			try {
				System.out.print("▷시작 자연수 : ");
				startNo = sc.nextInt();
				sc.nextLine();
				break;
			} catch (InputMismatchException e) {
				System.out.println("※ 자연수만 입력하세요 ※");
				sc.nextLine();
			}
				
		} while (true); //자연수 잘못 입력시 재입력할 수 있게 계속 뱅글뱅글 돌림
		
		do {
			try {
				System.out.print("▷끝 자연수 : "); // 시작 자연수 int로 했으니까 얘는 string으로 해보겠음
				endNo = Integer.parseInt(sc.nextLine());
				break;
		}catch(NumberFormatException e) {
			System.out.println("※ 자연수만 입력하세요 ※");
			}
		} while (true);
		
		/////////////////////////////
		// startNo ==> 1
		// endNo ==> 20
		// 1부터 20까지의 소수 구하기
		
		String resultStr = "";
		int cnt=0;
		int sum=0;
		
		for(int i=startNo; i<=endNo; i++) {
			
			if(i==1) {
				continue; // 1은 소수가 아니므로 continue;를 해서 건너뛴다
						  // i가 소수인지 아닌지가 검사 대상임
			}
			
			//나누기 한 나머지를 일일이 검사한다
			//만약 i가 2이라면 --> 2는 소수
			//만약 i가 3이라면 3%2 --> 3은 소수 cf ☆★경우의 수를 잘 대입하면 프로그래밍 다 잘할 수 이따!!! 
			//만약 i가 4이라면 4%2 4%3 --> 4는 나머지 빵 되기때문에 더이상 검사할 필요 XX 4는 소수가 아니다
			//만약 i가 5이라면 5%2 5%3 5%4 --> 5는 소수
			//만약 i가 6이라면 6%2 --> 처음부터 빵이 돼버려서 더이상 검사 필요가 없다 6은 소수가 아니다
			
			boolean isSosu = true;
			for(int j=2; j<i; j++) { // j는 분모에 들어갈 값
				if(i%j==0) { // i가 소수가 아닌 경우
					isSosu = false; // 소수가 아님을 표시
					break;
				}
				
			}//end of for----------------
			
			// 콤마 찍기 
			/*
			 *  생각의 전환 +ㅁ+ 콤마찍고 숫자를 찍자
				1~25	,2,19,23
				1~20	,2,17,19
				1~19	,2,17,19
			 */
			if(isSosu) { // i가 소수라면
				cnt++; 
				
				String comma = (cnt > 1)?",":""; // 두 번째 개수부터 앞에 콤마를 주겠다 그러니까 첫번째 출력값 앞엔 콤마가 없겠지
				resultStr += comma+i; //문자열 더하기(소수 출력)
				
				sum += i; // sum에 i값 누적
			}
			
		
		}// end of for ------------------
		
		System.out.println(startNo+"부터 "+endNo+"까지의 소수는?\n"+resultStr);
		System.out.println("\n"+startNo+"부터 "+endNo+"까지의 소수의 개수? "+cnt+"개");
		System.out.println("\n"+startNo+"부터 "+endNo+"까지의 소수들의 합? "+sum+"개");
		
		sc.close();
		System.out.println("=== 프로그램 종료 ===");
		
	} //end of main()------------------

}

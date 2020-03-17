/*
	=== do ~ while() ===

       변수초기화;

	do{
	           반복해서 실행할 명령문;
	           증감식;
	} while(조건식);
	
	while 문의 경우 조건식이 true 일때만 반복 실행하지만,
	do ~ while 문의 경우는 조건식이 false 일지라도
	무조건 do{ } 속에 있는 명령문은 1번은 실행하고서 반복문을 벗어난다.
	    
	그러므로 do ~ while 문은 무조건 do{ } 속에 있는 명령문을 실행하고서
	while(조건식) 속의 조건에 따라 참(true)이라면 계속 반복하고,
	조건이 거짓(false)이라면 중지한다.  
*/

package my.day07.b.dowhileTest;

public class DoWhileTestMain {

	public static void main(String[] args) {

		/*
		 	while은 조건따지고 맞으면 하고 아니면 안하고
		 	do while은 무조건 한번은 실행
		 */
	
		do {
			System.out.println("자바는 나의 칭구 >_ㅇ");
		} while (false);
		
		System.out.println("\nNew Line ~~~~~~~~~~~~~~~~~~~~~");
		
		int cnt=5, i=0;
		do {
			i++;
			System.out.println(i+".Rain Drop");
		} while (i<cnt); //5번 반복
		
		System.out.println("\nNew Line ~~~~~~~~~~~~~~~~~~~~~");
		
		cnt=5; i=0;
		do {
			i++;
			System.out.println(i+".Rain Drop");
		} while (!(i==5)); 
		
	}
}

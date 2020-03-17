/*
 **** 반복문(loop) ==> for 문 ****
  
          ※ for 문의 형식
   
    for(초기화; 조건식; 증감식) {
       	반복해서 실행할 문장;
    }  
    
               ▣ 순서
    1) 초기화;
    2) 조건식; (조건식이 참(true)이라면 반복해서 실행할 문장;을 실행하고서 } 을 못빠져나간다.         
                              조건식이 거짓(false)이라면 반복해서 실행할 문장;을 실행하지 않고
               } 을 빠져나간다.)
    3) 증감식
    4) 조건식; (조건식이 참(true)이라면 반복해서 실행할 문장;을 실행하고서 } 을 못빠져나간다.         
                              조건식이 거짓(false)이라면 반복해서 실행할 문장;을 실행하지 않고
               } 을 빠져나간다.) 
    5) 증감식
    6) 조건식; (조건식이 참(true)이라면 반복해서 실행할 문장;을 실행하고서 } 을 못빠져나간다.         
                              조건식이 거짓(false)이라면 반복해서 실행할 문장;을 실행하지 않고
               } 을 빠져나간다.)                                                  
    
*/

package my.day06.a.forTest;

public class ForTest1Main {

	public static void main(String[] args) {
		/*
		 * 1.안녕자바~
		 * 2.안녕자바~
		 * 3.안녕자바~
		 * 4.안녕자바~
		 * 5.안녕자바~
		 * 6.안녕자바~
		 * 7.안녕자바~
		 * 8.안녕자바~
		 * 9.안녕자바~
		 * 10.안녕자바~
		 */
		
		for(int i=0;i<10;i++) {
<<<<<<< HEAD
<<<<<<< HEAD
			System.out.println((i+1)+".안녕자바^^");
=======
			System.out.println((i+1)+".안녕 자바^^");
>>>>>>> java05/master
=======
			System.out.println((i+1)+".안녕 자바^^");
>>>>>>> java06/master
		}
		
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~");
		
<<<<<<< HEAD
<<<<<<< HEAD
		for(int i=0; i<10; i++) {
			System.out.println(++i+".안녕 이클립스!");
=======
		for(int i=0; i<10; i++) { // 0 2 4 6 8
			System.out.println(++i+".안녕 이클립스!"); // 1 3 5 7 9
>>>>>>> java05/master
=======
		for(int i=0; i<10; i++) { // 0 2 4 6 8
			System.out.println(++i+".안녕 이클립스!"); // 1 3 5 7 9
>>>>>>> java06/master
		}

		/* ++i 전위 연산자 먼저 계산 --> i=1. ~
		 * i++ 계산 --> i=2
		 * ++i +1한 값 출력 --> 3. ~
		 * 
		 * 1.안녕 이클립스~~
		   3.안녕 이클립스~~
		   5.안녕 이클립스~~
		   7.안녕 이클립스~~
		   9.안녕 이클립스~~
		
		*/
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~");
<<<<<<< HEAD
<<<<<<< HEAD
		for(int i=0; i<10; i+=2) {
			System.out.println((i+1)+".안녕 오라클?");
=======
		for(int i=0; i<10; i+=2) { // 0 2 4 6 8
			System.out.println((i+1)+".안녕 오라클?"); // 1 3 5 7 9
>>>>>>> java05/master
=======
		for(int i=0; i<10; i+=2) { // 0 2 4 6 8
			System.out.println((i+1)+".안녕 오라클?"); // 1 3 5 7 9
>>>>>>> java06/master
		}
		
		/*
		 * 1.안녕 오라클?
		 * 3.안녕 오라클?
		 * 5.안녕 오라클?
		 * 7.안녕 오라클?
		 * 9.안녕 오라클?
		 * 
		 */
		
<<<<<<< HEAD
<<<<<<< HEAD
	}

=======
=======
>>>>>>> java06/master
		
		System.out.println("\n@@@@@@@@@@@@@@@@");
		for(int i=0, j=0; i<10; i++, j+=2) {
			System.out.println((j+1)+".안녕 Java~~~");
		}
		
		/*
		 * 1.안녕 Java~~~ 
		 * 3.안녕 Java~~~ 
		 * 5.안녕 Java~~~ 
		 * 7.안녕 Java~~~ 
		 * 9.안녕 Java~~~ 
		 * 11.안녕 Java~~~ 
		 * 13.안녕 Java~~~ 
		 * 15.안녕 Java~~~ 
		 * 17.안녕 Java~~~ 
		 * 19.안녕 Java~~~
		 */
		
		System.out.println("\n---------------------");
		
		for(int i=10; i>0; i--) { // 10 9 8 7 6 5 4 3 2 1
			
			System.out.println(i+".안녕 오라클  ^ㅁ^");
			
		}
		
		/*
		 * 9.안녕 오라클 ^ㅁ^ 
		 * 8.안녕 오라클 ^ㅁ^ 
		 * 7.안녕 오라클 ^ㅁ^ 
		 * 6.안녕 오라클 ^ㅁ^ 
		 * 5.안녕 오라클 ^ㅁ^ 
		 * 4.안녕 오라클 ^ㅁ^
		 * 3.안녕 오라클 ^ㅁ^ 
		 * 2.안녕 오라클 ^ㅁ^ 
		 * 1.안녕 오라클 ^ㅁ^
		 */
		
		
		System.out.println("\n-----------------");
		
		for(int i=10; i>0; i-=2) { // 10 8 6 4 2
			
			System.out.println((i-1)+".안녕 자바>_<"); // 9 7 5 3 1
		}
		
		/*
		 * 9.안녕 자바>_< 
		 * 7.안녕 자바>_< 
		 * 5.안녕 자바>_< 
		 * 3.안녕 자바>_< 
		 * 1.안녕 자바>_<
		 */
		
		
		System.out.println("\n====================");
		
		for(int i=0, j=9; i<5; i++, j-=2) { // i= 0 1 2 3 4  
											// j= 9 7 5 3 1
			System.out.println(j+".하이 자바");
		}
		
		/*
		 * 9.하이 자바
		 * 7.하이 자바
		 * 5.하이 자바
		 * 3.하이 자바
		 * 1.하이 자바
		 */
		
		
		
		
		for(int i=0; i<'A'-'A'+1; i++) { // char 타입이 사칙연산을 만나면 int로 바뀜
										 //  i<'A'-'A'+1 은 65-65+1 이기 때문에 i<1과 같아짐
			System.out.print((char)('A'+i)); //65를 char타입으로 바꿔라
		}
		
		// A
		
		System.out.println("\n********Quiz**********");
		
		for(int i=0; i<'N'-'A'+1; i++) {
			System.out.print((char)('A'+i));
		}
		// ABCDEFGHIJKLMN
		
		
		System.out.println("\n==================");
		
		int n=0;
		
		for(; n<5; n++) {
			System.out.println((n+1)+".차은우");


		
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~");
		
		for(int m=0; m<5; m++) {
			System.out.println((m+1)+".차금우");
		}
		//System.out.println("m=> "+ m); // m은 지역 변수라서 여기서 사용 불가
	
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~");
		for(; n<10; n++) { // 5 6 7 8 9
			System.out.println((n+1)+".차동우");
		}
		/*
		 * 6.차동우
		 * 7.차동우
		 * 8.차동우
		 * 9.차동우
		 * 10.차동우
		 */
	}
}
<<<<<<< HEAD
>>>>>>> java05/master
=======
>>>>>>> java06/master
}

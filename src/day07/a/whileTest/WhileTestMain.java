/*
    === while 문 형식 ===
    
       변수의 초기화;
       
    while(조건식) {
    	조건식이 참(true)이라면 반복해서 실행할 명령문을 실행하고,
    	조건식이 거짓(false)이라면 while의 { } 이부분을 빠져나간다. 
    	
    	반복해서 실행할 명령문;
    	증감식;
    }
 */

package my.day07.a.whileTest;

public class WhileTestMain {

	public static void main(String[] args) {

		int cnt=5; //반복을 위한 변수 초기화
		int loop=0; //반복의 횟수를 위한 변수 초기화
		while(loop < cnt) { // 0<5 참이면 실행
			System.out.println((loop+1)+". Hello Java ^ㅇ^");
			loop++;
		}//end of while -------------------
		
		
		System.out.println("\n----------------------------");
		
		cnt=5; //반복을 위한 변수 초기화
		loop=0; //반복의 횟수를 위한 변수 초기화
		while(loop++ < cnt) { // 0<5 참이면 실행
			System.out.println(loop+". Hello Java ^ㅇ^");
		}//end of while -------------------
		
		
		System.out.println("\n----------------------------");
		
		cnt=5; //반복을 위한 변수 초기화
		loop=0; //반복의 횟수를 위한 변수 초기화
		while(loop < cnt) { // 0<5 참이면 실행
			System.out.println(++loop+". Hello Java ^ㅇ^");
		}//end of while -------------------
		
		System.out.println("\n----------------------------");
		
		loop=0;
		while(true) {
			System.out.println(++loop+". Hello Java ^ㅇ^");
			if(loop == 5)
			break;
		}
		
		System.out.println(">>> 프로그램 종료 <<<");
		
		
		System.out.println("\n----------------------------");
		
		loop=0;
		while(true) {
			System.out.println(++loop+". Hello Java ^ㅇ^");
			if(loop == 5)
				break;
		}
		
		
		System.out.println("\n----------------------------");
		
		loop=0;
		while(true) {
			
			if(++loop > 10) break; //12345678910
			
			if (loop%2 == 0)
			continue; // 밑으로 안내려가고 위에있는 조건식으로 가기 때문에 syso 위에 적어야함
			
			System.out.println(loop+". Hello Java ^ㅇ^");
		}
		
		System.out.println(">>> 프로그램 종료 <<<");

	
		System.out.println("\n--------------퀴즈--------------");
		/*
		  	구구단 5단 출력하기
		 */
		int i=0;
		while(true) {
			if(++i>9)
				break;
			System.out.println("5"+"*"+i+"="+(5*i));
		}
		System.out.println(">>> 프로그램 종료 <<<");
	
		
		System.out.println("\n----------------------------");
		//실무에서 자주 쓰이는 while문 작성 법 
		//while 조건식에 탈출 조건을 써라
		i=0; 
		
		while(!(++i>9)) { // !false == true
			// ++i>9 참이면 while문을 빠져나가라 
			System.out.println("5"+"*"+i+"="+(5*i));
		}
		System.out.println(">>> 프로그램 종료 <<<");

		
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("\t=== 구구단 ===");
		
		// row ==> 행,줄  col ==> 열,단
		// 9행 8열
		int row=0, col=0;
		while(!(++row>9)) { // 바깥 while문 (==행)
			while(!(++col>8)) { // 안쪽 while문 (==열)
				String str = ((col+1)<9)?"\t":"\n";
				System.out.print((col+1)+"x"+row+"="+((col+1)*row) + str);
			}
			col=0;
		}
		
		System.out.println("\nToday Homework ①");
		//입사문제
		/*
		  
			2x1=2	3x1=3	4x1=4	5x1=5	
			2x2=4	3x2=6	4x2=8	5x2=10	
			2x3=6	3x3=9	4x3=12	5x3=15	
			2x4=8	3x4=12	4x4=16	5x4=20	
			2x5=10	3x5=15	4x5=20	5x5=25	
			2x6=12	3x6=18	4x6=24	5x6=30	
			2x7=14	3x7=21	4x7=28	5x7=35	
			2x8=16	3x8=24	4x8=32	5x8=40	
			2x9=18	3x9=27	4x9=36	5x9=45	
			 
			6x1=6	7x1=7	8x1=8	9x1=9
			6x2=12	7x2=14	8x2=16	9x2=18
			6x3=18	7x3=21	8x3=24	9x3=27
			6x4=24	7x4=28	8x4=32	9x4=36
			6x5=30	7x5=35	8x5=40	9x5=45
			6x6=36	7x6=42	8x6=48	9x6=54
			6x7=42	7x7=49	8x7=56	9x7=63
			6x8=48	7x8=56	8x8=64	9x8=72
			6x9=54	7x9=63	8x9=72	9x9=81
				
				19행 4열
		 */
		
		row=0; col=0;
		while(!(++row>19)) { // 바깥 while문 (==행) 19행
			while(!(++col>4)) { // 안쪽 while문 (==열) 4열
				
				if(row==10) {
					System.out.print("\n");
					break;
				}
				
				if(row < 10) {
					String str = ((col+1)<5)?"\t":"\n";
					System.out.print((col+1)+"x"+row+"="+((col+1)*row) + str);
				}
				else {
					String str = ((col+5)<9)?"\t":"\n";
					System.out.print((col+5)+"x"+(row-10)+"="+((col+5)*(row-10)) + str);
				}
				
			}//end of while ---------------
			col=0;
		}//end of while ---------------

	}
}

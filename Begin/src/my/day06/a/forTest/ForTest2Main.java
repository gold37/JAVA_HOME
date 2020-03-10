package my.day06.a.forTest;

public class ForTest2Main {

	public static void main(String[] args) {
		
		System.out.println(">> 1. === break ===");
		
		for(int i=0; i<10; i++) { // 12345678910
			if(i==5)
				break; // 반복문에서 break;를 만나면 가장 가까운 반복문을 벗어난다
			System.out.print(i+1); // 12345
		}
		
		System.out.println("\n\n>> 2. === continue ===");
		
		for(int i=0; i<10; i++) {// 12345678910
			if((i+1)%2 == 0) // 짝수
				continue; // continue;를 만나면 실행순서가 가장 가까운 반복문의 증감식으로 올라감
			System.out.print(i+1); // 13579
		}
		
		
		System.out.println("\n\n>> === Quiz1 ===");
		/*
		 	break;를 사용하여 문제를 풀이하세요
		 	알파벳 소문자를 모두 출력하는 도중에 
		 	소문자 k를 만나면 소문자 k까지만 출력하고 중지하세요.
		 	abcdefghijk
		 */

		int cnt = 'z'-'a'+1; // 알파벳 소문자의 갯수
		
		for(int i=0; i<cnt; i++) {
			char ch = (char)('a'+i);
			System.out.print(ch);
			
			if(ch=='k')
				break;
		}
		
		
//		System.out.println("\n\n>> === Quiz ===");
//		for(int i=0; i<'z'-'a'+1; i++) {
//			System.out.print((char)('a'+i));
//			if('a'+i=='k') {
//				break;
//			}
//		}
		
		
		System.out.println("\n\n>> === Quiz2 ===");
		/*
		  	continue;를 사용하여 문제를 풀이하세요
		  	알파벳 소문자를 출력하는데 아래처럼 나타나도록 하세요
		  	a c e g i k m o q s u w y 
		 */

		for(int i=0; i<cnt; i++) {
			char ch = (char)('a'+i); // i=012345 ...
				if(i%2!=0)		 //    1 3 5 ... 홀수 제외
					continue;
			System.out.print(ch+" ");
		}
		
		
		System.out.println("\n\n");

		for(int i=0; i<cnt; i++) {
			char ch = (char)('a'+i);
			
			String comma = (i < cnt-2)?",":"";
			if((ch)%2==0)
				continue;
			System.out.print(ch+comma); // char+char=int 라서 comma를 char타입이 아닌 String타입으로 작성
		}
		
		
		/*
		      알파벳 소문자를 출력하는데 아래처럼 나타나도록 하세요
		   a,c,e,g,i,k,m,o,q,s,u,w,y
		 
		 */
	}

}

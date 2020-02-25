package my.day04.c.scanner;

import java.util.Scanner;

public class Scanner1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner sc = new Scanner(System.in);
		//System.out은 화면, 모니터 System.in은 키보드
		
		//스캐너는 키보드에서 입력된 문자열을 읽어들이는 객체이다.
		System.out.print("문장을 입력하세여 :");
		String inputStr = sc.nextLine();
		/*
		 * sc.nextLine();은 키보드로 입력한 문장을 읽어들이는 것
		 * 언제까지? 엔터칠때까지! 읽어들인 후 스캐너 버퍼에 아무것도 남기지 않는다.
		 */
		System.out.println("내가 입력한 문장 :"+inputStr);
		
		System.out.println("\n=====================");
		
		System.out.print("정수를 입력해듀세욥:");
		int inputNum = sc.nextInt();
		/*
	    sc.nextInt(); 는 정수를 읽어들이는 것인데 
	        종결자가 공백 또는 엔터이다. 
	        종결자(공백 또는 엔터) 앞까지의 입력해준 정수를 읽어온다.
	    sc.nextInt(); 를 사용하면 스캐너(sc)버퍼에는 
	        종결자(공백 또는 엔터)가 삭제되는 것이 아니라 그대로 남아 있게 된다. 
	    */
		sc.nextLine(); // 스캐너(sc)버퍼에 남아있는 것을 비우는(제거하는) 효과를 가진다.
		System.out.println("입력한 정수는 이곱니닷:"+inputNum);
		System.out.print("실수를 입력해듀세욥:");
		double input = sc.nextDouble(); 
		/*
	    sc.nextDouble(); 는 실수를 읽어들이는 것인데 
	        종결자가 공백 또는 엔터이다. 
	        종결자(공백 또는 엔터) 앞까지의 입력해준 실수를 읽어온다.
	    sc.nextDouble(); 를 사용하면 스캐너(sc)버퍼에는 
	        종결자(공백 또는 엔터)가 삭제되는 것이 아니라 그대로 남아 있게 된다. 
	    */
		System.out.println("입력한 실수는 이곱니닷:"+input);
		sc.nextLine(); // 스캐너(sc)버퍼에 남아있는 것을 비우는(제거하는) 효과를 가진다.

		System.out.println("\n ~~~~~~~~~~~~~~");
		System.out.print("단어를 입력하세요:");
		inputStr = sc.next();
		/*
	    sc.next(); 는 단어를 읽어들이는 것인데 
	        종결자가 공백 또는 엔터이다. 
	        종결자(공백 또는 엔터) 앞까지의 입력해준 단어를 읽어온다.
	    sc.next(); 를 사용하면 스캐너(sc)버퍼에는 
	        종결자(공백 또는 엔터)가 삭제되는 것이 아니라 그대로 남아 있게 된다. 
	    */
		sc.nextLine();
		System.out.println("입력한 단어:"+inputStr);
		
		System.out.print("단어를 또 입력하세요:");
		inputStr = sc.next();
		sc.nextLine();
		System.out.println("또 입력한 단어:"+inputStr);
		
		sc.close();//다 끝났으면 더이상 키보드로 읽어 들일게 없습니다.
	}

}

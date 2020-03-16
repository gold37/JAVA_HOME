package my.day04.c.scanner;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Scanner2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력해듀세욥:");
		try {
			
			int inputNum = sc.nextInt();
			sc.nextLine();			
			System.out.println("입력한 정수는 이곱니닷:"+inputNum);

		} catch(InputMismatchException e) {
			
			System.out.println(">>>정수만 입력하세엿 ㅡㅁㅡ<<<");
			e.printStackTrace(); //어디가 오류인지 추적해서 알려줌
		
		}
	
		sc.close();

	}

}

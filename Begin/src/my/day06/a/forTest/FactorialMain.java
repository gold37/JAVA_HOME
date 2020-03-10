package my.day06.a.forTest;

import java.util.InputMismatchException;
import java.util.Scanner;

public class FactorialMain {

	public static void main(String[] args) {

		// 입사문제 
		/*
			>> 알고싶은 팩토리얼 수 입력 => 5
			>> 5! = 120
			   5*4*3*2*1
		 */

		
		Scanner sc = new Scanner(System.in);
		
		do { //시작 자연수 실행시 무조건 출력
			
			try {
				System.out.print(">> 알고싶은 팩토리얼 수 입력 => ");
				int num = Integer.parseInt(sc.nextLine());
				
				if(num<1) {
					System.out.println(">> 양수만 입력하세요!!");
					continue;
				}
				int result = 1; //초기값 0주면 *0했을 때 모든 값이 0이 돼버림 
				for(int i=num; i>0; i--) { // 5*4*3*2*1 
					result *= i;
				}
				
				System.out.println(num+"! = "+result);
				break; //프로그램 빠져나옴
				
			} catch (NumberFormatException e) {
				System.out.println(">> 숫자만 입력하세요!!");
			}
				
		} while (true);
		
		sc.close();
		System.out.println("프로그램 종 료");
	}

}

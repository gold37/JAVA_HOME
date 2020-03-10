package my.day04.c.scanner;

import java.util.Scanner;

public class Scanner3Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("1. 정수를 입력하세요: ");
		String inputStr = sc.nextLine(); 
		
		try {
			//int n = inputStr + 10; //inputStr이 String타입이라서 +10해도 숫자가 아니고 문자로 인식됨
			int n = Integer.parseInt(inputStr)+10; //String 타입을 Int 타입으로 형변환
			System.out.println("---> 입력한 정수에 10을 더한 값: "+n);
		} catch (NumberFormatException e) {
			System.out.println("삐- " + inputStr +"는 정수가 아닙니다.");
		}
		sc.close();
	}
}

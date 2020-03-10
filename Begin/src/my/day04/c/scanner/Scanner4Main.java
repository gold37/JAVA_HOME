package my.day04.c.scanner;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Scanner4Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("== 2개의 숫자를 입력받아서 더한 결과 알아보기 ==");

//		try {
//			System.out.print("1. 첫 번째 정수 :");
//			int a = sc.nextInt();
//			System.out.print("2. 두 번째 정수 :");
//			int b = sc.nextInt();
//			System.out.println(">>> 결과 :"+a+"+"+b+"="+(a+b));
//		}catch(InputMismatchException e){
//			
//			System.out.println(">>> 입력한 값이 정수가 아니므로 더하기를 할 수 없습니다.");
//		}
//	
		String inputStr = "";
		
		try {			
			System.out.print("1. 첫 번째 정수 :");
			inputStr = sc.nextLine();
			int a = Integer.parseInt(inputStr);
			
			/*
			
			문자열 -> 실수로 바꾸는 방법
			
			String strdb = 12.3425;
			Double db = Double.parseDouble(strdb);
			
			*/
			
			System.out.print("2. 두 번째 정수 :");
			inputStr = sc.nextLine();
			int b = Integer.parseInt(inputStr);
			
			System.out.println(">>> 결과 :"+a+"+"+b+"="+(a+b));
		} catch(NumberFormatException e) {
			
			System.out.println(">>> 입력한\""+inputStr+"\"이(가) 정수가 아니므로 더하기를 할 수 없습니다.");
		
		}
		
		sc.close();

	}

}

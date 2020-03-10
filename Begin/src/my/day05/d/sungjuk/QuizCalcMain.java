package my.day05.d.sungjuk;

import java.util.Scanner;

public class QuizCalcMain {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		System.out.print("▷첫 번째 정수를 입력하세요:");
		String strNum1 = sc.nextLine();
		int num1 = Integer.parseInt(strNum1);
		
		
		System.out.print("▷두 번째 정수를 입력하세요:");
		String strNum2 = sc.nextLine();
		int num2 = Integer.parseInt(strNum2);
		
		System.out.print("▷사칙연산자를 선택해주세요(+ - * /):");
		String op = sc.nextLine();
		
		double result = 0.0;
		
		switch (op) {
		case "+": 
			result = num1+num2;
			break;

		case "-": 
			result = num1-num2;
			break;
	
		case "*": 
			result = num1*num2;
			break;

			
		case "/": 
			result = (double)num1/num2;	
			break;

			
		default:
			break;
		}
		
		switch (op) {
		case "/":
			System.out.println(">> "+num1+op+num2+"="+result);
			break;

		default:
			System.out.println(">> "+num1+op+num2+"="+(int)result);
			break;
		}
		
		sc.close();
		/*
		 * ▷첫 번째 정수를 입력하세요: 30
		 * ▷두 번째 정수를 입력하세요: 20
		 * ▷사칙연산자를 선택해주세요(+ - * /): +
		 * >> 30 + 20 = 50
		 * >> 30 - 20 = 10
		 * >> 30 * 20 = 600
		 * >> 30 / 20 = 1.5
		 */

		
		
	}

}

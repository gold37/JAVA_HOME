package my.day04.c.scanner;

import java.util.Scanner;

public class Scanner5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("=== 정수를 문자열로 바꾸기 ===");
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("1. 첫 번째 정수:");
		int num1 = sc.nextInt(); //정수만 받음,Enter 남아있음
		sc.nextLine(); //Enter까지 읽어 옴 그리고 싹 다 없앰
		// 정수 -> 문자열로 바꾸는 방법 1
		String str1 = Integer.toString(num1); //정수(int 타입)을 String 타입으로 바꿔줌
		//String.valueOf(num1); // 정수 -> 문자열로 바꾸기 방법 2
		
		/*
		
		실수 -> 문자열로 바꾸는 방법
		
		double db = 1.23432;
		String dbStr = String.valueof(db);
		
		*/
		
		System.out.print("1. 두 번째 정수:");
		int num2 = sc.nextInt();
		sc.nextLine();
		String str2 = Integer.toString(num2);
		
		System.out.println(">>결과 :"+(num1+num2)+","+(str1+str2));
		
		sc.close();
	}

}

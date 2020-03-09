package my.day06.a.forTest;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ForTest4Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		for(;;) {
			
			try {
			System.out.print(">>구구단 몇단볼래? ");
			int dan = sc.nextInt(); // 8단
			
			sc.nextLine(); // 스캐너 버퍼에 엔터를 싹 비워 ~~~~~~ 
			
			System.out.println("==="+dan+"단===");
			
			for(int i=0; i<9; i++) {
				System.out.println(dan+"*"+(i+1)+"="+(dan*(i+1))); // 8*1=8
			}
			
			
			
			System.out.print(">> 또 하시겠습니까?[Y/N]");
			String yorn = sc.nextLine();
			//if(yorn.equals("Y") || yorn.equals("y")) { //문자열 비교는 ==이 아니라 .equals
			if(yorn.equalsIgnoreCase("Y")) {
				continue;
			}else {
				break;
			}
			
			}catch(InputMismatchException e) {
				System.out.println("정수만 입력하세요!");
				sc.nextLine();
				continue;
			}
			
		} //end of for ----------------------
		System.out.println("프로그램 종료.");
		sc.close();
		
	}

}

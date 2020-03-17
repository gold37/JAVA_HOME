package my.day07.d.game;

import java.util.Scanner;

public class GawibawiboMain {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int userNum=0;
	
		do {
			
			System.out.println("======== 메뉴 ========");
			System.out.println("1.가위\t2.바위\t3.보\t4.종료");
			System.out.println("====================");
			System.out.print(">> 선택하세요 => ");
			
			try {//예외처리 하기위해 사용
				userNum = Integer.parseInt(sc.nextLine()); //사용자가 입력한 묵찌빠
				
				if(!(1<=userNum && userNum<=4)) {// 1~4사이가 아니라면
					System.out.println("메뉴에 존재하지않는 번호입니다-3-");
					continue;
				} 
				
				if(userNum != 4) {// 1~3사이
					System.out.println("PC와 대결");
					//랜덤한 정수 1~3을 만들자
					//랜덤한 정수 = (int)(Math.random()*구간범위)+시작값;
					int pcNum = (int)(Math.random()*3-1+1)+1;
					
					String msg = "";
					if((pcNum==1 && userNum==2) || 
					   (pcNum==2 && userNum==3)	||
					   (pcNum==3 && userNum==1) ) {//사용자가 이긴 경우 
						
						msg = ">>> 사용자님이 이겼습니다 >ㅁ<\n";
					}
					
					else if((pcNum==1 && userNum==3) || 
							(pcNum==2 && userNum==1) ||
							(pcNum==3 && userNum==2) ) {//사용자가 진 경우 (== pc가 이긴 경우)
						msg = ">>> 사용자님이 졌습니다 T^T\n";
					}
					else {//사용자와 pc가 비긴 경우
						msg = ">>> 비겼습니다 한번 더 고";
					}
					
					System.out.println(msg);
				
				}
				
				
			}catch(NumberFormatException e) {
				System.out.println("숫자로만 입력하세요 ㅡ3ㅡ");
				continue;
			}
			
		}while(!(userNum==4)); // while문 탈출조건
		
		sc.close();
		System.out.println("프로그램 종료! 집 가자!");
	}

}

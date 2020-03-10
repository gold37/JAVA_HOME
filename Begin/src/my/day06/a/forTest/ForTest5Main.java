package my.day06.a.forTest;

import java.util.Scanner;

public class ForTest5Main {

	public static void main(String[] args) {
		// 1+2+3+4+5+6+7+8+9+10 = 55
		// 11+12+13+14+15+16+17+18+19+20 = 155
		
		int sum = 0; // 누적의 합
		
		for(int i=0, j=1; i<10; i++, j++) {
			sum += j; // sum + j = sum;
					  //  0  + 1 = sum;
					  //  0  + 1  + 2 = sum;
					  //  0  + 1  + 2  + 3 = sum;
					  //  0  + 1  + 2  + 3  +  4  + 5  + .. +10 = sum;
		}
		
		System.out.println("1~10까지 누적의 합계:"+sum);
		
		
		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
		
		sum = 0; // 누적의 합을 0으로 초기화해줌
		for(int i=0, j=11; i<10; i++, j++) {
			sum += j; // sum + j = sum;
					  //  0  + 11 = sum;
					  //  0  + 11  + 12 = sum;
					  //  0  + 11  + 12  + 13 = sum;
					  //  0  + 11  + 12  + 13 +  14  + 15  + .. +20 = sum;
		}
		System.out.println("11~20까지 누적의 합계:"+sum);
		
		
		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print(">>누적하고싶은 시작 숫자=> ");
		int start = sc.nextInt();

		System.out.print(">>누적하고싶은 마지막 숫자=> ");
		int end = sc.nextInt();
		
		sum = 0; // 누적 합 다시 0으로 초기화
		int cnt = end-start+1; // 반복해야 할 횟수
		
		for(int i=0, j=start; i<cnt; i++) { // 초기값은 start가 들어오고
			sum += j++; // sum + j = sum; j가 증가됨
				// ▲후위연산자라는거 ~!
							
		} //end of for ------------
		
		System.out.println(start+"부터 "+end+"까지의 누적 합계:"+sum);
		
		sc.close();
	}

}

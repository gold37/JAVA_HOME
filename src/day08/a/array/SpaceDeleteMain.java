package my.day08.a.array;

import java.util.Scanner;

public class SpaceDeleteMain {

	public static void main(String[] args) {

		/*
			=== 입사문제 ===
			문자열 중 공백 제거하기
			
		*/
		
		String str = "korea  s e ou  l   KH 정보 교육 원";
		
		char[] strChArr = str.toCharArray(); // char 타입으로 바꿔서 비교
		/*
			-----------------------------------------------------------
			k|o|r|e|a| | |s| |e| |o|u| | |l| | | |K|H| |정|보| |교|육| |원
			-----------------------------------------------------------
		 */
		
		int len = 0; // 공백 아닌 글자 몇개?
		for(int i=0; i<strChArr.length; i++) {
			if(strChArr[i] != ' ') len++; // 공백이 아니라면 len을 증가시켜라
		}
		
		System.out.println("len => "+len); // 공백 아닌 글자 len => 17개
		
		char[] resultArr = new char[len];
		
		for(int i=0, j=0; i<strChArr.length; i++, j++) { // i= 반복횟수
			if(strChArr[i] != ' ') // 공백이 아니라면 방에 글자 넣어라
				resultArr[j] = strChArr[i]; //공백이 포함돼서 17보다 길어지기 때문에 엉뚱한 방에 입력될 수 있으니까 새로운 변수를 줌
			else 
				j--; // 공백이면 +1-1=0 그대로 자리에 머뭄. 공백 방에 문자가 들어감
		}
		
		
		/*
			-----------------------------------
			k|o|r|e|a|s|e|o|u|l|K|H|정|보|교|육|원
			-----------------------------------
		 */
		
			System.out.println(String.valueOf(resultArr)); // .valueOf는 타입을 전부 String으로 바꿈
		
		// koreaseoulKH정보교육원
					
	}

}

package my.day07.c.mathrandom;

import java.util.Random;

public class RandomMain {

	public static void main(String[] args) {

		// 보안상 Math.random() 보다는 new Random();을 사용하기를 권장함
		
		// 1부터 10까지 중 랜덤한 수 발생시키기
		Random rnd = new Random();
		// int n = rnd.nextInt(마지막 수 - 처음 수 +1)+처음수 ---> 범위
		int n = rnd.nextInt(10-1+1)+1;
		System.out.println("1부터 10까지 중 랜덤하게 발생한 값 : "+n);
		
		// 숫자 3개 소문자 4개 숫자 1개
		String result = "";
		
		for(int i=0; i<3; i++) {
			int num = rnd.nextInt(10);
			result += num;
		}
		
		for(int i=0; i<4; i++) {
			int num = rnd.nextInt('z'-'a'+1)+'a';
			result += (char)num;
		}
		
		int num = rnd.nextInt(10);
		result += num;
		
		System.out.println("인증키: "+ result);
		
		
	}

}

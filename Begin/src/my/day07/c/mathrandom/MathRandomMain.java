package my.day07.c.mathrandom;

public class MathRandomMain {

	public static void main(String[] args) {

		// 로또 프로그램 1~45  무작위 랜덤 6개 5 8 13 4 40 32
		
		
		double random = Math.random();
		System.out.println("random = "+random);
		/*
		 	random => 0.3856975846749279
		 	random => 0.35996846214919753
		 	random => 0.8575763990984605

		 */
		
		/*
		 	java.lang.Math.random() 메소드는
		 	0.0이상 1.0미만의 실수(double)값을 랜덤하게 나타내주는 메소드
		 	즉, 0.0 <= 임의의 난수(실수) <1.0
			
		 	
		 	1부터 10까지 중 랜덤한 정수를 얻어온다
			☆★☆★☆★☆★
			랜덤한 정수 = (int)(Math.random()*구간범위)+시작값;
			
		 	0.0 		(int)(0.0*(10-1+1))+1       ==> 최소값  1
		 	0.23        (int)(0.23*(10-1+1))+1      ==> 3 
		 	0.678		(int)(0.678*(10-1+1))+1     ==> 7
		 	0.9999999   (int)(0.9999999*(10-1+1))+1 ==> 최대값 10
		 	
			
			3부터 7까지 중 랜덤한 정수를 얻어온다

		 	0.0 		(int)(0.0*(7-3+1))+3       ==> 3
		 	0.23        (int)(0.23*(7-3+1))+3      ==> 4 
		 	0.678		(int)(0.678*(7-3+1))+3     ==> 6
		 	0.9999999   (int)(0.9999999*(7-3+1))+3 ==> 7
		 
		 */
		
			int rand1 = (int)(Math.random()*(10-1+1))+1;
			System.out.println("1부터 10까지 중 랜덤하게 발생한 값: "+rand1);
		
			
			int rand2 = (int)(Math.random()*(7-3+1))+3;
			System.out.println("3부터 7까지 중 랜덤하게 발생한 값: "+rand2);
			
			int rand3 = (int)(Math.random()*('z'-'a'+1))+'a';
			System.out.println("a부터 z까지 중 랜덤하게 발생한 소문자: "+(char)rand3);
			
			/*
			 	임시 비밀번호
				131aztb9
				숫자 3개 소문자 4개 숫자1개
			*/
			String result = "";
			
			for(int i=0; i<3; i++) { // 숫자 3개 랜덤
				
				int num = (int)(Math.random()*(9-0+1))+0;
				result += num;
			}
		
			for(int i=0; i<4; i++) { // 소문자 4개 랜덤
				
				int num = (int)(Math.random()*('z'-'a'+1))+'a';
				result += (char)num;
			}
			
			int num = (int)(Math.random()*(10-0+1))+0; // 숫자 1개 랜덤
			result += num;
			
			System.out.println("인증키=>" + result);
	
	}

}

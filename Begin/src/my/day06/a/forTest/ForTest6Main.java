package my.day06.a.forTest;

public class ForTest6Main {

	public static void main(String[] args) {

		
		char ch = 'a';
		for(int i=0; i<'u'-'a'+1; i++) {
			System.out.print(ch++); // 찍어주고 증가
			
			if((i+1)%7==0) { // 7의 배수
				System.out.print("\n");
			}
		/*
		  abcdefg
		  hijklmn
		  opqrstu

		 */
		
		}
		
		System.out.println("\n~~~~~~~~이중for문~~~~~~~~");
		
		/*
		  {abcdefg}
		  {hijklmn}
		  {opqrstu}
			
		    3행 7열	
		 */
		
		ch = 'a';
		for(int i=0; i<3; i++) { //바깥 for문 == 행
			for(int j=0; j<7; j++) { //내부 for문 == 열
				System.out.print(ch++);
			}
			System.out.print("\n");
		}
		
		System.out.println("\n==============Quiz 1==============");
		
		for (int i=0; i<4; i++) {
			for(int j=0; j<3; j++) {
				System.out.print("["+i+","+j+"]");
			}
			System.out.print("\n");
		}
		
		
		/*
			[0,0][0,1][0,2]
			[1,0][1,1][1,2]
			[2,0][2,1][2,2]
			[3,0][3,1][3,2]
			
				 4행3열
		 */
		
		
		
		
		
		System.out.println("\n==============Quiz 2==============");
		
		for (int i=0; i<4; i++) {
				if(i==2)
					continue;
			for(int j=0; j<3; j++) {
				System.out.print("["+i+","+j+"]");
				
			}
			System.out.print("\n");
		}
		
		/*
		[0,0][0,1][0,2]
		[1,0][1,1][1,2]
		[3,0][3,1][3,2]
		 */
		
		System.out.println("\n==============Quiz 3==============");
		
		for (int i=0; i<4; i++) {
			for(int j=0; j<3; j++) {
				if(j==1) 
					continue;
				System.out.print("["+i+","+j+"]");
				
			}
			System.out.print("\n");
		}

		/*
			[0,0][0,2]
			[1,0][1,2]
			[2,0][2,2]
			[3,0][3,2]
		 */
		
		System.out.println("\n==============Quiz 4==============");
		
		/*
			501호	502호	503호	505호
			301호	302호	303호	305호
			201호	202호	203호	205호
			101호	102호	103호	105호
		 */
				
		for (int i=5; i>0; i--) {
				if(i==4)
					continue;
			for (int j=1; j<6; j++) {
				if(j==4)
					continue;
				System.out.print(i+"0"+j+"호\t");
			}
			System.out.print("\n");
		}

		
		
		System.out.println("\n==============입사 문제==============");
		
		/*
		 	1부터 100까지 중 3의 배수의 합은? 3+6+9+12+15+...+ = 1683
		 	1부터 100까지 중 9의 배수의 합은? 9+18+27+36+...+ = 594
		 */
		
		int sum1=0, sum2=0;
		
		for(int i=0; i<100; i++) {
			if(i%3 == 0) {
				sum1+=i;
			}
			if(i%9 == 0) // else if가 아닌 이유는 9도 3의 배수이기 때문에!!!!
				sum2+=i;
		}
		
		System.out.println("1부터 100까지 중 3의 배수의 합은?"+sum1);
		System.out.println("1부터 100까지 중 9의 배수의 합은?"+sum2);
		
		
		System.out.println("\n==============숙제1==============");
		
		/*
			1부터 10까지 중 홀수 누적의 합은?
			1+3+5+7+9 = 25
			
			1부터 10까지 중 짝수 누적의 합은?
			2+4+6+8+10 = 30
		 */
		int box1=0, box2=0;
		String hol="", zak="", plus="";
		
		for(int i=0; i<10; i++) { // i=0123456789
			if((i+1)%2!=0) {
				box1 += (i+1);
				plus = (i<8)?"+":"";
				hol += (i+1)+plus;
			}else {
				box2 += (i+1);
				plus = (i<8)?"+":"";
				zak += (i+1)+plus;
			}
		}
		System.out.println("1부터 10까지 중 홀수 누적의 합은?");
		System.out.println(hol+"="+box1);
		System.out.println("1부터 10까지 중 짝수 누적의 합은?");
		System.out.println(zak+"="+box2);
 		
	}
}

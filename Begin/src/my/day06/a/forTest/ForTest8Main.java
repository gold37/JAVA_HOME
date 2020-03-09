package my.day06.a.forTest;

public class ForTest8Main {

	public static void main(String[] args) {

		/*
		 	=== 레이블을 사용하여 break하기 ===
		 	레이블은 뒤에 : 을 붙이며 반드시 반복문 앞에 써야 한다
		 */
	
		for(int i=0; i<10; i++) { //10행
			for(int j=0; j<5; j++) { //5열
				if(i==2 && j==2)
					break;
				System.out.print("["+i+","+j+"]");
			}
			System.out.println("\n");
		}
		
		System.out.println("\n------------------------------");
		
		
		help: // help: 을 레이블이라고 부르는데 그 레이블 이름이 지금은 help:일 뿐이다(글자는 내 마음대로 설정)
		for(int i=0; i<10; i++) { //10행
			for(int j=0; j<5; j++) { //5열
				if(i==2 && j==2)
					break help; // break 레이블명;을 하면 레이블명: 다음에 오는 반복문을 빠져나감
				System.out.print("["+i+","+j+"]");
			}
			System.out.println("\n");
		}
		
		
		
	}
}

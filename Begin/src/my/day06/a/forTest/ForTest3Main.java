package my.day06.a.forTest;

public class ForTest3Main {

	public static void main(String[] args) {

		int cnt = 0;
		
		for(;;) {
			System.out.println(++cnt+"번째 반복");
			if(cnt==10) break;
		}
		/*
		 	1번째 반복
		 	2번째 반복
		 	3번째 반복
		 	4번째 반복
		 	5번째 반복
		 	6번째 반복
		 	7번째 반복
		 	8번째 반복
		 	9번째 반복
		 	10번째 반복
		 */
	}

}

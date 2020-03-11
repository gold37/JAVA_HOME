package my.day08.a.array;

public class LottoMain {

	public static void main(String[] args) {
		
		/*
			int ball ==>   1,  2,  3,  4,  5 .....  43,  44,  45
					 ==> 101,102,103,104,105 ..... 143, 144, 145

			int [] ballArr = new int[45];
			
			----------------------------
			|0|1|2|3|4|5|.....|42|43|44|
			----------------------------
		 */
		
		int[] ballArr = new int[45];
		int[] tempArr = new int[5]; // 기존에 뽑았던 방 번호를 기억시켜두는 공간
		
		
		for(int i=0; i<ballArr.length; i++) {
			ballArr[i] = 1+i; 
		/* 배열의 방마다 데이터 입력하기
		      데이터 값은 1~45
		*/
		}
		
		for(int i=0; i<tempArr.length; i++) {
			tempArr[i] = -1;
		/*
			공을 꺼내어 오면 꺼내온 공의 방번호(index 번호)를 기억하는 곳으로 사용.
			꺼내온 공의 방번호(index 번호)가 0(실제로는 1번볼)이 들어올수 있으므로
			데이터값은 방번호(index 번호)로 사용하지 않는 -1로 모두(5개) 초기화한다.
			
		 */
		}
		
		
		
		
		// 공의 방 번호(index)를 꺼내는 작업을 6번 반복
		// 0번 방 부터 44번 방까지 랜덤하게 6번 뽑기
		// 즉, 0 ~ 44까지 난수를 발생시켜야 함
		
		String result = ""; // 랜덤하게 뽑은 공의 데이터값(1~45)을 보여주기 위한 용도
		
		outer:
		for(int i=0; i<6; i++) { // 같은 수 또 뽑을 수 있기 때문에 경우의 수를 i<6로 하면 안됨
			// 랜덤한 정수 = (int)(Math.random()*구간범위)+시작값;
			int idx = (int)(Math.random()*(44-0+1))+0;
			// 9 0 12 4 34 20
			
			// tempArr[5] ===>랜덤하게 뽑은 배열의 방 번호를 기억하는 공간 6번째거는 뽑아서 이미 뽑은 5개랑 비교할거기때문에 방5개만 필요
			/*
			 		-----------
			index  	|0|1|2|3|4|
				    -----------
					 0 0 0 0 0
					 7 0 0 0 0
			
			값		tempArr[0] => 0
			값		tempArr[1] => 0
			값		tempArr[2] => 0
			값		tempArr[3] => 0
			값		tempArr[4] => 0
			
			처음에 뽑은난수 (배열의 방 번호) 0 7 0
			
			
			 		-----------
			index  	|0|1|2|3|4|
				    -----------
					-1-1-1-1-1
					 0 7 
			
			값		tempArr[0] => 0
			값		tempArr[1] => 0
			값		tempArr[2] => 0
			값		tempArr[3] => 0
			값		tempArr[4] => 0
			
			처음에 뽑은난수 (배열의 방 번호) 0 7 0
			 
			 */
			
			
			for(int j=0; j<tempArr.length; j++) {
				
				if(idx == tempArr[j]) { // 뽑은게 이미 있다면
					i--; // 감해서 다시 제자리로 오게해서 기회를 더 줌
					continue outer;
				}
			}// end of for -------------------
			
			if(i<5)
				tempArr[i] = idx; // 뽑은 방 번호(index)를 기억시켜둠
			String comma = (i<5)?",":"\n"; // 방 번호 0~4까지는 , 찍고 마지막은 줄바꿈
			result += ballArr[idx]+comma; 
			
		}
		
		System.out.println("로또 1등 당첨번호: "+result);
	}

}

package my.day09.a.bubblesort;

import java.util.Arrays;

public class BubblesortMain {

	public static void main(String[] args) {

		/*
		    == 입사문제 ==
			>> 버블 정렬(Bubble Sort)은 
			 정렬 대상 리스트(배열)의 항목을 수평방향으로 나열했다고 가정했을 때, 
			 왼쪽 끝에서부터 시작해서 인접하는 두 항목의 값을 비교하여 
			 올바른 순서(오름차순 또는 내림차순)로 되어있지 않으면 서로 위치를 교환하는 정렬방법이다.
			 
			 이렇게 인접하는 항목의 값을 비교해서 위치를 교환하는 과정을 
			 리스트(배열)의 마지막 항목까지 반복해서 제일 큰(또는 작은) 값이 끝에 오도록 한다.
			 
			 각 회전(Pass)과정이 끝날때마다 정렬은 뒤에서부터 하나씩 완료된다. 
		 */
		 
		int[] numArr = {9,7,3,5,1};
		
		/*
		 * 	     방번호▼   값▼
			numArr[0] => 9
			numArr[1] => 7
			numArr[2] => 3
			numArr[3] => 5
			numArr[4] => 1
		 */
		
		System.out.println("=== 정렬하기 전 ===");
		for(int i=0; i<numArr.length; i++) {
			String str = (i<numArr.length-1)?",":"\n";
						    // ▲ 맨 마지막 값
			System.out.print(numArr[i]+str);
		}
		
		System.out.println("\n=== 오름차순 정렬하기 ===");
		for(int i=0; i<numArr.length-1; i++) { // 바깥for문 == 추출대상 개수 --> 배열 길이보다 한개 작음 -1
		      //▲첫 번째 방부터
			for(int j=0; j<numArr.length-1-i; j++) { // 안쪽 for문 == 비교횟수 
													 // i(방번호)--> 0 이면 j<4 4번 비교해야되니까 
												     // i(방번호)--> 1 이면 j<3 3번 비교해야되니까!
												     // i(방번호)--> 2 이면 j<2 2번 비교해야되니까!
												     // i(방번호)--> 3 이면 j<1 1번 비교해야되니까!
			if(numArr[j]>numArr[j+1]) { //큰 숫자가 앞에 있으면 								   
			//     9		7
			//     9		3
			//     9		5
			//     9		1
				int temp = numArr[j]; // 큰 숫자를 임시공간에 넣어놓자 cf.사이다랑 커피 서로 바꿔 담으려면 빈 컵이 하나 필요하니까
				numArr[j] = numArr[j+1]; // numArr[0] = 7, 9자리에 7이 옴
				numArr[j+1] = temp; // numArr[1] = 9, 7자리에 9가옴
			}
			}//end of for ----------
			
		}//end of for ----------
			
		 	System.out.println("=== 정렬한 데이터 값 출력하기 ===");
			for(int i=0; i<numArr.length; i++) {
				String str = (i<numArr.length-1)?",":"\n";
							    // ▲ 맨 마지막 값
				System.out.print(numArr[i]+str);
			}
			
			
			
			System.out.println("\n-----------------------");
			
			int[] numArr2 = {9,7,3,5,1};
			
			System.out.println("=== 정렬하기 전 ===");
			for(int i=0; i<numArr.length; i++) {
				String str = (i<numArr.length-1)?",":"\n";
							    // ▲ 맨 마지막 값
				System.out.print(numArr[i]+str);
			}
			
			System.out.println("\n=== 내림차순 정렬하기 ===");
			for(int i=0; i<numArr2.length-1; i++) { // 바깥for문 == 추출대상 개수 --> 배열 길이보다 한개 작음 -1
			      //▲첫 번째 방부터
				for(int j=0; j<numArr2.length-1-i; j++) { 
				if(numArr2[j]<numArr2[j+1]) { //큰 숫자가 앞에 있으면 								   
			
					int temp = numArr2[j]; // 큰 숫자를 임시공간에 넣어놓자 cf.사이다랑 커피 서로 바꿔 담으려면 빈 컵이 하나 필요하니까
					numArr2[j] = numArr2[j+1]; // numArr[0] = 7, 9자리에 7이 옴
					numArr2[j+1] = temp; // numArr[1] = 9, 7자리에 9가옴
				}
				}//end of for ----------
				
			}//end of for -------
			
			System.out.println("=== 정렬한 데이터 값 출력하기 ===");
			for(int i=0; i<numArr2.length; i++) {
				String str = (i<numArr2.length-1)?",":"\n";
							    // ▲ 맨 마지막 값
				System.out.print(numArr2[i]+str);
			}
			
			
			
			System.out.println("\n==== Arrays.sort()한 결과 ====");
			int[] numArr3 = {9,7,3,5,1};
			Arrays.sort(numArr3); // 오름차순 정렬
			// 값  	 1 3 5 7 9
			// 방번호   0 1 2 3 4
			System.out.println("=== Arrays.sort()한 결과 값 출력하기 ===");
			for(int i=0; i<numArr3.length; i++) {
				String str = (i<numArr3.length-1)?",":"\n";
							    // ▲ 맨 마지막 값
				System.out.print(numArr3[i]+str);
			}
			
			
	}// end of main() ----------

}

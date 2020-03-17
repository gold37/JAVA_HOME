package my.day08.a.array;

public class ArrayMain {

	public static void main(String[] args) {

		/*
			=== 배열 (Array)이란? ===
			☆동일한 데이터타입★을 가지는 여러개의 데이터를 담을 수 있는 데이터 타입을 말한다
			 배열 또한 객체라는 것을 꼭 기억하도록 한다 !!!!!!! 암기 !!!!!!!!
			
		 */

	
		//	1. === 배열의 선언 ===
			int[] subjectArr; // int 타입을 여러개 받아 들일 수 있는 변수 subjectArr. cf☆★변수 작명 잘하기		
		// 또는 
		//	int subjectArr[]; 위에거랑 같은 뜻
			
		//  2. === 선언 되어진 배열을 메모리에 할당 해주기 ===
			subjectArr = new int[7]; // int type maximum 7개 담기 가능
			
		/*
		 *    ▼ 방 번호는 0부터
			 -----------------------------
			 | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
			 -----------------------------
			 위의 숫자는 배열의 인덱스(index)를 가리키는 번호로서
			 0부터 시작하여 1씩 증가한다
			 배열의 인덱스(index)를 일반적으로 "배열의 방번호"라고 부른다.
			 
			 배열에 저장된 데이터를 표현할 때는 아래와 같이 배열명 [인덱스번호]로 나타낸다.
			 
			 subjectArr[0] ==> 0번 방
			 subjectArr[7] ==> 존재하지 않는 방이므로 오류!!
			 
			 ☆★☆★ 
			 배열로 선언된 변수에는 자동적으로 초기값이 들어감
			 값을 주지 않더라도 자동적으로 정수는 0, 실수는 0.0, char는 ' ', String을 포함한 객체는 null이 들어간다
			 
			 
		 */
			
		// ☆★☆★ 배열의 길이는 배열명.length로 알아온다
			
			
			System.out.println("배열 subjectArr의 길이: " + subjectArr.length);
			
			System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~~");
			
			for(int i=0; i<subjectArr.length; i++) {
				int val = subjectArr[i]; 
				System.out.println("subjectArr["+i+"] =>" + val);
			}
			
			
		// 3. === 데이터에 값 넣어주기 ===
			subjectArr[0] = 90; //국어
			subjectArr[1] = 100; //영어
			subjectArr[2] = 80; //수학
			subjectArr[3] = 85; //과학
			subjectArr[4] = 70; //사회
			subjectArr[5] = 90; //음악
			subjectArr[6] = 100; //체육
			
	
			System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~~");
			
			for(int i=0; i<subjectArr.length; i++) {
				int val = subjectArr[i]; 
				System.out.println("subjectArr["+i+"] =>" + val);
			
			}
			System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~~");
			
			int sum = 0; // 누적 합 담을 변수
			for(int i=0; i<subjectArr.length; i++) {
				 sum += subjectArr[i]; 
			}
			System.out.println("총점: "+sum);
			
			System.out.println("평균: "+Math.round((double)sum/subjectArr.length*10)/10.0);
	
			System.out.println("\n========== 줄이기  =============");
			
			
			/*
			 	위의 1. === 배열의 선언 === 과
			 	2. === 선언 되어진 배열을 메모리에 할당 해주기 === 를
			 	각각 따로하지 않고 아래와 같이 동시에 할 수 있다
			 */
			
			
			int[] subjectArr2 = new int[7];
			
			subjectArr2[0] = 90; //국어
			subjectArr2[1] = 100; //영어
			subjectArr2[2] = 80; //수학
			subjectArr2[3] = 85; //과학
			subjectArr2[4] = 70; //사회
			subjectArr2[5] = 90; //음악
			subjectArr2[6] = 100; //체육
			
				for(int i=0; i<subjectArr2.length; i++) {
					int val = subjectArr2[i]; 
					System.out.println("subjectArr["+i+"] =>" + val);
			
					}
		
			sum = 0; // 누적 합 담을 변수
			for(int i=0; i<subjectArr2.length; i++) {
				 sum += subjectArr[i]; 
			}
			System.out.println("총점: "+sum);
			
			System.out.println("평균: "+Math.round((double)sum/subjectArr2.length*10)/10.0);
	
			System.out.println("\n========== 더ㅓㅓ 줄이기  =============");
			
			/*
		 		위의 1. === 배열의 선언 === 과
		 		2. === 선언 되어진 배열을 메모리에 할당 해주기 ===
		 	 	3. === 데이터에 값 넣어주기를
		 		각각 따로하지 않고 아래와 같이 동시에 할 수 있다.
			 */
			
				int[] subjectArr3 = new int[] {90,100,80,85,70,90,100};
			
				for(int i=0; i<subjectArr3.length; i++) {
					int val = subjectArr3[i]; 
					System.out.println("subjectArr["+i+"] =>" + val);
		
				}
	
				sum = 0; // 누적 합 담을 변수
				for(int i=0; i<subjectArr3.length; i++) {
					 sum += subjectArr3[i]; 
				}
				System.out.println("총점: "+sum);
				
				System.out.println("평균: "+Math.round((double)sum/subjectArr3.length*10)/10.0);

				System.out.println("\n========== 더ㅓㅓ 줄이기 초간단  =============");
				
				/*
			 		위의 1. === 배열의 선언 === 과
			 		2. === 선언 되어진 배열을 메모리에 할당 해주기 ===
			 	 	3. === 데이터에 값 넣어주기를
			 		각각 따로하지 않고 아래와 같이 동시에 할 수 있다.
			 		new int[]는 생략 가능하다!!!
				 */
			
				int[] subjectArr4 ={90,100,80,85,70,90,100};
				
				for(int i=0; i<subjectArr4.length; i++) {
					int val = subjectArr4[i]; 
					System.out.println("subjectArr["+i+"] =>" + val);
		
				}
	
				sum = 0; // 누적 합 담을 변수
				for(int i=0; i<subjectArr4.length; i++) {
					 sum += subjectArr4[i]; 
				}
				System.out.println("총점: "+sum);
				
				System.out.println("평균: "+Math.round((double)sum/subjectArr4.length*10)/10.0);
				

				System.out.println("\n----------------------------");
				// >>>> 확장된 for문(== 개선된 for문, for each문) <<<< 
				for(int subject : subjectArr4) {
				//	▲변수타입,변수명     ▲배열명	
				// subjectArr4 배열 길이 만큼 반복한다
				// 반복하면서 int subject 변수 속의 배열방에 들어있는 값을 넣어줌
					System.out.println(subject); // 90 100 80 85 70 90 100 
				}
				
				int total=0;
				for(int subject : subjectArr4) {
					total += subject;
				}
				
				System.out.println("총점: "+total);
	
	} //end of main() ----------------

}

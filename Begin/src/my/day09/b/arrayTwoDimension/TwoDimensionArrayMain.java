package my.day09.b.arrayTwoDimension;

public class TwoDimensionArrayMain {

	public static void main(String[] args) {
		
		// === 1차원 배열 === //
		int[] subjectArr = new int[5]; // 1행(항상) 5열
		/*
			-----------
			|0|1|2|3|4|
			-----------
			
		 */
		
		// === 2차원 배열 === //
		int[][] pointArr = new int[4][3]; // 4행 3열
		
		/*
			[0][0]	[0][1]	[0][2]
			[1][0]	[1][1]	[1][2]
			[2][0]	[2][1]	[2][2]
			[3][0]	[3][1]	[3][2]
		 */
		
		pointArr[0][0]=10;
		pointArr[0][1]=20;
		pointArr[0][2]=30;

		pointArr[1][0]=40;
		pointArr[1][1]=50;
		//pointArr[1][2]=60;
		
		pointArr[2][0]=70;
		pointArr[2][1]=80;
		pointArr[2][2]=90;
	/*	
		pointArr[3][0]=100;
		pointArr[3][1]=200;
		pointArr[3][2]=300;
	*/
		System.out.println("pointArr.length="+pointArr.length); 
		// 이차원배열명.length ==> 행의 길이가 나옴
		
		System.out.println("pointArr.length[0]="+pointArr[0].length);
		// 이차원배열명[행의 인덱스].length ==> 그 행의 존재하는 열의 길이가 나옴
		
		System.out.println("pointArr.length[3]="+pointArr[3].length);
		// 값을 안넣어줘도 0이 들어가 있기 때문에 열은 3이 나옴
		
		System.out.println("\n-------------------------------------\n");
		
		for(int i=0; i<pointArr.length; i++) { // 행
			for(int j=0; j<pointArr[i].length; j++) { // 열
				String str = (j<pointArr[i].length-1)?",":"";
				System.out.print(pointArr[i][j]+str);
			}
			System.out.print("\n");
		}
		
		System.out.println("\n-------------------------------------\n");

		int[][] jumsuArr = new int[4][]; // 4행null열
		
		/*
		
		jumsuArr[0][0]=10; // 열의 크기를 설정하지 않았으므로 NullPointerException
		jumsuArr[0][1]=20;
		jumsuArr[0][2]=30;
		
		 */
		
		jumsuArr[0] = new int[3]; //	0행은 열을 3개만 쓰겠다
		jumsuArr[1] = new int[2]; //	1행은 열을 2개만 쓰겠다
		jumsuArr[2] = new int[3]; //	2행은 열을 3개만 쓰겠다
		jumsuArr[3] = new int[3]; //	3행은 열을 3개만 쓰겠다
		
		jumsuArr[0][0]=10; 
		jumsuArr[0][1]=20;
		jumsuArr[0][2]=30;		

		jumsuArr[1][0]=40; 
		jumsuArr[1][1]=50;
		//jumsuArr[1][2]=60; // 오류		
	
		jumsuArr[2][0]=40; 
		jumsuArr[2][1]=50;
		//jumsuArr[2][2]=60; 		
		
		
		for(int i=0; i<jumsuArr.length; i++) { // 행
			for(int j=0; j<jumsuArr[i].length; j++) { // 열
				String str = (j<jumsuArr[i].length-1)?",":"";
				System.out.print(jumsuArr[i][j]+str);
			}
			System.out.print("\n");
		}
		
		System.out.println("\n-------------------------------------\n");
		
		int[][] valArr = {{10,20,30}, 
						  {40,50},
						  {70, 80, 90},
						  {0,0,0}};
		for(int i=0; i<valArr.length; i++) { // 행
			for(int j=0; j<valArr[i].length; j++) { // 열
				String str = (j<valArr[i].length-1)?",":"";
				System.out.print(valArr[i][j]+str);
			}
			System.out.print("\n");
		}
		
	}// end of main() ------------------

}

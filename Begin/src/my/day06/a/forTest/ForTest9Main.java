package my.day06.a.forTest;

public class ForTest9Main {

	public static void main(String[] args) {

		System.out.println("\n\t == 구구단을 외우자 구구단을 외우자 ==");
		
		/*

			2*1=2	3*1=3		....	9*1=9
			2*2=4	3*2=3		....	9*2=9
			2*3=6	3*3=3		....	9*3=9
			2*4=8	3*4=3		....	9*4=9
			2*5=10	3*5=3		....	9*5=9
			2*6=12	3*6=3		....	9*6=9
			2*7=14	3*7=3		....	9*7=9
			2*8=16	3*8=3		....	9*8=9
			2*9=18	3*9=3		....	9*9=81
			
							9행 8열
		 */
		
		// row = 행(줄) , col = 열(단)
	
		for(int row=1; row<9; row++) { // 9행
			for(int col=2; col<=9; col++) { // 8열
				System.out.print(col+"*"+row+"="+(col*row)+"\t");
			}
			System.out.println("\n");
		}
	
	
	}

}

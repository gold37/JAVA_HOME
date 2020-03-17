package my.day06.a.forTest;

public class ForTest7Main {

	public static void main(String[] args) {

		/*
		 	문제 1
		 			(i,j)
		 	*****	(0,0) (0,1) (0,2) (0,3) (0,4)
		 	****	(1,0) (1,1) (1,2) (1,3) (1,4)
		 	***		(2,0) (2,1) (2,2) (2,3) (2,4)
		 	**		(3,0) (3,1) (3,2) (3,3) (3,4)
		 	*		(4,0) (4,1) (4,2) (4,3) (4,4)
		 	
		 	
		 			(0,0) (0,1) (0,2) (0,3) (0,4)
		 			(1,0) (1,1) (1,2) (1,3)
		 			(2,0) (2,1) (2,2)
		 			(3,0) (3,1)
		 			(4,0)
		 			
		 			i+j <=4 이라면 *을 출련한다.
		 */
		
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				if(i+j<=4)
				System.out.print("*");
		}
		System.out.print("\n");
	}
		
		
		
		System.out.println("\n==============입사 문제==============");

		
		/*
		 	*********1
		 	********2
		 	*******3
		 	******4
		 	*****3
		 	****2
		 	***7
		 	**8
		 	*9
			9행 10열
		 */
		
		for (int i=9; i>0; i--) { // i= 9~1
			for(int j=i; j>0; j--) {  // *을 9번 찍음  1
									  // *을 8번 찍음  2
									  // *을 7번 찍음  3
									  // ... 
									  // *을 1번 찍음  9
									  // (10-i) = 		

				System.out.print("*");
			}
			System.out.println((10-i)+"\n");
		}
		
		
		System.out.println("\n==============숙제2==============");
		
		/*
			*
			**
			***
			****
			*****
		 */
		
<<<<<<< HEAD
=======

>>>>>>> java06/master
		for(int i=5; i>0; i--) {
			for(int j=i; j<6; j++) {
				System.out.print("*");
			}
			System.out.print("\n");
		}
<<<<<<< HEAD
		
=======

>>>>>>> java06/master
		
		System.out.println("\n==============숙제3==============");
		
		/*
				*
			   **
			  ***
			 ****
			*****
		 */
<<<<<<< HEAD
=======
		
>>>>>>> java06/master
		for(int i=0; i<6; i++) {  
			for(int j=5; j>0; j--) {
				if(j>i) {
					System.out.print(" ");
				}else {
					System.out.print("*");	
				}
			}
			System.out.print("\n");
		}
		
		
		System.out.println("\n==============숙제4==============");
		
		/*
			*
		   ***
		  *****
		  
		 */
		
<<<<<<< HEAD
=======
		int s=3;
		for(int i=3; i>0; i--) {
			for(int j=0; j<6; j++) 
				if(j<=s && i<=j) { 
				System.out.print("*");
				}else {
				System.out.print(" ");
			}
			s++;
			System.out.print("\n");
		}
>>>>>>> java06/master
		
		
		System.out.println("\n==============숙제5==============");
		
		/*

		  *****
		   ***
			*
		  
		 */
	
		
<<<<<<< HEAD
=======
		
		
>>>>>>> java06/master
		System.out.println("\n==============숙제6==============");
		
		/*
			*
		   ***
		  *****
		   ***
		   	*
		 */
	
<<<<<<< HEAD
	
=======
>>>>>>> java06/master
	}
}

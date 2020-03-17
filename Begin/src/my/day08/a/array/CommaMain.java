package my.day08.a.array;

import java.util.Scanner;

public class CommaMain {

	public static void main(String[] args) {

			/*
				=== 입사문제 ===
				123456789 ----> 123,456,789
				23456789 ----> 23,456,789
				3456789 ----> 3,456,789
				789 ----> 789
				
			
			 */	
		
			Scanner sc = new Scanner(System.in);
			System.out.print("금액을 입력하세요:");
			String inputStr = sc.nextLine(); // 123456789	23456789   
			
			int len = inputStr.length();  // len => 9	len =>  8
			int commaCount = len/3;  // commaCount => 3  commaCount => 2
			
			if(len%3==0) commaCount-=1; // 3의 배수는 -1해야 commaCount => 2  commaCount => 2
			
			char[] outputChArr = new char[len+commaCount]; //최종 결과 값. 원래길이+콤마개수 콤마가 몇개 필요합니까? 
														   //new char[11];  new char[10]; 
			char[] inputChArr = inputStr.toCharArray();
			/*     
			        입력 (input)
				-------------------    -----------------    
	            |1|2|3|4|5|6|7|8|9|    |2|3|4|5|6|7|8|9|     
	            -------------------    -----------------
				
				출력 (output)
				-----------------------    ---------------------    
	            |1|2|3|,|4|5|6|,|7|8|9|    |2|3|,|4|5|6|,|7|8|9|     
	            -----------------------    ---------------------
			콤마는 뒤에서부터 찍어주기 때문에 4의 배수마다 콤마를 찍어줌
			 */
			
			int cnt = 0;
			
			for(int i=outputChArr.length-1, j=inputChArr.length-1; i>=0; i--, j--) { // 뒷 방부터 차곡차곡 넣어줌
				cnt++; // 1 2 3 4 ....
				
				if(cnt%4 != 0) {
					outputChArr[i] = inputChArr[j]; // outputChArr[10] = inputChArr[8];
								                    // outputChArr[9] = inputChArr[7];
								                    // outputChArr[8] = inputChArr[6];
								
								                    // outputChArr[6] = inputChArr[5];
								                    // outputChArr[5] = inputChArr[4];
								                    // outputChArr[4] = inputChArr[3];
								
								                    // outputChArr[2] = inputChArr[2];
								                    // outputChArr[1] = inputChArr[1];
								                    // outputChArr[0] = inputChArr[0];
				}
				else {// 4의 배수라면 콤마를 넣음
					outputChArr[i] = ','; //outputChArr[7] = ',';  j는 5
					j++; // j가 같이 감해지면 콤마 자리에 원본이 지워지기 때문에  j를 다시 1증가 시켜줌.  j는 6 
					// outputChArr[3] = ',';  j는 2
                    // j는 3  
				}
			}
				System.out.println("결과:"+String.valueOf(outputChArr));
				sc.close();
	}

}

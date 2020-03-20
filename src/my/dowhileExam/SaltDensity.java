package my.dowhileExam;


/*
1% 물400g    
8% 물300g    

소금물의농도 = (소금의양/소금물의양)*100
 1 = (x/400)*100   => 소금의양은  4g
 8 = (x/300)*100   => 소금의양은 24g

 x = ((4+24)/700)*100 => 28/7  x => 4%

소금물의양 = (소금의양/소금물의농도)*100

소금의양 = (소금물의농도 * 소금물의양)/100


=========== 프로그램 실행결과  ================
== 혼합한 소금물의 농도 구하기 ==

물의양(g): 400
소금물농도(%): 1

▷ 최대 10번까지 입력이 가능합니다.
또 입력하시겠습니까?[Y/N] y

물의양(g): 300
소금물농도(%): 8

▷ 최대 10번까지 입력이 가능합니다.
또 입력하시겠습니까?[Y/N] n

>> 소금물농도 4.0% 인 소금물 700.0g 을 만들었습니다.
>> 프로그램 종료 <<



=========== 프로그램 실행결과  ================
== 혼합한 소금물의 농도 구하기 ==

물의양(g): 21.258
소금물농도(%): 12.245

▷ 최대 10번까지 입력이 가능합니다.
또 입력하시겠습니까?[Y/N] y

물의양(g): 6.826
소금물농도(%): 42.18

▷ 최대 10번까지 입력이 가능합니다.
또 입력하시겠습니까?[Y/N] y

물의양(g): 32.33
소금물농도(%): 0.169

▷ 최대 10번까지 입력이 가능합니다.
또 입력하시겠습니까?[Y/N] n

>> 소금물농도 9.16490647863078% 인 소금물 60.414g 을 만들었습니다.
>> 프로그램 종료 <<

*/

import java.util.InputMismatchException;
import java.util.Scanner;

public class SaltDensity {

	public static void main(String[] args) {
		
		 Scanner sc = new Scanner(System.in);

		 System.out.println("== 혼합한 소금물의 농도 구하기 ==\n");
		 
		 double sumWater = 0.0;
		 double sumSalt = 0.0;
		 int loop = 0; // 반복횟수
		 
		 do {
			 
			 try {
				 System.out.print("물의양(g): ");
				 double water = sc.nextDouble();
				 sc.nextLine();
				 
				 sumWater += water;
				 
				 System.out.print("소금물농도(%): ");
				 double saltDensity = sc.nextDouble();
				 sc.nextLine();
				 
				 sumSalt += (saltDensity * water)/100; // 소금량 누적하기
				
				 String yn = "";
				 
				 for(;;) {
					 System.out.print("\n▷ 최대 10번까지 입력이 가능합니다.\n"+
					                  "또 입력하시겠습니까?[Y/N] ");
					 yn = sc.nextLine();
					 System.out.print("\n");
					 
					 if("y".equalsIgnoreCase(yn) || "n".equalsIgnoreCase(yn)) {
						 break;
					 } 
				 }// end of for-------------------------------------
				 
				 loop++;
				 
				 if("n".equalsIgnoreCase(yn) || loop==10)
					 break;
				 
			 } catch(InputMismatchException e) {
				 System.out.println(">> 입력하시는 양은 숫자만 가능합니다.<<\n"); 
				 sc.nextLine();
			 }
			 
		} while (true);
		 
		double density = (sumSalt/sumWater)*100;
		 
		System.out.println(">> 소금물농도 "+density+"% 인 소금물 "+sumWater+"g 을 만들었습니다."); 
		 
		sc.close();
		 
		System.out.println(">> 프로그램 종료 <<");
	}

}


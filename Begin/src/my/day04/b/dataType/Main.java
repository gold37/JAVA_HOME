/*
=== *** 자료형 *** ===

      ※ 자료형의 종류

1. 원시형 타입(Primitive Type)

  1.1 정수형(byte, short, int, long)
      -- 자바에서 정수형의 기본타입은 int 이다.
      -- 그러므로 정수형의 값이 -2,147,483,648 ~ 2,147,483,647 범위를 벗어난 것이라면 반드시 숫자뒤에 소문자 l 또는 대문자  L 을 붙여야 한다.  
      
      byte (1byte == 8bit)  : -2^7  ~ 2^7-1  ==> -128 ~ 127 
      short(2byte == 16bit) : -2^15 ~ 2^15-1 ==> -32,768 ~ 32,767
      int  (4byte == 32bit) : -2^31 ~ 2^31-1 ==> -2,147,483,648 ~ 2,147,483,647  
      long (8byte == 64bit) : -2^63 ~ 2^63-1 ==> -9,223,372,036,854,775,808 ~  9,223,372,036,854,775,807         
      
  1.2 실수형(float, double) 
      float(4byte)  : 단정밀도   소수점이하 7자리까지 표현됨.     135.3246235
      double(8byte) : 배정밀도   소수점이하 15~16자리까지 표현됨. 135.3246234502345642
      -- 자바에서 실수형의 기본타입은 double 이다. 
                    그러므로 실수값을 float 형태로 나타내기 위해서는 실수뒤에 반드시 소문자 f 또는 대문자 F를 붙여야 한다. 
      
  
  1.3 문자형(char)
     char : 자바는 유니코드 체계를 사용하므로
                         문자형 타입인 char 는 2byte 이며, 범위는 0 ~ 65535 이다.
                         그래서 char 타입에는 문자 1개 또는 숫자(0~65535)도 올 수 있다.              
                         
     UNICODE 표 참조 
     http://www.tamasoft.co.jp/en/general-info/unicode.html                     
  
  === !!! 꼭 기억합시다 !!! ===
  int(4byte) 아래의 크기인  byte(1byte), short(2byte), char(2byte) 타입이 
       사칙연산(+ - * /)을 만나면 자동적으로 int 타입으로 자동 형변환이 발생된다.
  
  'A' => 65     'a' => 97
  'B' => 66     'b' => 98
  'C' => 67     'c' => 99
  
  '대문자' + 32 => 소문자에 해당하는 숫자
  '소문자' - 32 => 대문자에 해당하는 숫자
  
  '0' => 48
  '1' => 49
  '2' => 50
  '9' => 57
  ' ' => 32
  
  
  1.4 참(true) 또는 거짓(false)을 담아주는 boolean 타입 -- 크기가 1byte 이다.
  
     
2. 참조형 타입(Reference Type)
   --> 클래스 객체(==object ==instance) 타입   
   --> 메모리상에 저장되어진 객체의 메모리 주소를 참조하는 것이다.
   --> 참조형 타입(Reference Type) 메모리상에 크기는 4byte 를 차지한다.  

     
*/


package my.day04.b.dataType;

import my.day01.Member;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * === 정수형 타입 ===
		 */
		byte bt = 100; // -128 ~ 127
		short st = 30000; // -32768 ~ 32767
		int it = 2000000000; // -2147483648 ~ 2147483647 
		long ln = 5000000000L; // -9223372036854775808 ~  9223372036854775807 ---> 자바에서 정수 기본타입이 int기 때문에 뒤에 L을 작성해준다.
		
		System.out.println("===정수형 타입===");
		System.out.println("bt =>" + bt+
							"\nst =>"+st+
							"\nit =>" +it+
							"\nln =>"+ln);
		
		/*
		 * === 실수형 타입 ===
		 */
		float ft1 = 1.2345f; // 4byte 소수점 이하 7자리까지 표현 가능 (반올림해서 출력됨) 정밀도가 떨어짐
		float ft2 = 1.23445436362342F;
		double db = 1.23445436362342; // 8byte 소수점 이하 15~16자리까지 표현 가능
		//자바에서 실수형의 기본타입은 double
		
		System.out.println("\n === 실수형 ===");
		System.out.println("ft1 =>" +ft1+
							"\nft2 =>" +ft2+
							"\ndb =>" +db);
		
		/*
		 * === 문자형 타입 ===
		 * 자바는 char 타입을 표현할 때 유니코드를 사용한다. 한글표현 가능 중국어도 가능 일본어 ㅗ 도 가능 
		 */
		char ch1 = 'A';
		char ch2 = '\u0041';
		char ch3 = 65;
		char ch4 = '곽';
		char ch5 = '\uACFD';
		
		System.out.println("\n === 문자형 ===");
		System.out.println("ch1 => " + ch1);
		System.out.println("ch2 => " + ch2
							+"\nch3 => " +ch3
							+"\nch4 => " +ch4
							+"\nch5 => " +ch5);
		
		int n = 'A' + 32;
		System.out.println("\nn => " + n);
		
		
		// 참과 거짓을 담아주는 boolean 타입
		boolean bool = true;
		System.out.println(bool);
		
		bool = false;
		System.out.println(bool);
		
		bool = ( (30-10) == 20 );
		System.out.println(bool);
		
		bool = ( (30-10) != 20 );
		System.out.println(bool);
		
		System.out.println("\n======================");
		
		
		/*
		 * 참조형 타입 (Reference Type) 주소를 참조한다.
		 */
		Member mbr1 = new Member();
		Member mbr2 = new Member();
		
		System.out.println(mbr1); // 출력 -> my.day01.Member@15db9742 @다음에 나온건 메모리값에 있는 주소값
		System.out.println(mbr2); // 출력 -> my.day01.Member@6d06d69c 참조형 타입은 메모리상의 크기는 4byte를 차지함
		
		
		/*
		 *   ------- RAM (메모리) --------
		 *  | 	 15db9742 |  6d06d69c	|
		 *  | 	mbr1	  |   mbr2		|	
		 *  | 	id		  |    id		|
		 *  | 	pwd       |	  pwd		|
		 *  | 	name	  |   name		|
		 *  | 	email     |   email		|
		 *   ---------------------------
		 * 
		 */
		 
	}

}

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

package my.day03.a.dataType;

public class Sungjuk {

	// 속성 ( == attribute, property, field )
	
	/*   
	※ === 변수의 명명규칙 ===
    1. 변수명의 길이에는 제한이 없다. 
    2. 대,소문자 구분이 있다.
    3. 첫글자가 숫자는 안된다. 
    4. 특수문자는 '_' 와 '$' 만 사용이 가능하다.
    5. 예약어(예 package, import, public, class, String, int, float ....)는 변수명으로 사용불가하다.  
    6.<권장사항이지 규칙은 아니다> 첫글자는 소문자로 시작하고 단어와 단어가 결합된 경우이라면 두번째 단어는 대문자로 시작하는것이 일반적이다.
 */	
	
 	String hakbun; // 학번 instance 변수
	String name; // 학생명 instance 변수
	
	byte kor, eng, math; // 점수 범위 (0~100) 점수 instance 변수 , int는 byte보다 메모리 낭비가 있기 때문에 숫자 범위가 적으면 byte사용
	
	//행위 메소드 == behavior, method, 기능
	public String test01() {
	// public : 접근제한자  String : 메소드의 리턴타입  test01() : 메소드 이름
		return "test1입니다.";
		
	}
	
	public void test02() {
		//메소드는 반드시 return Type을 적어줘야한다 !!
		System.out.println("test2입니다.\n");
	}
	
	//성적결과
	public void show() {
		// void면 여기 자체 내에서 해결
		System.out.println("\n=== 성적결과 ===");
		System.out.println("1. 학번 :" + hakbun);
		System.out.println("2. 성명 :" + name);
		System.out.println("3. 국어 :" + kor);
		System.out.println("4. 영어 :" + eng);
		System.out.println("5. 수학 :" + math);
		System.out.println("6. 총점 :" + (kor+eng+math));
//		System.out.println("7. 평균 :" + (kor+eng+math)/3); //정수
		System.out.println("7. 평균 :" + (kor+eng+math)/3.0); //실수
	}
	
	
}














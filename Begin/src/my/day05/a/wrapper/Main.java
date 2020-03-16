/*
	=== *** wrapper 클래스 *** ===
	
	------------------------------------------------
	  기본자료형(원시형, primitive)     wrapper 클래스
	------------------------------------------------
	 byte                  			Byte 
	 short                 			Short
	 int                   			Integer  
	 long                  			Long
	 char                  			Character
	 float                 			Float
	 double                			Double
	 boolean               			Boolean 
	 ------------------------------------------------
	 
	  기본자료형(원시형)은 데이터 저장 및 4칙연산 에서만 사용하는 것이고, 
	 wrapper 클래스는  데이터 저장 및 4칙연산 뿐만아니라 
	  아주 다양한 기능의 메소드가 제공되므로 다방면으로 사용되어진다. 
*/

package my.day05.a.wrapper;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		char ch='a';
		System.out.println("ch=>"+ch);
		System.out.println(ch+1); //int 보다 작은 byte, short, char가 숫자를 만나면 int가 된다.
		System.out.println("ch=>"+(char)(ch-32)); // (char)는 강제 형변환
		
		System.out.println("\n==================");
		
		Character chr = new Character('a');
		System.out.println("ch=>"+ch);
		System.out.println(chr+1); //int 보다 작은 byte, short, char가 숫자를 만나면 int가 된다.
		System.out.println("ch=>"+(char)(ch-32)); // (char)는 강제 형변환
		
		System.out.println((char)('b'-32));
		System.out.println(Character.toUpperCase('b')); //B
		
//		System.out.println((int)'b');
		System.out.println('b'+0); //98
		System.out.println(Character.toUpperCase(98)); //66
		
		System.out.println((char)('A'+32)); //a
		System.out.println(Character.toLowerCase('A')); //a
		
		System.out.println('A'+0); //65
		System.out.println(Character.toLowerCase(65)); //65에 해당하는 소문자의 int값으로 바꿔줌. 97

		System.out.println("\n~~~~~~~~~~~~~~~~");
		
		char ch2 = 'c';
		if(Character.isUpperCase(ch2)) { // isUpperCase는 글자 하나씩 비교
			System.out.println(ch2+"는 영문 대문자 입니다.");
		}
		else if(Character.isLowerCase(ch2)) { // isLowerCase는 소문자 입니까?
			System.out.println(ch2+"는 영문 소문자 입니다.");
		}
		else if(Character.isDigit(ch2)) { // isDigit는 숫자입니까?
			System.out.println(ch2+"는 기타문자 입니다.");
		}
		
		
	}

}

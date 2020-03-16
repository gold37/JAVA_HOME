//=== casting 연산자에 대해서 알아본다. ===
/*
 === 데이터형 변환하기 ===
 1. 자동 형변환(묵시적 형변환)
    --> 데이터타입의 크기가 작은 것에서 크기가 큰쪽으로는 자동적으로 형변환이 발생된다. 
 
     byte(1byte) --> short(2byte) --> int(4byte) --> long(8byte)
                 개미                       병아리                      강아지                    사람   
                개미집                    병아리집                   강아지집                   안방
     
     float(4byte) --> double(8byte) 
     --> 정수타입은 실수타입으로 자동형변환이 발생한다.
     
     char(2byte)
     --> char타입은 int형으로 자동형변환이 발생한다.
 
 2. 강제 형변환(casting) ☆★☆★☆★☆★☆★☆★☆★☆★☆★
    --> 데이터타입의 크기가 큰것을 작은것으로 강제적으로 형변환 시키는 것을 말한다.
                 크기가큰타입 = (크기가큰타입)크기가작은타입
                 
                 실수를 정수로 강제적으로 형변환하는 것을 말한다.
                 소수부는 무조건 절삭을 해버리고 정수만 나온다.
                 정수 = (정수)실수         
   
*/

package my.day03.d.casting;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		byte no1 = 100;
		System.out.println("no1." + no1);
		short no2 = 20000;
		System.out.println("no2." + no2);
		short no3 = no1; //byte가 short에 들어갈 수 있다. --> short 타입으로 형변환
		System.out.println("no3." + no3);
		
		System.out.println("\n ~~~~~~ 강제 형변환 ~~~~~~~");
		int no4 = 300;
		short no5 = (short)no4; //no4를 강제로 short로 형변환. 이때 () 괄호를 casting 연산자라고 한다.
		System.out.println("no5." + no5);
		
		int no6 = 5000000;
		short no7 = (short) no6;
		System.out.println("no7." + no7); //엉뚱한 값이 나옴. short범위를 벗어난건 안돼용
		
		float ft1 = 1.234567f;
		double db1 = ft1;
		System.out.println("db1." + db1); //소수점 아래 16까지 나옴 쭈르르륵 
		
		double db2 = 1.2345676743742378432;
		float ft2 = (float) db2; // double을 float으로 강제 형변환.
		System.out.println("ft2." + ft2); //소수점 아래 7자리까지 나옴 
		
		float ft3 = 1.234567F; // float 4byte
		long ln = (long) ft3; // long 8byte float가 long보다 커서 안들어가니까 강제 형변환해야됨
		System.out.println("ln." + ln);
		
	}

}

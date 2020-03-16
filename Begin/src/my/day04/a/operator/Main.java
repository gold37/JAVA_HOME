package my.day04.a.operator;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 * === 연산자 ===
		 * 
		 * 1. 산술연산자 + - * / % (나머지)
		 * 
		 */
		
		int n=10;
		System.out.println("n+3=" + (n+3));
		System.out.println("n-3="+(n-3));
		System.out.println("n*3="+(n*3));
		System.out.println("n/3="+(n/3)); // 출력 값 3
		System.out.println("(double)n/3="+((double)n/3)); // 출력 값 3.333
		System.out.println("n%3="+(n%3)); //10/3의 나머지=1
		
		//2. 증감연산자 ++ -- 
		int a = 7;
		int b = 3;
				
		//↓후위증감연산자
		a++; // a++; 은 a=a+1;와 같다. 즉 a=7+1; 이다.
		System.out.println("a="+a); // a=8
		
		b--; // b--; 은 b=b-1;와 같다. 즉, b=3-1;이다.
		System.out.println("b="+b); //b=2
		//↓전위증감연산자
		++a; // ++a; 은 a=a+1;와 같다. 즉, a=8+1;이다.
		System.out.println("a="+a); //a=9
		
		--b; // --b; 은 b=b-1;와 같다. 즉, b=2-1;
		System.out.println("b="+b);
		
		/* ☆★☆★암기☆★☆★
		 * 후위 연산자(a++; b--;)은 다른 연산을 다 마친 후에 1씩 증감
		 * 전위 연산자 (++a; --b;)은 맨 먼저 1씩 증감을 마친 후 다른 연산을 함
		 */
		
		int x=10, y=10;
		int z=++x;
		System.out.println("z=> "+z); //z=11
		System.out.println("x=> "+x); //x=11
		
		z=y++; //z에 y를 먼저 대입
		System.out.println("z=> "+z); //z=10
		System.out.println("y=> "+y); //y=11
		
		/* 3. 논리 연산자 & | && ||
		 * 수학에서 AND
		 * T∧T∧F --> F
		 * T∧T∧T --> T
		 * 
		 * 수학에서 OR
		 * T∨T∨F --> T
		 * T∨T∨T --> T
		 * F∨F∨F --> F 
		 * 
		 */
		int c=50, d=50, e=70;
		boolean bool = (c>d) && (d<e) && (c==e);
		//				 F        T         F     = F
		// && 2개짜리는 F 하나만 나오면 무조건 F. 뒤에 스킵해도 됨
		System.out.println("bool => " + bool);
		
		bool = (c>d) || (d<e) || (c==e);
		// 		 F		  T			F    = T
		System.out.println("bool => " + bool);
			
		System.out.println("\n -----------------");
		bool = (c>d) & (d<e) & (c==e);
		//		 F		 T		  F    = F
		// & 1개 짜리는 F 하나 나와도 뒤에 다 계산함. so 속도 떨어짐 
		System.out.println("bool => " + bool);
		
		bool = (c>d) | (d<e) | (c==e);
		//		 F		 T		  F    = T
		System.out.println("bool => " + bool);
		
		/*
		 * if (조건) {
		 * 		실행명령;
		 * }
		 * 	----> 이 조건이 참 일때만 실행명령;을 구동한다.
		 * 				 거짓이라면 실행명령; 안함
		 *  
		 */
		int n1=10;
		
		if(n1<20) {
			// T 
			System.out.println(">> n1은 20보다 작습니다.");
		}
		
		
		//Quize1. 
		System.out.println("\n퀴즈으으으으으으 1번 >3<");
		int i=1;
		int j=i++; //j=1 i=2
		
		if( (i>++j) & (i++ == j) ) { //2>2 (F) & 2==2(T) = F j=2, i=3
			i=i+j;
		}
		// 연산자 & 하나뿐이라서 뒤에까지 연산을 해야됨 !!
		System.out.println("i="+i);
		
		i=1;
		j=i++; // i=2, j=1
		
		if((i>++j) && (i++ == j)) {
		//  i=2, j=3 F
			i=i+j;
		}
		// 연산자 &가 두개라서 &&니까 if안에 연산 안함
		System.out.println("i="+ i);
		
		System.out.println("\\n퀴즈으으으으으으 2번 >3<");
		int m1=0;
	    n1=1;  
		if((m1++ == 0) | (n1++ == 2)) {
		// 0==0 T m=1     F  n=2
			m1=42;
		}
		System.out.println("m1=>"+m1
				+", n1=>"+n1); //m1=42, n1=2
		
		m1=0;
		n1=1;
		if((m1++ == 0) || (n1++ == 2)) {
		// m=1
			m1=42;
		}
		System.out.println("m1=>"+m1
				+", n1=>"+n1);
		
		/*
		 *  4. 비교연산자 
		 *  == != > < >= <=
		 *  
		 *  5. 할당연산자 (연산 후 대입 연산자)
		 */
		System.out.println("\n");

		int no = 1;
		no+=3; // no=no+3;와 같은 말
		System.out.println("no="+no); // no=4
		
		no-=2;
		System.out.println("no="+no);// no=2
		
		no*=5;
		System.out.println("no="+no); // no=10
		
		no/=4; // no=no/4;와 같은 말
		System.out.println("no="+no); //no=2
		
		no%=3; // no를 3으로 나눈 후 나머지
		System.out.println("no="+no); // no=2
		
		// 6. 삼항연산자
		/*
		 *  변수선언 = (조건식)? 값1:값2
		 *  변수를 선언하고 나서 값을 부여하고자 할 때 사용되어지는데
		 *  조건식이 참 이라면 변수에 값1을 대입해주고,
		 *  조건식이 거짓이라면 변수에 값2를 대입해준다.
		 *   
		 */
		int num1=50, num2=60;
		int num3=(num1 > num2)?num1:num2;
		System.out.println("num3=>"+num3);
		
		
		
	}
}





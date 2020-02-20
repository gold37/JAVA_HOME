package my.day03.a.dataType;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n1 = 12345;
		int n2 = 02342;
		String str1 = "12347";
		String str2 = "01234";
		
		System.out.println("n1:" + n1);
		System.out.println("n2:" + n2);
		System.out.println("str1:" + str1);
		System.out.println("str2:" + str2);
		
		System.out.println("\n =========================================\n");
		
		//학생들의 성적처리
		Sungjuk kjwSj = new Sungjuk();
		kjwSj.hakbun = "200220";
		kjwSj.name = "곽지원";
		kjwSj.kor = 95;
		kjwSj.eng = 100;
		kjwSj.math = 90;
		
		Sungjuk hgdSj = new Sungjuk();
		hgdSj.hakbun = "110211";
		hgdSj.name = "홍길동";
		hgdSj.kor = 50;
		hgdSj.eng = 70;
		hgdSj.math = 85;
		
		
		String result = kjwSj.test01();
		System.out.println(result);
		
		hgdSj.test02();
		
		System.out.println("263/3="+(263/3));
		System.out.println("263/3.0="+(263/3.0));
		System.out.println("263.0/3.0="+(263.0/3.0));
		
		/*
		  === 성적결과 ===
		  1. 학번 : 2020220
		  2. 성명 : 곽지원
		  3. 국어 : 
		  4. 영어 :
		  5. 수학 :
		  6. 총점 :
		  7. 평균 :
		 */
		
		kjwSj.show();
		hgdSj.show();
		
		
	}

}

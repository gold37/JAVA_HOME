package my.day05.d.sungjuk;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
//
//		System.out.println("안녕"+"  하 세 요?       "+"내일봬요~!");
//		System.out.println("안녕"+"  하 세 요?       ".trim()+"내일봬요~!"); //.trim()은 해당 문자열 앞뒤 공백제거
//		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("학생명:"); // 유효성 검사가 필요하다.
		String name = sc.nextLine().trim(); //공백을 없앤 값을 name에 넣어줌
		
		if(name.length()==0) { //아무것도 입력하지않고 엔터쳤을 시
			
			System.out.println(">>학생명을 입력하세요!!!!!!");
			sc.close();
			return;
		}
		
		int kor=0, eng=0, math=0; // 지역변수는 반드시 초기화
		
		try {
			System.out.print("국어점수:");
			String strKor = sc.nextLine();
			kor = Integer.parseInt(strKor);
			
			if(kor < 0 || kor > 100) {
				System.out.println(">>점수는 0이상 100이하이어야 합니다.");
				sc.close(); //적어줘야 메모리 누수가 없음
				return; //해당 메소드(지금은 Main메소드) 종료
			}
			
			System.out.print("영어점수:");
			String strEng = sc.nextLine();
			eng = Integer.parseInt(strEng);
			
			if(eng < 0 || eng > 100) {
				System.out.println(">>점수는 0이상 100이하이어야 합니다.");
				sc.close();
				return;
			}
			
			System.out.print("수학점수:");
			String strMath = sc.nextLine();
			math = Integer.parseInt(strMath);
			
			if(math < 0 || math > 100) {
				System.out.println(">>점수는 0이상 100이하이어야 합니다.");
				sc.close();
				return;
			}
			
		}catch(NumberFormatException e) {
			System.out.println(">>정수만 입력하세요!!");
			sc.close();
			return;
		}
		
		Sungjuk sj = new Sungjuk(name, kor, eng, math); //지역변수는 반드시 초기화해줘야한다.
		
		sj.showInfo();
		/*
		 * ==곽지원 성적결과==
		 * 1. 학생명 : 곽지원
		 * 2. 국어 : 100
		 * 3. 영어 : 90
		 * 4. 수학 : 85
		 * 5. 총점: 275
		 * 6. 평균: 91.7
		 * 7. 학점: A
		 */
		
		
		sc.close();
	}

}

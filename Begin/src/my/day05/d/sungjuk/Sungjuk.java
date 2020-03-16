package my.day05.d.sungjuk;

public class Sungjuk {
	//field, attribute, property, 속성
	
	String name;
	int kor, eng, math;
	
	//파라미터가 있는 생성자 생성하기
	public Sungjuk(String name, int kor, int eng, int math) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	// behavior, method, 행위, 기능
	int getTotal(){ //총점을 알려주는 메소드
		return kor+eng+math;
	}
	// 소수부 첫 째 자리까지 반올림 한 평균을 알려주는 메소드 getAvg()
	double getAvg() {
		return Math.round((double)getTotal()/3*10)/10.0;
		//		91.4789
		//		91.5
	}
	
	char getGrade1() {
		
		double avg = getAvg(); // 반올림 된 평균치를 불러옴
		
		char grade = ' ';
		
		if(avg >= 90) { // avg가 90이상이라면
			grade = 'A'; // grade에 'A'를 대입해주고 끝낸다.
		}
		else if(avg >= 80) { // avg가 90이상이 아니고 80이상이라면
			grade = 'B'; // grade에 'B'를 대입해주고 끝낸다.
		}
		else if(avg >=70) {
			grade = 'C';
		}
		else if(avg >= 60) {
			grade = 'D';
		}
		else {
			grade = 'F';
		}
		
		return grade;
	} // end of char getGrade1() -------------------(한 메소드의 코드가 길 때 써주기)
	
	char getGrade2() {
		
		char grade = ' ';
		double avg = getAvg(); //91.7
		
		switch ((int)avg/10) { //switch(어떤 값이나 어떤 변수)
		//avg를 int로 강제 형 변환 후 10으로 나눈다.
					 		//==> 어떤 값이나 어떤 변수에 들어올 수 있는 타입은
					 		//byte, short, int, char, String만 가능하다
					 		//long, float, double은 입력 불가
		//(int)avg
		//(int)91.7 ===> 91
		//(int)avg == 90,91,92,93,94,95,96,97,98,99 /공통점: 앞자리가 다 9이다.
		//(int)avg/10 ==> 9, 9, 9
		
		case 10:
		case 9: // (int)avg/10이 10 또는 9와 같다면 
			grade='A'; // grade에 'A'를 대입해주고 
			break;//스위치문을 빠져나간다.

		case 8: // (int)avg/10이 8과 같다면
			grade='B'; // grade에 'B'를 대입해주고 switch case문을 빠져나간다.
			break;
			
		case 7:
			grade='C';
			
		case 6:
			grade='D';
			break;
			
		default: //전부 다 같지 않을 때
			grade='F';
			break;
		} 
		
		return grade;
	} // end of char getGrade2() --------------------
	
	String getGift() {
		
		String gift = "";

		char grade = getGrade1();
		
		switch (grade) { // 'A', 'B', 'C', 'D', 'F'
			case 'A':
				gift += "놀이공원 이용권,"; //break를 안 만났기 때문에 밑에 case 다 실행
			case 'B':
				gift += "치킨 한 마리,";
			case 'C':
				gift += "피자 한 판,";
			case 'D':
				gift += "배스킨라빈스 ";
				break;
			default:
				gift += "꿀밤 3개";
				break;
		}
		
		return gift;
	} // end of String getGift() --------------------
	
	
	void showInfo() {

		System.out.println("\n==="+name+" 성적결과===\n");
		System.out.println("1. 학생명:"+name);
		System.out.println("2. 국어:" +kor);
		System.out.println("3. 영어:"+eng);
		System.out.println("4. 수학:"+math);
		System.out.println("5. 총점:"+getTotal());
		System.out.println("6. 평균:"+getAvg());
		System.out.println("7. 학점(if):"+getGrade1());
		System.out.println("8. 학점(switch):"+getGrade2());
		System.out.println("9. 선물(switch):"+getGift());
		
	}
	
	
	
}

package my.day04.d.Member;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		
		Member mbr = new Member();
		
		System.out.print("1.ID: ");
		//키보드로 아이디 값을 얻어옴
		mbr.userid = sc.nextLine(); //입력받은 아이디를 mbr 인스턴스에 넣음
		
		System.out.print("2.PASSWORD: ");
		mbr.pwd = sc.nextLine();
		
		System.out.print("3.NAME: ");
		mbr.name = sc.nextLine();
		
		try {
		System.out.print("4.AGE: ");
		//mbr.age = Integer.parseInt(sc.nextLine()); // 문자열 -> 정수로 바꾸는 방법 
		//나이를 1보다 작게 입력 못하게
		int age = Integer.parseInt(sc.nextLine());
		
		if(age<1) {
			System.out.println("나이는 0 또는 음수는 불가합니다.");
			sc.close();
			return; // 나이를 맞지 않게 작성했을 때 회원정보 안나오고 거기서 멈추게 함. 해당 메소드(지금은 main메소드)를 종료한다는 뜻
		}
		else { //if 조건을 제외한 나머지 
			mbr.age = age;
		}
		
		} catch (NumberFormatException e) {
			System.out.println(">>나이는 정수만 입력이 가능합니다.");
		}
	
		mbr.showInfo();
		
	}

}

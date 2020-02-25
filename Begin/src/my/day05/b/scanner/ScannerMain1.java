package my.day05.b.scanner;

import java.util.Scanner;

public class ScannerMain1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		System.out.print("글자 한 개만 입력하세요=>");
		
		String inputStr = sc.nextLine(); //korea seoul
										 //012345678910
		
		//inputStr.charAt(index)//글자 한 개의 위치값 읽어옴 
		
		//System.out.println(inputStr.length());
		//inputStr.length()은 여기에 들어있는 글자 수를 알려주는 것
		
		if(inputStr.length() != 1) {
			System.out.println(">>글자수가 1이 아니므로 종료합니다.");
		}
		else {
			String result = "";
			char ch = inputStr.charAt(0);
			
			
			if(Character.isUpperCase(ch)) { //ch가 대문자 일경우
				result = "영문 대문자";
			}else if(Character.isLowerCase(ch)) { // ch가 소문자라면
				result = "영문 소문자";
			}else if(Character.isDigit(ch)) { // ch가 숫자라면
				result = "숫자";
			}
		else {
			result = "기타문자";
		}
		System.out.println("입력하신 "+ch+"은(는)"+result+"입니다.");
		sc.close();
	}
	}
}

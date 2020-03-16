package my.day03.c.constructor;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Member jiwonMbr = new Member();
		jiwonMbr.userid = "jiwon";
		jiwonMbr.passwd = "*****";
		jiwonMbr.name = "곽지원";
		jiwonMbr.age = 24;
		jiwonMbr.point = 10000000;
		
		Member gildongMbr = new Member();
		
		jiwonMbr.showInfo();
		gildongMbr.showInfo();
		
		Member eomMbr = new Member("eom", "1234**", "엄정화", 23, 300); //인스턴스변수에 값을 넣어줌 
		eomMbr.showInfo();
		
		
		// Quize1 엄정화의 이름, 비밀번호, 포인터를 바꿔보자 
		eomMbr.changeInfo("정화엄", "abcd0070", 500);
		eomMbr.showInfo();
		
		
		// Quize2 지원이 정보 get으로 받아오기 
		System.out.println("\n -----------------------");
		String info = jiwonMbr.getMemberInfo(); //파라미터가 없는 인스턴스 메소드. static메소드는 .메소드 안함 리턴타입은 String타입.
		System.out.println(info);
		
		// Quize3 지원이 비밀번호 바꾸기 
		System.out.println("\n ~~~~~~~~~~~~~~~~~~~~~~~\n");
		String result = jiwonMbr.changePasswd("newPassword"); //'newPassword'라는 파라미터가 있고, String리턴타입이 있는 인스턴스 메소드
		System.out.println(result);
		//"곽지원님의 암호가 "*****"에서 "newPassword"로 바꼈습니다.
		jiwonMbr.showInfo();
		
	}

}

package my.day04.d.Member;

public class Member {

	// 속성 attribute, field, property
	
	String userid; 
	String pwd;
	String name;
	int age;
	
	public void showInfo() {
		System.out.println("\n==="+name+"님의 회원정보 ===");
		System.out.println("1.ID: "+ userid);
		System.out.println("2.PW: " + pwd);
		System.out.println("3.NAME: " + name);
		System.out.println("4.AGE: " + age);
	}
	
}

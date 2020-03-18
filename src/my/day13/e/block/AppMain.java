package my.day13.e.block;

public class AppMain extends Parent {
	public static void main(String[] args) {

		Child cd = new Child();
		System.out.println("cd.name => "+cd.name);

		System.out.println("\n-------------------------------------------------\n");
		
		Child cd2 = new Child();
		cd2.name = "김수현";
		System.out.println("cd.name => "+cd2.name);
		
	}
}

/*
			==== 실행 결과 ====
			>>> Parent 클래스의 기본생성자 호출됨
			>>> Child 클래스의 기본생성자 호출됨
			cd.name => 서강준
*/
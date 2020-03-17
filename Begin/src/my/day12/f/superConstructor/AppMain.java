package my.day12.f.superConstructor;

public class AppMain {
	public static void main(String[] args) {
	
		Child cd = new Child(); // 자식 클래스의 기본생성자가 호출
								// 이것은 Child의 부모클래스인 Parent 클래스의 기본생성자가 먼저 호출되어지고나서 자식 클래스의 기본생성자가 호출되어진다.
		cd.childInfo();
	}
}

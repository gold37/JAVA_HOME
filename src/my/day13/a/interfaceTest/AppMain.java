package my.day13.a.interfaceTest;

public class AppMain {

	public static void main(String[] args) {

		Rectangle rt = new Rectangle();
		Triangle tri = new Triangle();
		
		System.out.println("가로가 5, 세로가 2인 사각형의 넓이 : " + (int)rt.area(5, 2));
		System.out.println("밑변이 4, 높이가 5인 삼각형의 넓이: " + (int)tri.area(4, 5));

		System.out.println("\n--------------------------------------------\n");
		
		Figure rt2 = new Rectangle(); // rt2의 실제 정체성은 Rectangle
		Figure tri2 = new Triangle();
		Figure cir = new Circle();
		
		System.out.println("가로가 5, 세로가 2인 사각형의 넓이 : " + (int)rt2.area(5, 2));
		System.out.println("밑변이 4, 높이가 5인 삼각형의 넓이: " + (int)tri2.area(4, 5));
		System.out.println("반지름이 10인 원의 넓이: " + cir.circleArea(10));
		
	}

}

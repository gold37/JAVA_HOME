package my.day13.a.interfaceTest;

public class Rectangle implements Figure {

	@Override
	public double area(double width, double height) {
					 // ▲ 지역변수
		
		return width*height;// 가로*세로
	}

	@Override
	public double circleArea(double r) { // 구현 안하고 껍데기만 생성
		return 0;
	}

	
	
}

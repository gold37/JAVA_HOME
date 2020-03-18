package my.day13.a.interfaceTest;

public class Triangle implements Figure {

	@Override
	public double area(double bottom, double top) {
		
		return bottom*top*0.5; // 밑변*높이/0.5
	}

	@Override
	public double circleArea(double r) { // 안쓰지만 형식을 맞춰줌
		return 0;
	}

}

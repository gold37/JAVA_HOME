package my.day13.a.interfaceTest;

public interface Figure {

	// === 인터페이스(interface)란? === //
	/*
	  	오로지 미완성 메소드(추상 메소드)와 field는 final변수로만 이루어진 것을 말한다
	  	그리고 미완성 메소드(추상 메소드)와 field의 접근 제한자는 public으로만 되어진다.
	  	미완성 메소드(추상 메소드) 생성시 public abstract가 생략되어져 있다.
	  	field 생성시 public final이 생략되어져 있다.
	  	
	 */
	
	// public abstract String viewInfo(String str); // 앞에 public abstract 생략 가능
	
	public final double PI = 3.141592; // public 말고 protected 등등 이런걸로 못함
	
	double area(double a, double b);
	double circleArea(double r);
	
}

package jdbc.day04.singletonExam;

public class Main {

	public void a_method() {
		NosingletonNumber aObj = new NosingletonNumber(); // 객체 생성
		System.out.println("a_method() 메소드에서 cnt값 호출: "+ aObj.getNextNumber());
	}
	
	public void b_method() {
		NosingletonNumber bObj = new NosingletonNumber(); // 객체 생성
		System.out.println("b_method() 메소드에서 cnt값 호출: "+ bObj.getNextNumber());
	}

	public void c_method() {
		NosingletonNumber cObj = new NosingletonNumber(); // 객체 생성
		System.out.println("c_method() 메소드에서 cnt값 호출: "+ cObj.getNextNumber());
	}
	
	////////////////////// 싱글톤 패턴 /////////////////////
	public void d_method() {
		// SingletonNumber dObj = new SingletonNumber();
		//  							▲ 접근제한자 private로 막아놔서 외부에서 인스턴스 생성이 불가능하기 때문에 객체 생성이 불가능함
		SingletonNumber dObj = SingletonNumber.getInstance(); // SingletonNumber에 있는 static 메소드 호출 
		System.out.println("d_method() 메소드에서 cnt값 호출: "+ dObj.getNextNumber());
	}

	public void e_method() {
		SingletonNumber eObj = SingletonNumber.getInstance(); // 또 새로 만드는게 아니고 이미 만들어진걸 줌 
		System.out.println("e_method() 메소드에서 cnt값 호출: "+ eObj.getNextNumber());
	}
	
	public void f_method() {
		SingletonNumber fObj = SingletonNumber.getInstance(); // d, e, f 모두 같은 인스턴스임 
		System.out.println("f_method() 메소드에서 cnt값 호출: "+ fObj.getNextNumber());
	}
	
	
	
	public static void main(String[] args) {

		Main ma = new Main();
		
		ma.a_method();
		// a_method() 메소드에서 cnt값 호출 : 1
		
		ma.b_method();
		// b_method() 메소드에서 cnt값 호출 : 1

		ma.c_method();
		// c_method() 메소드에서 cnt값 호출 : 1
		
		ma.d_method();
		// d_method() 메소드에서 cnt값 호출 : 1
		
		ma.e_method();
		// e_method() 메소드에서 cnt값 호출 : 2
		
		ma.f_method();
		// f_method() 메소드에서 cnt값 호출 : 3
		
		
	} // end of main() ---------------

}

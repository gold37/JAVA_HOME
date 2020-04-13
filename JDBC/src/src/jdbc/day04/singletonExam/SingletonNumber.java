package jdbc.day04.singletonExam;

public class SingletonNumber {
	
	/*
    !!! === singleton 패턴에서 중요한 것은 다음의 3가지 이다 === !!!
    
     	== ①
        private 변수로 자기 자신의 클래스 인스턴스를 가지도록 해야 한다. 
                접근제한자가 private 이므로 외부 클래스에서는 직접적으로 접근이 불가하다. 
                또한 static 변수로 지정하여  SingletonNumber 클래스를 사용할때 
                객체생성은 딱 1번만 생성되도록 해야 한다.         
	 */ 
	
	// --> 1번째로 호출(작동) 되는 것  : static 변수
	static SingletonNumber singleton = null;
	
	// 한번연결되면 계속 쓰려고 싱글톤 패턴 사용함
	// --> 4번째로 호출(작동) : 인스턴스 변수 
	private int cnt = 0; // 인스턴스 변수
	
	// --> 2번째로 호출(작동) 되는 것 : static 초기화 블럭
	static {
		
		/*
		 	static 초기화 블럭에는 인스턴스 생성과 관계없이 실행되는 곳으로 
		 	인스턴스 변수는 절대로 사용할 수 없는 곳이다. (인스턴스 변수는 인스턴스가 생성돼야 쓸 수 있기때문에)
		 	 
		 */
		// cnt = 1; // 오류 . 인스턴스 변수기때문에
		
		// ☆★☆★ 또한 중요한 사실은 static 초기화 블럭은 
		// 해당 클래스가 객체로 생성되기전에 먼저 실행되며,
		// 딱 1번만 호출되고 그 다음 새로운 객체(인스턴스)를 매번 생성하더라도 
		// static 초기화 블럭은 호출이 안된다.
		
		 singleton = new SingletonNumber(); // 이 작업 딱 한번만 가능
		 System.out.println(">>> SingletonNumber 클래스의 static 초기화 블럭 호출 ");
	}
	
	// 	  == ②
	//    생성자에 접근제한자로 private 을 지정하여, 외부에서 절대로 인스턴스를 생성하지 못하도록 막아버린다.
	private SingletonNumber() {} // --> 5번째로 호출(작동) : 생성자 
	
	// 	  == ③	
	//    static 메소드를 생성(지금은 getInstance() )하여 외부에서 해당 클래스의 객체를 사용할 수 있도록 해준다.
	public static SingletonNumber getInstance() { // --> 3번째로 호출(작동) : static 메소드
		return singleton;
	}
	
	
	///////////////////////////////////////////////////////////////////////////////
	
	public int getNextNumber() { // 인스턴스 메소드   // --> 6번째로 호출(작동) : 인스턴스 메소드
		return ++cnt; // 인스턴스 변수
	}
	
	
}

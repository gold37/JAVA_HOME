package my.day13.g.userDefineException;

// == 사용자가 정의하는 예외(Exception)절 만들기
/*
  	1. Exception 클래스를 상속 받는다.
  	2. 노란줄에 마우스 갖다대고 default 클릭
  	3. 생성자를 구성해서 예외 메세지(오류 메세지)를 등록하면 끝 ~!
 */

public class stockLackException extends Exception {

	private static final long serialVersionUID = 1L;

	// 기본생성자
	public stockLackException() {
		super(">>> 잔고량이 주문량보다 적으므로 주문이 불가합니다 <<<\n"); // 부모 => Exception
	}
	
	// 파라미터가 있는 생성자
	public stockLackException(String errMsg) {
		super(errMsg+"\n");
	}
	
	
	
}

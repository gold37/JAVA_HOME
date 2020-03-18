package my.day13.g.userDefineException;

public class Product {

	String prodName; // 제품명
	int stock; // 재고량
	
	// 제품의 정보를 보여주는 메소드 생성
	void info() {
		String info = "1.제품명: " + prodName + "\n"
					+ "2.잔고량: " + stock + "\n";
		
		System.out.println(info);
					
	}
	
	// 주문을 받는 메소드 생성1
	void order(int jumun) throws stockLackException{ // 잔고가 부족할때 발생시킬 사용자 정의 익셉션
		if(stock<jumun) { // 잔고량이 주문량보다 부족할시 
			throw new stockLackException(); // stockLackException 익셉션을 발생시킴 
		}else {
			stock -= jumun; // 잔고량 = 잔고량 - 주문량
			System.out.println(prodName+" 제품을 "+jumun+"개 주문하셨습니다.");
			info();
		}
	}
	
	// 주문을 받는 메소드 생성2
		void order2(int jumun) throws stockLackException{ // 잔고가 부족할때 발생시킬 사용자 정의 익셉션
			if(stock<jumun) { // 잔고량이 주문량보다 부족할시 
				throw new stockLackException(">>> 잔고량("+stock+"개)이 주문량("+jumun+"개)보다 적으므로 주문이 불가합니다 <<<"); // stockLackException 익셉션을 발생시킴 
			}else {
				stock -= jumun; // 잔고량 = 잔고량 - 주문량
				System.out.println(prodName+" 제품을 "+jumun+"개 주문하셨습니다.");
				info();
			}
		}
}

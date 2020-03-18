package my.day13.g.userDefineException;

public class AppMain {
	public static void main(String[] args) {
	
		Product swk = new Product();
		swk.prodName = "새우깡";
		swk.stock = 500;
		
		Product ypr = new Product();
		ypr.prodName = "양파링";
		ypr.stock = 100;
		
		try {
			swk.order(20); // 20개 주문 잔고량 480개
			swk.order(500); // 잔고량(480개) 보다 많은 500개 주문
		} catch (stockLackException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			// >>> 잔고량이 주문량보다 적으므로 주문이 불가합니다 <<<
			
			// >>> 잔고량(30개)이 주문량(500개)보다 적으므로 주문이 불가합니다 <<<
		}
		
		
		System.out.println("\n-----------------------------------------\n");
		
		try {
			ypr.order2(20); // 20개 주문 잔고량 80개
			ypr.order2(100); // 잔고량(80개) 보다 많은 100개 주문
		} catch (stockLackException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			// >>> 잔고량이 주문량보다 적으므로 주문이 불가합니다 <<<
			
			// >>> 잔고량(30개)이 주문량(500개)보다 적으므로 주문이 불가합니다 <<<
		}
		
		
	}
}

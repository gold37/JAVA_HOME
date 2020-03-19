package my.day14.a.collection;

public class Product { // 모든 클래스의 부모는 Object. extends Object가 생략되어져 있음

	String prodID;
	String prodName;
	int price;
	
	public Product() {}
	
	public Product(String prodID, String prodName, int price) {
		super(); // --> object 를 말함. 안써도 돌아감
		this.prodID = prodID;
		this.prodName = prodName;
		this.price = price;
	}	
	
	public void prodInfo() {
		System.out.println("=== 제품정보 ===\n"
						 + "1.제품 아이디: "+prodID+"\n"
						 + "2.제품명: "+prodName+"\n"
						 + "3.단가: "+price+"\n");
	}
	
}

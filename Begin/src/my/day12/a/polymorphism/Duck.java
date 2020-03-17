package my.day12.a.polymorphism;

// 다형성(Polymorphism) : 상속을 이용하여 여러 크래스 타입을 하나의 클래스 타입으로 다루는 기술
public class Duck extends Animal {

	// field, attribute, property, 속성 (추상화)
	private int price;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		if(price>0) {
			this.price = price;
		}
	}
	
	// behavior, method, 기능 (추상화)
	public void printDuck() {
		StringBuilder sb = new StringBuilder();
		sb.append("1.오리 명: "+this.getName()+"\n");
		sb.append("2.나이: "+this.ageInfo()+"살\n");
		sb.append("3.가격: "+price+"원\n");
		
		System.out.println(sb.toString());
	}

	// *** 메소드의 오버라이딩(==재정의) *** // 
	// 접근제한자는 부모클래스 메소드의 접근제한자와 같던지 또는 그 범위가 커야한다. private이 가장 작음 -> default -> protected -> public
	// 부모클래스 메소드의 이름과 파라미터의 형태가 같아야한다.
	@Override
	public void printAnimal() {
		StringBuilder sb = new StringBuilder();
		sb.append("1.오리 명: "+this.getName()+"\n");
		sb.append("2.나이: "+this.ageInfo()+"살\n");
		sb.append("3.가격: "+price+"원\n");
		
		System.out.println(sb.toString());
	}
}

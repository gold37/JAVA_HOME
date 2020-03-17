package my.day12.a.polymorphism;

// 다형성(Polymorphism) : 상속을 이용하여 여러 크래스 타입을 하나의 클래스 타입으로 다루는 기술
public class Dog extends Animal {

	// field, attribute, property, 속성 (추상화)
	private int weight; // 강아지만 쓸거야                
	
	
	// behavior, method, 기능 (추상화)
	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		if(weight>0) {
			this.weight = weight;
		}
		this.weight = weight;
	}
	
	public void printDog() {
		/*
		 * 1
		String info = "가"+"나"+"다"+"라";
		System.out.println(info);
		
		
		 * 2
		String info2 ="";
		info2 += "가";
		info2 += "나";
		info2 += "다";
		info2 += "라";

		System.out.println(info2);
		
		---> 2처럼  쓰는건 메모리 용량 상 좋지 않음 1 처럼 쓸 것!
			  근데 1+2를 해야하는 경우는 아래처럼하면 됨
		*/
		
		StringBuffer sb = new StringBuffer();
		sb.append("1.강아지 명: "+super.getName()+"\n"); // 부모 클래스에 private로 돼있는 name받아오기. 가독성 좋게 this.보다는 super.으로 ~
		sb.append("2.나이: "+super.ageInfo()+"살\n");
		sb.append("3.몸무게: "+weight+"kg\n");

		/*
		String info = sb.toString(); // 위의 append되어진 정보를 차곡차곡 쌓아서 String 타입으로 바꿔줌 
		System.out.println(sb); // 화면에 나오는게 아니라 객체 정보가 나옴
		*/
		System.out.println(sb.toString());
		
	}
	
	// *** 메소드의 오버라이딩(==재정의) *** // 
	// 접근제한자는 부모클래스 메소드의 접근제한자와 같던지 또는 그 범위가 커야한다. private이 가장 작음 -> default -> protected -> public
	// 부모클래스 메소드의 이름과 파라미터의 형태가 같아야한다.
	@Override // 부모클래스로부터 상속받은 메소드의 재정의 ☆★☆★☆★
	public void printAnimal() {
		StringBuffer sb = new StringBuffer();
		sb.append("1.강아지 명: "+super.getName()+"\n"); 
		sb.append("2.나이: "+super.ageInfo()+"살\n");
		sb.append("3.몸무게: "+weight+"kg\n");

		System.out.println(sb.toString());
	}

}

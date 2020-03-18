package my.day12.b.abstractclass;

// 다형성(Polymorphism) : 상속을 이용하여 여러 크래스 타입을 하나의 클래스 타입으로 다루는 기술
public class Cat extends Animal {
	// field, attribute, property, 속성 (추상화)
	private String color ;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		if(color!=null && !color.trim().isEmpty()){
			this.color = color;
		}
	}
	
	// behavior, method, 기능 (추상화)
	public void printCat() {
		StringBuilder sb = new StringBuilder();
		sb.append("1.고양이 이름: "+this.getName()+"\n");
		sb.append("2.나이: "+this.ageInfo()+"살\n");
		sb.append("3.피부색: "+color+"색\n");
		
		System.out.println(sb.toString());
	}
	
	// *** 메소드의 오버라이딩(==재정의) *** // 
	// 접근제한자는 부모클래스 메소드의 접근제한자와 같던지 또는 그 범위가 커야한다. private이 가장 작음 -> default -> protected -> public
	// 부모클래스 메소드의 이름과 파라미터의 형태가 같아야한다.
	@Override // Source -> Override/Implement Methods 클릭하면 자동생성됨
	public void printAnimal() {
		StringBuilder sb = new StringBuilder();
		sb.append("1.고양이 이름: "+this.getName()+"\n");
		sb.append("2.나이: "+this.ageInfo()+"살\n");
		sb.append("3.피부색: "+color+"색\n");
		
		System.out.println(sb.toString());
	}
	
	
}

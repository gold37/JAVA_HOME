package my.day12.b.abstractclass;

import java.util.Calendar;

//public abstract class Animal { //(아래랑 같은 말)
abstract public class Animal { // 미완성 클래스 (== 추상클래스)

	// 미완성 메소드(== 추상 메소드)가 있는 클래스는 반드시 미완성 클래스(== 추상 클래스)로 정의를 해줘야한다.
	// 일반적으로 부모 클래스를 미완성클래스(== 추상 클래스)로 만든다. 
	// 왜???? 
	// 자식클래스에서 메소드를 오버라이딩(==재정의)를 하기 때문에 부모클래스에서 메소드를 정의할 필요가 없기 때문!
	
	// field, attribute, property, 속성 (추상화)
	private String name;
	private int birthYear;
	
	public String getName() { // private를 public으로 열어주겠다 ---> getter(읽기), setter
		return name;
	}
	public void setName(String name) {
		
		if(name!=null && !name.trim().isEmpty()) { // 일단 null이 아니고 name이 텅 비어있지 않다면 
			this.name = name; // 값을 넣어주겠다
		}
		
	}
	public int getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(int birthYear) {
		if(birthYear>0) { // 0보다 클 때만
			this.birthYear = birthYear; // 넣어주겠다
		}
	}
	
	
	// behavior, method, 기능 (추상화)
	// 강아지, 고양이, 오리의 현재 나이를 알려주는 메소드 생성하기
	public int ageInfo() {
		Calendar currentDate = Calendar.getInstance(); // 현재날짜와 시간을 얻어온다.
		int year = currentDate.get(Calendar.YEAR);
		int age = year-birthYear+1;
		
		return age;
	}
	
	abstract public void printAnimal(); // 미완성 메소드 (== 추상메소드)
	//public abstract void printAnimal(); //(위에랑 같은 말)
	
	
}

package my.day12.a.polymorphism;

import java.util.Calendar;

public class Animal {
	
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
	
	public void printAnimal() {
		String info = "1.동물 명: "+ name + "\n"
					+ "2.나이: "+ ageInfo() + "살\n";
		
		System.out.println(info);
	}

	
	
}

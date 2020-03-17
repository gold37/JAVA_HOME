package my.day12.a.polymorphism;

public class AppMain {
	
	public static void main(String[] args) {
		
		Dog dg1 = new Dog();
		dg1.setName("뽀삐"); // Animal에 있는 setName. 부모클래스에 있는 name에 들어감 ---> 상속
		dg1.setBirthYear(2010);
		dg1.setWeight(7);
		
		Cat ct1 = new Cat();
		ct1.setName("Tom");
		ct1.setBirthYear(2017);
		ct1.setColor("Dark Black");
		
		Duck dk1 = new Duck();
		dk1.setName("도날드");
		dk1.setBirthYear(2019);
		dk1.setPrice(5000);
		
		dg1.printDog();
		ct1.printCat();
		dk1.printDuck();
		
		
		System.out.println("\n----------- 다형성(Polymorphism) 1 --------------\n");
		// 다형성이란 ??!! (무조건 암기☆★☆★☆★)
		// 자식클래스로 생성되어진 객체를 부모클래스 타입으로 받을 수 있다
		
		Animal an1 = new Dog(); // Dog를 Animal로 받을 수 있다
		an1.setName("웰시코기");
		an1.setBirthYear(2012);
		an1.printAnimal();
		
		Animal an2 = new Cat();
		an2.setName("러시안블루");
		an2.setBirthYear(2017);
		an2.printAnimal();
		
		Animal an3 = new Duck();
		an3.setName("꽥꽥");
		an3.setBirthYear(2020);
		an3.printAnimal();
		
		
		System.out.println("\n----------- 다형성(Polymorphism) 2 --------------\n");
		
		Animal an_1 = new Dog(); // Dog를 Animal로 받을 수 있다
		((Dog)an_1).setName("웰시코기"); // 원래 정체성이 누구였냐 Dog였다 형변환
		((Dog)an_1).setBirthYear(2012);
		((Dog)an_1).setWeight(10);
		((Dog)an_1).printDog();
		
		Animal an_2 = new Cat();
		((Cat)an_2).setName("러시안블루");
		((Cat)an_2).setBirthYear(2017);
		((Cat)an_2).setColor("화이트");
		((Cat)an_2).printCat();
		
		Animal an_3 = new Duck();
		((Duck)an_3).setName("꽥꽥");
		((Duck)an_3).setBirthYear(2020);
		((Duck)an_3).setPrice(10000);
		((Duck)an_3).printDuck();
		
		/*
		Animal an_4 = new Dog(); 
		((Cat)an_4).setName("푸들"); // 실행 시 java.lang.ClassCastException 에러 발생
		((Cat)an_4).setBirthYear(2013);
		((Cat)an_4).setColor("브라운");
		((Cat)an_4).printCat();
		*/
		
		System.out.println("\n----------- 다형성(Polymorphism) 3 --------------\n");
		Animal[] aniArr = new Animal[3];
		aniArr[0] = new Dog(); // 생성되어진 객체는 자식 클래스지만 부모 클래스 타입으로 받을 수 있다 ---> 다형성
		aniArr[1] = new Cat();
		aniArr[2] = new Duck();

		if(aniArr[0] instanceof Dog) {  // instanceof = 어떤 클래스의 인스턴스입니까?
		// ▲인스턴스				▲클래스명	
		// 맞으면 true, 아니면 false
			System.out.println("aniArry[0]은 Dog클래스의 인스턴스입니다.");
		}
		else {
			System.out.println("aniArry[0]은 Dog클래스의 인스턴스가 아닙니다.");
		}
		

		if(aniArr[1] instanceof Cat) { 
			System.out.println("aniArry[1]은 Cat클래스의 인스턴스입니다.");
		}
		else {
			System.out.println("aniArry[1]은 Cat클래스의 인스턴스가 아닙니다.");
		}

		
		if(aniArr[2] instanceof Duck) {  
			System.out.println("aniArry[2]은 Duck클래스의 인스턴스입니다.");
		}
		else {
			System.out.println("aniArry[2]은 Duck클래스의 인스턴스가 아닙니다.");
		}
		
		System.out.println("\n------------------------------------------------\n");
		
		for(int i=0; i<aniArr.length; i++) {
			if(aniArr[i] instanceof Dog) {
				
				((Dog)aniArr[i]).setName("말티즈");
				((Dog)aniArr[i]).setBirthYear(2010);				
				((Dog)aniArr[i]).setWeight(3);
				
			}else if(aniArr[i] instanceof Cat) {
				
				((Cat)aniArr[i]).setName("먼치킨");
				((Cat)aniArr[i]).setBirthYear(2007);				
				((Cat)aniArr[i]).setColor("그레이");
				
			}else if(aniArr[i] instanceof Duck){
				
				((Duck)aniArr[i]).setName("황금오리");
				((Duck)aniArr[i]).setBirthYear(2011);				
				((Duck)aniArr[i]).setPrice(15000);
				
			}
		}
		
		for(Animal ani :aniArr) {
			if(ani instanceof Dog) {

				((Dog)ani).printDog();
				
			}else if(ani instanceof Cat) {
				
				((Cat)ani).printCat();
				
			}else if(ani instanceof Duck) {
				
				((Duck)ani).printDuck();
			}
		}
		
		System.out.println("\n----------- @Override --------------\n");
		// 면접 단골질문 !!!! 잘 이해할것
		for(Animal ani : aniArr) {
			ani.printAnimal();
		}
		
			
		
	}
}

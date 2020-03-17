package my.day12.b.abstractclass;

public class AppMain {
	
	public static void main(String[] args) {
		
		Dog dog = new Dog(); 
		dog.setName("말티즈");
		dog.setBirthYear(2010);
		dog.setWeight(3);
		
		Cat cat = new Cat();
		cat.setName("먼치킨");
		cat.setBirthYear(2007);
		cat.setColor("그레이");
		
		Duck duck = new Duck();
		duck.setName("황금오리");
		duck.setBirthYear(2011);				
		duck.setPrice(15000);
		
		Animal[] aniArr = new Animal[3];
		aniArr[0] = dog;
		aniArr[1] = cat;
		aniArr[2] = duck;
		
		for(Animal ani : aniArr) {
			ani.printAnimal();
		}
		
	}
}

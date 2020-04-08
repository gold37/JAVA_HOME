package my.day14.a.collection;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/*
    ==== 배열(Array)과 자료구조(Collection)의 차이점 ====
    
     1. 배열(Array)은 오로지 동일한 데이터 타입만 들어가는 저장소이다.
               배열(Array)은 그 크기가 한번 정해지면 크기를 변경할 수 없다.!!!
         
     2. 자료구조(Collection)은 동일한 타입의 객체가 아니더라도
               객체타입이기만 하면 모두 들어가는 저장소이다.
               자료구조(Collection)은 저장되는 크기가 자동적으로 늘어난다.!!!
        
        웹에서 가장 많이 사용하는 대표적인 Collection 타입은
     List 계열과 Map 계열이다.
  
  -------------------------------------------------------------------------
                  Web에서 주로 사용하는 클래스          게임프로그램밍에서 주로 사용하는 클래스
  Interface       (Single Thread 방식)          (Multi Thread 방식)
  -------------------------------------------------------------------------           
  List 계열    --      ArrayList      ,         Vector
  Map  계열    --      HashMap        ,         Hashtable 
  
      ArrayList 및 HashMap 은 Multi Thread를 지원안해주므로 가볍다.
      Vector 및 Hashtable 이 Multi Thread를 지원해주므로 무겁다.
  
      Multi Thread를 지원해주는냐 안해주느냐만 차이가 있을 뿐
           그 나머지 기능은 동일하다.  
 */

/*
    JDK 1.5 부터 제네릭(Generic)타입이 새로 추가되었는데, 제네릭(Generic)을 이용함으로써 잘못된 타입이
       사용될 수 있는 문제를 컴파일 과정에서 제거할 수 있게 되었다. 
       프로그램 실행시 타입 에러가 발생하여 작동이 멈추는 것보다는 컴파일시에 타입에러가 발생하도록 하여 
       프로그램 실행시 에러를 발생하지 않도록 사전에 방지하는 것이 좋기 때문이다.
       
         ▷ 제네릭(Generic)은 컬렉션(자료구조) 즉, 쉽게 말해서 객체들을 저장(수집)하는 구조적인 성격을 보강하기 위해 제공하는 것이다.
         ▷ 간단히 예를 들자면 컵이라는 특정 객체가 있다고 하자. 
          이 컵은 물만 담을 수 있는 물컵 , 또는 이 컵은 쥬스만 담을 수 있는 쥬스 컵. 이렇게 지정해주도록 하는 것이  제네릭(Generic) 이다.    
    
         ▷  JDK 1.5 부터 제네릭(Generic)타입이 새로 추가되면서, 특정 컬렉션(자료구조)에 저장되어질 특정한 객체 타입을 명시하여
         실행하기전 컴파일 단계에서 특정한 객체 타입이 아니면 에러를 발생토록 하여 저장이 불가능하도록 만들었다.
         즉, 특정 컬렉션(자료구조)에 저장되어질 객체의 타입을 제한하도록 만든 것이다.
    
        ▷   제네릭(Generic)타입을 사용하기 이전에는  컬렉션(자료구조)에 저장되어진 객체들을 하나씩 검출하여 객체 타입을 확인할 수 밖에 없었다.
      Object 로 부터 상속받은 객체는 모두 저장이 가능했던 이전의 버전들과는 달리 보다 체계적이라 할 수 있다.
      
        ▷ 제네릭(Generic)타입을 사용함으로써 별도의 형 변환(Casting)이 필요없이 <> 사이에 선언하였던 객체자료형으로 검출되어 편리하다.       
    
        ▷ 제네릭(Generic)타입에 있어서 1개 글자로 된 영문대문자는 영문대문자 아무것이나 사용해도 무관하다.
     -- 그런데 관습상 객체가 제네릭(Generic)타입으로 사용될때 자료형(Type)이라고 나타내고 싶을때는 <T>라고 쓰고,
               어떠한 요소(Element)이라고 나타내고 싶을때는 <E>라고 쓰고, 
        key값이라고 나타내고 싶을때는 <K>라고 쓰고, Value값이라고 나타내고 싶을때는 <V>라고 쓴다.      
        
 */


public class ListTestMain {
	public static void main(String[] args) {
	
		Vector vt = new Vector(5,3); // 1,2,3,4,5/6,7,8/9,10,11 ..
		// 초기용량 5, 용량이 다 차면 자동으로 용량을 늘리고자 한다. 그 증가치를 3으로 하겠음
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 5
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 0
		
		System.out.println("\n-------------------------------\n");
		
		String[] nameArr = {"태연", "설현", "류진", "리아", "아이린"};
		
		Member[] mbrArr = {new Member ("hongs", "123", "홍길동")
						  ,new Member ("kjw", "7777", "워니")
						  ,new Member ("less", "1592", "이순신")};
		
		Product[] prodArr = {new Product("swk", "새우깡", 1500)
							,new Product("ypr", "양파링", 1000)
							,new Product("kjk", "감자깡", 3000)
							,new Product("kkmk", "고구마깡", 5000)};

		// === 벡터에 요소(Element) 넣기 === // 
		// 벡터객체명.add(넣어야할 객체)
		vt.add(nameArr[0]);
		
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 5
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 1
		System.out.println("\n-------------------------------\n");
		
		
		for(int i=1; i<nameArr.length; i++) {
			vt.add(nameArr[i]);
		}
		
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 5
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 5
		
		System.out.println("\n-------------------------------\n");
		
		vt.add(mbrArr[0]);
		
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 8
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 6
		
		for(int i=1; i<mbrArr.length; i++) { // 1, 2
			vt.add(mbrArr[i]);
		}
		
		System.out.println("\n-------------------------------\n");
		
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 8
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 8
		
		System.out.println("\n-------------------------------\n");
		
		for(int i=0; i<prodArr.length; i++) { 
			vt.add(prodArr[i]);
			
		}
		
		System.out.println("벡터 vt의 용량: " + vt.capacity());
		// 벡터 vt의 용량: 14  ---> 새우깡 8+3  고구마깡 11+3
		System.out.println("벡터 vt에 저장된 현재 크기: " + vt.size());
		// 벡터 vt에 저장된 현재 크기: 12 ---> 8 9(새우깡) 10(양파링) 11(감자깡) 12(고구마깡)
		
		
		System.out.println("\n-------------------------------\n");
		
		// Vector vt에 저장되어진 객체의 정보를 모두 출력하시오.
		for(int i=0; i<vt.size(); i++) {

			Object obj = vt.get(i);
			System.out.println((i+1)+". "+obj.toString()); // Object의 toString() 이기 때문에 메모리 주소 정보를 보여줌. 근데 생략해도 됨
			
			} // end of for -------------------
		
		
		System.out.println("\n-------------------------------\n");
		
		for(int i=0; i<vt.size(); i++) {
			Object obj = vt.get(i);
			
			if (obj instanceof Member) { 
				((Member)obj).memberInfo();
			}
			else if(obj instanceof Product) {
				((Product)obj).prodInfo();
			}
		}
		
		System.out.println("\n---------------- Generic을 사용한 컬렉션 ---------------\n");
		
		// Vector<String> vtString = new Vector<String>(); // --> 이게 제너릭한거임. String만 받겠음
		// 또는
		List<String> vtString = new Vector<String>(); // Vector클래스가 List인터페이스를 구현해왔기 때문에 List를 써도 된다
		Vector<Member> vtMember = new Vector<Member>(); // Member만 받겠음
		Vector<Product> vtProduct = new Vector<Product>(); // Product만 받겠음
		
		String[] strArr = {"피자", "치킨", "초밥", "백반"};
		
		Member[] memArr = {new Member ("hongs", "123", "홍길동")
				  		  ,new Member ("kjw", "7777", "워니")
				  		  ,new Member ("less", "1592", "이순신")};

		Product[] pdtArr = {new Product("swk", "새우깡", 1500)
						   ,new Product("ypr", "양파링", 1000)
						   ,new Product("kjk", "감자깡", 3000)
						   ,new Product("kkmk", "고구마깡", 5000)};

		for(String str : strArr) {
			vtString.add(str); 
		}
		
		for(Member mem : memArr) {
			vtMember.add(mem); 
		}
		
		for(Product prod : pdtArr) {
			vtProduct.add(prod);
		}
		
		System.out.println("1.vtString에 저장된 String 정보를 출력합니다");
		for(int i=0; i<vtString.size(); i++) {
			String str = vtString.get(i);
			System.out.println(str);
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(String str : vtString) { // 자동으로 vtString 사이즈만큼 꺼내옴
			System.out.println(str);
		}
		
		System.out.println("\n2.vtMember에 저장된 Member 정보를 출력합니다");
		
		
		for(int i=0; i<vtMember.size(); i++) {
			Member mbr = vtMember.get(i);
			mbr.memberInfo();
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(Member mbr : vtMember) { // 자동으로 vtString 사이즈만큼 꺼내옴
			mbr.memberInfo();
		}
		
		System.out.println("3.vtProduct에 저장된 Product 정보를 출력합니다");
	
		for(int i=0; i<vtProduct.size(); i++) {
			Product prod = vtProduct.get(i);
			prod.prodInfo();
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(Product prod : vtProduct) { // 자동으로 vtString 사이즈만큼 꺼내옴
			prod.prodInfo();
		}
		
		
		
		
		
		System.out.println("\n---------------- ArrayList를 사용한 컬렉션 ---------------\n");
		
		// ArrayList<String> listString = new ArrayList<String>();
		// 또는
		List <String> listString = new ArrayList<String>(); // List는 interface, ArrayList는 class다. 인터페이스는 객체화할 수 없어서 만들때 ArrayList로해야하고 받을 때(저장할때)는 List로 할 수 있다
		List <Member> listMember = new ArrayList<Member>(); // Member만 받겠음
		List <Product> listProduct = new ArrayList<Product>(); // Product만 받겠음
		
		String[] strArr2 = {"피자", "치킨", "초밥", "백반"};
		
		Member[] memArr2 = {new Member ("hongs", "123", "홍길동")
				  		  ,new Member ("kjw", "7777", "워니")
				  		  ,new Member ("less", "1592", "이순신")};

		Product[] pdtArr2 = {new Product("swk", "새우깡", 1500)
						   ,new Product("ypr", "양파링", 1000)
						   ,new Product("kjk", "감자깡", 3000)
						   ,new Product("kkmk", "고구마깡", 5000)};

		for(String str : strArr2) {
			listString.add(str); 
		}
		
		for(Member mem : memArr2) {
			listMember.add(mem); 
		}
		
		for(Product prod : pdtArr2) {
			listProduct.add(prod);
		}
		
		System.out.println("1.ArrayList listString에 저장된 String 정보를 출력합니다");
		for(int i=0; i<listString.size(); i++) {
			String str = listString.get(i);
			System.out.println(str);
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(String str : listString) { // 자동으로 vtString 사이즈만큼 꺼내옴
			System.out.println(str);
		}
		
		System.out.println("\n2.ArrayList listMember에 저장된 Member 정보를 출력합니다");
		
		
		for(int i=0; i<listMember.size(); i++) {
			Member mbr = listMember.get(i);
			mbr.memberInfo();
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(Member mbr : listMember) { // 자동으로 vtString 사이즈만큼 꺼내옴
			mbr.memberInfo();
		}
		
		System.out.println("3.ArrayList listProduct에 저장된 Product 정보를 출력합니다");
	
		for(int i=0; i<listProduct.size(); i++) {
			Product prod = listProduct.get(i);
			prod.prodInfo();
		}
		
		System.out.println("\n또는 아래와 같이 할 수 있다.\n");
		
		for(Product prod : listProduct) { // 자동으로 vtString 사이즈만큼 꺼내옴
			prod.prodInfo();
		}
		
		
		
		
		System.out.println("\n~~~~~~ 오토박싱, 오토언박싱에 대해서 알아봅니다.~~~~~~~");	
		
		// Boxing(박싱, 포장을 하는것) 이란 ?
		// ==> 기본자료형(boolean, byte, short, int, long, char, float, double)으로 되어진 
		//     변수를 Wrapper 클래스(Boolean, Byte, Short, Integer, Long, Character, Float, Double)	
		//     타입의 객체로 만들어주는 것을 말한다.
			int a1 = 10;
			Integer a2 = new Integer(a1); // Boxing(박싱) 
			
			
		// UnBoxing(언박싱, 포장을 푸는것) 이란?	
		// ==> Wrapper 클래스(Boolean, Byte, Short, Integer, Long, Character, Float, Double)로 
		//     되어져 있는 객체를 기본자료형(boolean, byte, short, int, long, char, float, double)으로 
		//     만들어주는 것을 말한다.

			Integer a3 = new Integer(50);
			int a4 = a3.intValue();
			System.out.println("a4: "+a4);
			
			Double db1 = new Double(1.23456);
			double db2 = db1.doubleValue(); // UnBoxing(언박싱)
			System.out.println("db2: " +db2); 
			
			Double db3 = new Double(1.23456);
			double db4 = db3; // Auto UnBoxing(언박싱)
			System.out.println("db4: " +db4);
			
		// JVM이 Auto Boxing(오토박싱, 포장을 자동으로 해주는것)
		//      Auto UnBoxing(언박싱, 포장을 자동으로 풀어주는것)
		// 을 해주므로 개발자인 우리는  Boxing(박싱) 과 UnBoxing(언박싱)을
		// 해줄 필요가 없다.
			
		List<Integer> listInteger = new ArrayList<Integer>();
		
		listInteger.add(new Integer(10)); // Boxing(박싱)해줌. 
		listInteger.add(20); // Auto Boxing(오토박싱)됨.
		listInteger.add(30); // Auto Boxing(오토박싱)됨.
		
		int len = listInteger.size();
		int[] intArr = new int[len]; 
		
		for(int i=0; i<intArr.length; i++) { 
			intArr[i] = listInteger.get(i); // Auto UnBoxing(오토 언박싱)됨
		}
		
		for(int a : intArr) {
			System.out.println(a);
		}
		/*
		   10
		   20
		   30  
		 */
		
	} // end of main() ------------------
}

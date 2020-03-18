package my.day13.d.methodOverloading;

public class MemberConstructorOverloading {

	// 생성자의 오버로딩에 대해서 알아보자
	String id;
	String pwd;
	String name;
	String address;
	
	public MemberConstructorOverloading() { // 기본 생성자
		
	}
	
	public MemberConstructorOverloading(String id, String pwd) {
		this(id, pwd, "박보검", "서울"); // this()는 기본 생성자를 말함 (위에거 public MemberCons~)
		// 파라미터가 4개인 생성자를 호출 (아래거)
	}
	
	
	public MemberConstructorOverloading(String id, String pwd, String name, String address) { 
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
	}
	
}

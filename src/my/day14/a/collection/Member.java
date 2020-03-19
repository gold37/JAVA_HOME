package my.day14.a.collection;

public class Member { // 모든 클래스의 부모는 Object. extends Object가 생략되어져 있음

	String id;
	String pwd;
	String name;
	
	public Member() {} // 반드시 꼭 넣어줘야돼 !!! 나중에 JSP할때 안쓰면 꽝된대
	
	public Member(String id, String pwd, String name) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}
	
	public void memberInfo() {
		System.out.println("=== 회원정보 ===\n"
						 + "1.아이디: "+id+"\n"
						 + "2.암호: "+pwd+"\n"
						 + "3.성명: "+name+"\n");
	}

	@Override
	public String toString() {
		String info = "1.아이디: "+id+"\n"
					+ "2.암호: "+pwd+"\n"
					+ "3.성명: "+name+"\n";
		return info;
	}
	
}

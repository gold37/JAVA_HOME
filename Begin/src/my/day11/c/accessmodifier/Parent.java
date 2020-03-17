package my.day11.c.accessmodifier;

public class Parent {

	public String id;
	protected String pwd;
	String name; // default 
	private String birthday;
	
	void showInfo() {
		String info = "1.아이디: " + id + "\n"
					+ "2.암   호: " + pwd + "\n"
					+ "2.성   명: " + name + "\n"
					+ "2.생년월일: " + birthday + "\n";
	
		System.out.println(info);
	}
	
	
	
	
}

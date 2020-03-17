/*
	===== **** 객체지향 프로그래밍(Object Oriented Programming) 이란? *** ==== 
	 
	   ※ OOP 의 4가지 특징(!!!!필수암기!!!!)
	   --> 1. 상속성(Inheritance) : 클래스의 재사용과 소스 코드의 중복제거를 목적으로 하는 기술 
	   --> 2. 추상화(Abstraction) : 프로그램이 필요로 하는 실제 데이터들을 모델링하는 기술 
	   --> 3. 캡슐화(EnCapsulation) : 객체지향의 가장 중요한 데이터 보호 기술   
	   --> 4. 다형성(Polymorphism) : 상속을 이용하여 여러 클래스 타입을 하나의 클래스 타입으로 다루는 기술 
	   
	   구인구직 어플리케이션 프로그래밍 제작시 
	   필요한 요소(부품)가 무엇이 있는지 생각해보자.
	 아주 다양하고, 많은 요소들이 필요할 것이다.
	 
	 예를 들어,
	 구직자, 구인회사, 채용.... 등등등 많이 있다.
	 이러한 요소(부품)들이 바로 객체인데 이 객체를 만드는 설계도면이 클래스이다.
	 
	위와(구인구직 어플리케이션 프로그래밍 제작) 같이 현실세계에 존재하는
	다양한  객체들을 각각 하나하나 추상화 시켜서 클래스로 옮기는 것을
	객체지향 프로그래밍(OOP)이라고 한다.
	
	여기서 추상화(abstraction)란?
	--> 일반적인 의미의 추상화란 어떤 물체(object)에서 주된
	    특징을 부각시켜 표현하고, 나머지 부분은 과감하게 생략하는것을 말한다.
	    추상화의 반대는 아주 시시콜콜한것(세세한 것)까지 전부 몽땅
	    다 묘사하는 것을 말하는데 이것을 정밀화 라고 말한다.
	  객체지향 프로그래밍(OOP)에서 사용되는 추상화도 이와 비슷하다.
	 어떤 하나의 물체를 대표하는 속성(명사, 멤버변수)과 기능(동사, 메소드)을 추출해내는 것을 
	객체지향 프로그래밍(OOP)에서 "추상화" 라고 한다. 
	 
	>>> 예를 들어, 구인구직 어플리케이션 프로그래밍 제작시
	   필요한 부품(요소)중 하나인 "구직자" 에 대해서 알아보자.
	   "구직자" 가 가지고 있는 속성(명사, 멤버변수)과 행동양식(기능, 동사, 메소드)을 뽑아보자.
	 1). 속성(property, attribute, field)은 멤버변수가 되고,
	 2). 행동양식(기능)은 메소드가 되는 것이다.
	 
	 Gujikja(클래스)
	    |
	    |-- 속성(property, attribute, field) : 아이디, 암호, 성명, 연락처, 이메일, 주소, 학력, 희망구직직종, 희망연봉.....  
	    |-- 행동양식(기능, 메소드) : 구직자로 접속(로그인)할수 있는 기능, 구직자정보를 조회해주는 기능, 구직자정보를 변경해주는 기능, ....... 
    
*/

package my.day11.a.encapsulation;

import java.util.Calendar;

public class Gujikja {
	
	// 클래스 멤버 = (field, attribute, property, 속성) + (behavior, 기능)
	//					▲ instance변수, static변수		▲ 메소드
	//					  == 멤버 변수					  	  == 함수
	
	/*

	접근제한자(접근지정자, accessmodifier)   자기자신클래스내부      동일패키지에있는다른클래스      다른패키지에있는하위(자식)클래스        그외의영역  
	----------------------------------------------------------------------------------------------------------------------- 
	public                                    O                    O                         O                 O  
	protected                                 O                    O                         O                 X
	default                                   O                    O                         X                 X
	private                                   O                    X                         X                 X
	
	 */
	
	
	// 1. Gujikja 클래스의 속성 정하기(추상화 작업) --> 필요한 속성과 메소드를 만드는것
	private String userid; // 사용자 아이디
	private String pwd; // 암호
	private String name; // 성명
	private String birthday; //생년월일

	public void setUserid(String userid) {
		if(userid == null || userid.trim().isEmpty()) {
			System.out.println(">>> 사용자 아이디를 반드시 입력하셔야 합니다.\n");
			return; // 종료
		}
		this.userid = userid; // 뭔가 들어오면 아이디에 넣어주겠음
	}
	
	public String getUserid() {
		return userid;
	}
	

	public void setPwd(String pwd) {
		// 암호는 8글자 이상 15글자 이하이면서 대문자, 소문자, 숫자, 특수문자 혼합이 되어야만 사용 가능
		if(pwd == null || pwd.trim().isEmpty()) {
			System.out.println(">>> 암호를 반드시 입력하셔야 합니다.\n");
			return; // 종료
		}
		int len = pwd.length();
		
		if(!(8<=len && len<=15)) {
			System.out.println(">>> 암호는 8글자 이상 15글자 이하이어야합니다.\n");
			return; // 종료
		}
		
		char[] chArr = pwd.toCharArray(); // 글자 한개한개 비교
		
		boolean flagUpper = false;
		boolean flagLower = false;
		boolean flagNumber = false;
		boolean flagSpecial = false;
		
		for(int i=0; i<chArr.length; i++) { // 배열에 들어온것만큼 검사하겠음
			
			char ch = chArr[i]; // 글자 한개 얻어옴
			
			if('A' <= ch && ch <= 'Z') {
				flagUpper = true;
			}else if ('a' <= ch && ch <= 'z') {
				flagLower = true;
			}else if ('0' <= ch && ch <='9') {
				flagNumber = true;
			}else {
				flagSpecial = true;
			}
			
			if(flagUpper && flagLower && flagNumber && flagSpecial) {
				this.pwd = pwd; // true 일때만 넣어주겠다
			}
			
		}// end of for -----------------
		
		this.pwd = pwd;
	}// end of public void setPwd(String pwd)----------------

	public String getPwd() {
		return pwd;
	}



	public void setName(String name) {
		if(name == null || name.trim().isEmpty()) {
			System.out.println(">>> 구직자명은 반드시 입력하셔야 합니다.\n");
			return; // 종료
		}
		
		this.name = name;
	}// end of public void setName(String name)-----------

	public String getName() {
		return name;
	}

	public void setBirthday(String birthday) {
		
		if(birthday == null || birthday.trim().isEmpty()) {
			System.out.println(">>> 생년월일은 반드시 입력하셔야 합니다.\n");
			return; // 종료
		}
		
		int len = birthday.length();
		
		if(len != 8) {
			System.out.println(">>> 생년월일은 8글자이어야합니다.\n");
		}else {
			//생년월일이 8글자로 되어진 경우인데 모두가 숫자로만 되어져야한다

			boolean flag = false;
			
			for(int i=0; i<len; i++) {
				char ch = birthday.charAt(i); // 글자 한개만 얻어옴
				if(!('0' <= ch && ch <= '9')) { // 숫자가 아니라면 ex) 1998a123
					flag = true;
					break;
				}
			}// end of for ----------
			
			// 생년월일 앞의 2자리가 19 또는 20만 들어올 수 있도록 검사
			if(!flag) {
				String str = birthday.substring(0, 2);// 앞에 두글자 0,1만 뽑아옴
				if(!("19".equals(str) || "20".equals(str))) {
					flag = true;
				}
						
			}
			
			if(!flag) {
			this.birthday = birthday;
			}
		}
		
		//this.birthday = birthday;
	}


	public String getBirthday() {
		return birthday;
	}

	// 2. 메소드 (행위) 만들기
	boolean isGujikjaExists(String userid, String pwd) { // 지연변수
		if(this.userid.equals(userid) && this.pwd.equals(pwd))
			return true;
		else
			return false;
		} // end of boolean jsGujikjaExists(String userid, String pwd)
	
	// 현재 나이를 알려주는 메소드 생성하기
	int getAge() {
		Calendar currentDate = Calendar.getInstance(); // 현재날짜와 시간을 얻어온다.
		int year = currentDate.get(Calendar.YEAR);
		
		int age = year - Integer.parseInt(birthday.substring(0,4))+1; // 나이 = 현재년도 - 태어난년도 + 1
		return age;
	}
	
	// Gujikja 클래스의 객체 정보를 조회해주는 메소드 생성하기
	
	void showGujikjaInfo() { // 정보 공유하면 안되니까 static 쓰면안됨
		
		String info = "";
		
		info += "1.아이디: "+userid+"\n";
		info += "2.암   호: "+pwd+"\n";
		info += "3.성   명: "+name+"\n";
		info += "4.생년월일: "+birthday.substring(0,4)+"-"+birthday.substring(4,6)+"-"+birthday.substring(6)+"\n";
		info += "5.현재나이: "+getAge()+"세"; // 이때 +는 문자열 결합
		
		System.out.println(info+"\n");
	}
	
		// 모든 구직자 정보
		String getGujikjaInfo() {
		String info = userid+"\t"+name+"\t"+birthday.substring(0,4)+"-"+birthday.substring(4,6)+"-"+birthday.substring(6)+"\t"+getAge()+"세";
		return info;
	}// end of String getGujikjaInfo2()---------
	
	//field, attribute, property, 속성이 적어도 1개가 null 이라면 false를 리턴해주고
	//모두가  null 아니라면 true를 리턴해주는 메소드를 생성하겠다 
	public boolean isUseGujikja() {
		
		if(userid != null && pwd != null && name != null && birthday != null) {
			return true;
		}
		else {
			return false;
		}
	}
	
}

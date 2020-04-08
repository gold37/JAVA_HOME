/*
     == ArrayList == 
     1. 출력시 저장된 순서대로 나온다.
     2. 중복된 데이터를 저장할 수 있다.
     3. 데이터를 읽어오는 속도는 ArrayList 가 LinkedList 보다 상대적으로 빠르다.
     4. 순차적으로 데이터를 추가/삭제하는 경우에는 ArrayList 가 LinkedList 보다 상대적으로 빠르다.
     5. 일반적인 데이터 추가/삭제는 데이터 중간 중간마다 발생하므로 이러한 경우에는 ArrayList 가 LinkedList 보다 상대적으로 느리다.
     6. 결과값은 ArrayList 를 사용하든지 LinkedList 를 사용하든지 동일한 결과값을 가진다.
     7. LinkedList 보다는 ArrayList 를 사용하도록 하자.
*/

package my.day14.a.collection;

import java.util.*;	// java.util 패키지에 있는 것을 모두 다 쓰겠음

public class ArrayListMain {
	public static void main(String[] args) {
		
		
		
		// 1. Member 클래스의 객체만을 저장할 수 있는 ArrayList 객체 memberList를 생성하시오.
		List<Member> memberList = new ArrayList<Member>();
		
		// 2. Member 클래스의 객체 6개를 생성하여 memberList에 저장하시오
		memberList.add(new Member("youjs", "qwer1234$", "유재석"));
		memberList.add(new Member("eom", "qwer1234$", "엄정화"));
		memberList.add(new Member("kanghd", "qwer1234$", "강호동"));
		memberList.add(new Member("less", "qwer1234$", "이순신"));
		memberList.add(new Member("kimth", "qwer1234$", "김태희"));
		memberList.add(new Member("kangkc", "qwer1234$", "강감찬"));
		
		memberList.add(new Member());
		memberList.add(new Member("less", "qwer1234$", "이순신")); // ArrayList는 중복된 데이터를 저장할 수 있다.
		memberList.add(new Member("less", "abcd", "이삼순"));
		memberList.add(new Member()); // 중복된 데이터를 저장할 수 있다.
		
		// 3. memberList에 저장되어진 모든 회원들의 정보를 출력하도록 memberInfo() 메소드를 실행하시오.
		for(int i=0; i<memberList.size(); i++) {
			memberList.get(i).memberInfo();
		}
		
		System.out.println("~~~		 또는		 ~~~\n");
		
		for(Member mbr : memberList) {
			mbr.memberInfo();
		}
		
		
		/*
		 	[퀴즈1]
		 	MemberList에 저장되어진 Member 객체들 중에
		 	Member 객체의 userid 값이 고유한 값만 들어온다는 전제하에
		 	userid 값이 "less"인 회원의 정보만 출력하세요.
		 	
		 */
		
		System.out.println(" ~~~~~ [퀴즈1] ~~~~ \n");
			
		boolean flag = false;
		
		for(int i=0; i<memberList.size(); i++) {
			Member mbr = memberList.get(i); // 끄집어 온 Member 객체
			if("less".equals(mbr.id)) {
				mbr.memberInfo();
				flag = true;
				break;
			}			
		}

		if(!flag) {
			System.out.println("less은 존재하지 않습니다.");
		}
		
		flag = false;
		
		for(int i=0; i<memberList.size(); i++) {
			Member mbr = memberList.get(i); // 끄집어 온 Member 객체
			if("hansk".equals(mbr.id)) {
				mbr.memberInfo();
				flag = true;
				break;
			}			
		}

		if(!flag) {
			System.out.println("hansk는 존재하지 않습니다.");
		}
		
		System.out.println("\n ---- 또는 ----\n");
		
		flag = false;
		
		for(Member mbr : memberList) {
			if("kimth".equals(mbr.id)) {
				mbr.memberInfo();
				flag = true;
				break;
			}			
		}

		if(!flag) {
			System.out.println("kimth은 존재하지 않습니다.");
		}
		
		flag = false;
		
		for(Member mbr : memberList) {
			if("dusk".equals(mbr.id)) {
				mbr.memberInfo();
				flag = false;
				break;
			}			
		}

		if(!flag) {
			System.out.println("dusk는 존재하지 않습니다.");
		}
		
		
		
	/*
	 	[퀴즈2]
	 	MemberList에 저장되어진 Member 객체들 중에
	 	name이 "이"씨인 회원들의 정보만 출력하세요.
	 	
	 */
	
	System.out.println("\n ~~~~~ [퀴즈2] ~~~~ \n");
	
	/*

	for(int i=0; i<memberList.size(); i++) {
		Member mbr = memberList.get(i);
		if(mbr.name.startsWith("이")) {
			mbr.memberInfo();
		}
	} // 이순신만 나오고 이삼순 안나옴 + NullPointerException도 나옴

	*/
	
	for(int i=0; i<memberList.size(); i++) {
		Member mbr = memberList.get(i);
		if(mbr.name != null && mbr.name.startsWith("이")) {
			mbr.memberInfo();
		}
	}
	
	
	System.out.println("\n -------- 또는 --------- \n");
	
	for(Member mbr : memberList) {	// 확장된 for문
		if(mbr.name != null && mbr.name.startsWith("이")) {
			mbr.memberInfo();
		}
	}
	
	
	// *** ArrayList 타입인 memberList에 새로운 Member 객체 추가시 
	// 	      특정 index(위치)에 들어가도록 할 수 있다. *** 
	System.out.println("\n >>> memberList에 새로운 Member객체 추가하기 <<<\n");
	
	memberList.add(new Member("seolh", "qwer1234$", "설현"));
	// memberList의 맨 뒤에 추가된다.
	
	memberList.add(3, new Member("charew", "qwer1234$", "차은우"));
	// 			   ▲ 특정위치 값
	// 유재석(0) 엄정화(1) 강호동(2) 차은우(3) 이순신(4)
	
	for(Member mbr : memberList) {
		mbr.memberInfo();
	}	 
	
	System.out.println("\n >>> memberList에  Member객체 삭제하기 <<<\n");
	
	// *** ArrayList 타입인 memberList에 새로운 Member객체 삭제하기 *** 
	memberList.remove(3); 
	// 				  ▲ 삭제할 Member객체의 인덱스번호
	
	for(Member mbr : memberList) {
		mbr.memberInfo();
	}	 
	
	
	
	/*
	 	[퀴즈3]
	 	MemberList에 저장되어진 Member객체들 중에
	 	name이 "이"씨인 회원들은 삭제하시고 삭제 후 
	 	MemberList에 저장되어진 회원정보들을 출력하세요.
	 	
	 */
	
	System.out.println("\n ~~~~~ [퀴즈3] ~~~~ \n");
	
	for(int i=0; i<memberList.size(); i++) {
		Member mbr = memberList.get(i);
		if(mbr.name != null && mbr.name.startsWith("이")) {
			memberList.remove(i);
			i--;
		}
		else {
			mbr.memberInfo();
		}
	}
	
	for(int i=0; i<memberList.size(); i++) {
		Member mbr = memberList.get(i);
		System.out.println(mbr.name);
		
	} // 다 지워졌는지 확인
	
	
	System.out.println("\n---------- 또는 --------- \n");
	
	for(int i=memberList.size()-1; i>=0; i--) {
		Member mbr = memberList.get(i);
		
		if(mbr.name != null && mbr.name.startsWith("이")) {
			System.out.println("i => "+ i);	// 8 7 3 뒤에서부터 거꾸로 지움
			memberList.remove(i);
		}
	}
	
	for(Member mbr : memberList) {
		mbr.memberInfo();
	}	
	
	System.out.println("--------------------- 퀴즈 4번 -------------------\n");
	
	/*
		 [퀴즈4] 
		 memberList 에 저장되어진 Member 객체들 중에 
		  특정조건(userid 가 null 인 것)에 만족하는 Member 객체 하나를 삭제하고
		  삭제되어진 그 인덱스(위치)자리에 새로운 Member 객체를 넣어주기
		  그런데 만약에 userid 가 null 인 것이 없다라면 새로운 Member 객체를 맨뒤에 넣어주기
	*/
	
	flag = false;
	
	for(int i=memberList.size()-1; i>=0; i--) {
		Member mbr = memberList.get(i); // Member 가져옴
		if(mbr.id == null) { // null인 자리
			memberList.remove(i); 
			memberList.add(i, new Member("sana", "abcd", "사나"));
			flag = true;
			break;
		}
	}
	
	if(!flag) {
		memberList.add(new Member("sana", "abcd", "사나"));
	}
	
	for(Member mbr : memberList) {
		mbr.memberInfo();
	}	
	
	
	System.out.println("--------------------- memberList에 저장된 모든 객체 삭제하기 -------------------\n");
	memberList.clear(); // 전부 비움
	
	System.out.println("memberList.size() ==> " + memberList.size());
	// memberList.size() ==> 0
	
	// remove는 특정 객체만 삭제하고 clear는 전부 삭제시킴
	
	
	
	
	} // end of main() ---------------------------
}

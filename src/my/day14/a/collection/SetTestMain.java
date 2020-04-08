/*
     == HashSet == 
     1. 출력시 저장된 순서가 유지되지 않는다.
     2. 중복된 데이터를 저장할 수 없다.
               그러므로 Collection 내의 중복된 요소들을 저장하지 않고자 할때 많이 사용된다.
               
     == LinkedHashSet ==
     1. 출력시 저장된 순서가 유지된다.
     2. 중복된 데이터를 저장할 수 없다.
               그러므로 Collection 내의 중복된 요소들을 저장하지 않고자 할때 많이 사용된다.      
                 
 */

package my.day14.a.collection;

import java.util.*;

public class SetTestMain {

	public static void main(String[] args) {

System.out.println("\n===== HashSet =====\n");
		
		/*
		    1. Member 클래스의 객체만을 저장할 수 있는 
		       HashSet 객체 mbrHashSet 를 생성한다. 
		 */
		Set<Member> mbrHashSet = new HashSet<Member>();
		
		//  2. Member 클래스의 객체 6개를 생성하여 mbrHashSet 에 저장한다.
		mbrHashSet.add(new Member("youjs","qwer1234$","유재석"));
		mbrHashSet.add(new Member("eom","qwer1234$","엄정화"));
		mbrHashSet.add(new Member("kanghd","qwer1234$","강호동"));
		mbrHashSet.add(new Member("leess","qwer1234$","이순신"));
		mbrHashSet.add(new Member("kimth","qwer1234$","김태희"));
		mbrHashSet.add(new Member("kangkc","qwer1234$","강감찬"));
		
		mbrHashSet.add(new Member("leess","qwer1234$","이순신"));
		
		Member mbr1 = new Member("suji","abcd1234","수지");
		Member mbr2 = new Member("suji","abcd1234","수지");
		
		mbrHashSet.add(mbr1);
		mbrHashSet.add(mbr2);
		
		Member mbr3 = new Member("chaew","abcd1234","차은우");
		Member mbr4 = new Member("car","abcd0070","차금우");
		
		mbr3 = mbr4;  // mbr3 과 mbr4 는 동일한 객체를 가지게된다.
		
		// 그러므로 아래와 같이하면 이미 mbr3 이 mbrHashSet 에 저장되어져 있으므로
		// mbr3 과 동일한 mbr4는 저장될 수 없다.
		mbrHashSet.add(mbr3);
		mbrHashSet.add(mbr4);
		
		// 3. mbrHashSet 에 저장되어진 모든 회원들의 정보를 출력한다.
		//    Set 계열은 저장된 데이터를 조회하려면 반드시 Iterator를 통해서만 볼 수 있다. 
		Iterator<Member> it = mbrHashSet.iterator();
		
		while(it.hasNext()) {
			// it.hasNext() 은 
			// it 에서 현재 it가 가지고 있는 여러 Member 데이터중 
			// 하나를 끄집어내서 존재하는지를 알아보는 것이다.
			// 존재하면 true, 존재하지 않으면 false.
						
			Member m = it.next();
			// 실제로 Member를 it 에서  끄집어낸다.
			// 그러면 끄집어 낸 Member는 더이상 it 에는 남아있지 않게 된다.
			
			m.memberInfo();
		}
		
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~\n");
		
		
		// 4. mbrHashSet 에 저장되어진 회원들 중 
				//    userid 가 "leess" 인 회원의 정보를 출력하세요.
				
				it = mbrHashSet.iterator();
				
				while(it.hasNext()) {
					Member m = it.next();
					if("leess".equals(m.id)) {
						m.memberInfo();
					}
				}
				
				System.out.println("\n===================\n");
				
				// 5. mbrHashSet 에 저장되어진 회원들 중 
				//    userid 가 "leess" 인 회원을 삭제하세요.
				
				it = mbrHashSet.iterator();
				
				while(it.hasNext()) {
					Member m = it.next();
					if("leess".equals(m.id)) {
						it.remove();
						// mbrHashSet 에 저장된 요소(Element)를 삭제하려면
						// Iterator를 이용한 it.remove(); 을 사용하여 삭제한다.
					}
				}
				
				// userid 가 "leess" 인 회원을 삭제한 후 모든 회원정보를 출력하기 
				it = mbrHashSet.iterator();
				while(it.hasNext()) {
					it.next().memberInfo();
				}
				
				
				/////////////////////////////////////////////
				
				System.out.println("\n===== LinkedHashSet =====\n");
				
				/*
				    1. Member 클래스의 객체만을 저장할 수 있는 
				       LinkedHashSet 객체 mbrLinkedHashSet 를 생성한다. 
				 */
				Set<Member> mbrLinkedHashSet = new LinkedHashSet<Member>();
				
				//  2. Member 클래스의 객체 6개를 생성하여 mbrHashSet 에 저장한다.
				mbrLinkedHashSet.add(new Member("youjs","qwer1234$","유재석"));
				mbrLinkedHashSet.add(new Member("eom","qwer1234$","엄정화"));
				mbrLinkedHashSet.add(new Member("kanghd","qwer1234$","강호동"));
				mbrLinkedHashSet.add(new Member("leess","qwer1234$","이순신"));
				mbrLinkedHashSet.add(new Member("kimth","qwer1234$","김태희"));
				mbrLinkedHashSet.add(new Member("kangkc","qwer1234$","강감찬"));
				
				mbrLinkedHashSet.add(new Member("leess","qwer1234$","이순신"));
				
				Member mbr11 = new Member("suji","abcd1234","수지");
				Member mbr22 = new Member("suji","abcd1234","수지");
				
				mbrLinkedHashSet.add(mbr11);
				mbrLinkedHashSet.add(mbr22);
				
				Member mbr33 = new Member("chaew","abcd1234","차은우");
				Member mbr44 = new Member("car","abcd0070","차금우");
				
				mbr33 = mbr44;  // mbr33 과 mbr44 는 동일한 객체를 가지게된다.
				
				// 그러므로 아래와 같이하면 이미 mbr33 이 mbrLinkedHashSet 에 저장되어져 있으므로
				// mbr33 과 동일한 mbr44는 저장될 수 없다.
				mbrLinkedHashSet.add(mbr33);
				mbrLinkedHashSet.add(mbr44);
				
				// 3. mbrLinkedHashSet 에 저장되어진 모든 회원들의 정보를 출력한다.
				//    Set 계열은 저장된 데이터를 조회하려면 반드시 Iterator를 통해서만 볼 수 있다. 
				Iterator<Member> itr = mbrLinkedHashSet.iterator();
				
				while(itr.hasNext()) {
					// itr.hasNext() 은 
					// itr 에서 현재 itr가 가지고 있는 여러 Member 데이터중 
					// 하나를 끄집어내서 존재하는지를 알아보는 것이다.
					// 존재하면 true, 존재하지 않으면 false.
								
					Member m = itr.next();
					// 실제로 Member를 itr 에서  끄집어낸다.
					// 그러면 끄집어 낸 Member는 더이상 itr 에는 남아있지 않게 된다.
					
					m.memberInfo();
				}
				
				System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~\n");
				
				// 4. mbrLinkedHashSet 에 저장되어진 회원들 중 
				//    userid 가 "leess" 인 회원의 정보를 출력하세요.
				
				itr = mbrLinkedHashSet.iterator();
				
				while(itr.hasNext()) {
					Member m = itr.next();
					if("leess".equals(m.id)) {
						m.memberInfo();
					}
				}
				
				System.out.println("\n===================\n");
				
				// 5. mbrLinkedHashSet 에 저장되어진 회원들 중 
				//    userid 가 "leess" 인 회원을 삭제하세요.
				
				itr = mbrLinkedHashSet.iterator();
				
				while(itr.hasNext()) { // 객체가 있다면
					Member m = itr.next(); // 끄집어냄
					if("leess".equals(m.id)) {
						itr.remove();
						// mbrLinkedHashSet 에 저장된 요소(Element)를 삭제하려면
						// Iterator를 이용한 itr.remove(); 을 사용하여 삭제한다.
					}
				}
				
				// userid 가 "leess" 인 회원을 삭제한 후 모든 회원정보를 출력하기 
				itr = mbrLinkedHashSet.iterator();
				while(itr.hasNext()) {
					itr.next().memberInfo();
				}
	}

}

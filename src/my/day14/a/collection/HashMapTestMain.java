/*
    === Map 계열 ===
    1. HashMap 과 Hashtable 이 있다.
    2. Map 계열은 List 계열(Vector, ArrayList, LinkedList)처럼 index 가 사용되어 저장되는 것이 아니라, 
       Map 계열은 key값과 value값을 쌍으로 사용하여 저장하는데  
             데이터 저장시 사용되는 메소드는 put(String key, Object value)메소드를 사용한다.
             이때 key값은 반드시 고유한 값을 가져야 하고, value값은 중복된 값이 와도 괜찮다.
    3. Map 계열에 저장된 key값들은 순서와는 상관없이 저장된다.  
    4. Map 계열에 저장된 value값을 추출하려면 key를 이용해서 가져오는데 
       value 값의 추출은 get(String key) 메소드를 사용한다. 
 */


package my.day14.a.collection;

import java.util.*;

public class HashMapTestMain {

	public static void main(String[] args) {
		
		Map<String, Member> mbrMap = new HashMap<String, Member>();  
				
		mbrMap.put("youjs", new Member("youjs", "qwer1234$", "유재석"));
		mbrMap.put("eom", new Member("eom", "qwer1234$", "엄정화"));
		mbrMap.put("kanghd", new Member("kanghd", "qwer1234$", "강호동"));
		mbrMap.put("less", new Member("less", "qwer1234$", "이순신"));
		mbrMap.put("kimth", new Member("kimth", "qwer1234$", "김태희"));
		mbrMap.put("kangkc", new Member("kangkc", "qwer1234$", "강감찬"));
		
		mbrMap.put("less", new Member("less", "qwer1234$", "Lee Sunsin")); // 중복 된 키 값이 있으면 마지막걸로 덮어씌워짐
		// === mbrMap에 저장되어진 것 중에서 key가 "less"인  value값(지금은 Member객체)을 추출하시오. ===
		Member mbr = mbrMap.get("less"); // key는 대 소문자 구분함. LESS 쓰면 에러
		//System.out.println(mbr);
		mbr.memberInfo();
		
		mbr = mbrMap.get("hansk");		
		if(mbr == null) {
			System.out.println("hansk는 존재하지않습니다.");
		}
		else {
			mbr.memberInfo();
		}
		
		
		System.out.println("\n------ keySet() 결과보기 ------\n");
		/*
		 	 mbrMap에 저장되어진 모든 key값들만 알아와서 반환해주는 메소드가 있다.
		 	  바로 mbrMap.keyset()dlek.
		 	 Set<K>	keySet()
		 */
		
		Set<String> keySets = mbrMap.keySet();
		
		for(String key:keySets) {
			System.out.println(key);
		}
		// 출력되는 순서는 입력된 순서랑 다르게 나온다. List 계열은 순서대로 나오는데 Map 계열은 순서 상관안쓰고 나옴
		/*
		    eom
			youjs
			kimth
			kangkc
			kanghd
			less
		 */
		
		System.out.println("\n === 모든 회원정보 조회 결과 1 ===\n");
		
		for(String key : keySets) {
			Member mem = mbrMap.get(key);
			mem.memberInfo();
		}
		
		
		System.out.println("\n === 모든 회원정보 조회 결과 2 ===\n");
		Set<String> keySets2 = mbrMap.keySet();
		Iterator<String> it = keySets2.iterator();
		
		while(it.hasNext()) {
			/*
			 	it.hasNext()은 
			 	it에서 현재 it가 가지고 있는 여러 String 데이터 중 
			 	하나를 끄집어내서 존재하는지를 알아보는 것이다.
				존재하면 true, 존재하지않으면 false
				그러므로 현재 키의 갯수가 6개이므로 6번 반복을 할 것이다.
			 */
			
			String key = it.next();
			/*
			 	실제로 키값인 String 값을 it에서 끄집어 낸다.
			 	그러면 끄집어낸 String 값은 더이상 it에는 남아있지 않게된다.
			 	
			 */
			System.out.println(key);
		}
		
		System.out.println("\n 또 한번 더 !!! Baby One More Time ~~~~~~\n");
		while(it.hasNext()) {
			String key = it.next();
			System.out.println(key);
		}
		/*
		 	it 에는 더이상 String 데이터가 존재하지 않으므로
		 	처음부터 it.hasNext()은 false가 되어진다.
		 	그래서 아무것도 출력되지않는다.
		 */
		
		
		System.out.println("-------- 다시 처음부터 해보겠어 ! --------");
		Iterator<String> it2 = keySets2.iterator(); // 키 뭉치를 얻어옴 
		
		while(it2.hasNext()) {
			String key = it2.next(); 
			mbrMap.get(key).memberInfo(); 
		}
		
		System.out.println("\n *** key 값이 kimth인 Member 삭제하기 *** \n");
		mbrMap.remove("kimth");
		
		for(String key : keySets) {
			Member mem = mbrMap.get(key);
			mem.memberInfo();
		}
		
		System.out.println("\n **** mbrMap 에 저장되어진 모든 Member 삭제하기 **** ");
		
		mbrMap.clear();
		
		System.out.println("\n **** mbrMap 에 저장되어진 모든 Member 객체가 삭제되었는지 확인하기  **** ");
		
		System.out.println("mbrMap.isEmpty() => " + mbrMap.isEmpty());
		
		for(String key : keySets) {
			Member mem = mbrMap.get(key);
			mem.memberInfo();
		}
		
		
	}

}

package my.day09.c.string;

public class StringTestMain {

	public static void main(String[] args) {

		// === 1. charAt(int index) ===
		// "안녕하세요".charAt(2) ----> '하' 안녕하세요는 String이지만 char타입으로 '하'가 나옴
		//  0|1|2|3|4
		
		char ch = "안녕하세요".charAt(2);
		System.out.println("ch => "+ch);
		
		String str = "안녕하세요";
		String result = "";
		for(int i=str.length()-1; i>=0; i--) { // 43210
			result += str.charAt(i);
		}
		
		System.out.println(str+"\n"+result);
		// 요세하녕안
		
		// === 2. toCharArray() ===
		// "안녕하세요".toCharArray() ---> char 타입의 배열로 만들어줌
		//								---------------------
		//								| 안 | 녕 | 하 | 세 | 요 |
		//								---------------------
		//								  0   1   2   3   4
		char[] chArr = "안녕하세요".toCharArray();
		result = "";
		
		for(int i=chArr.length-1; i>=0; i--) {
			result += chArr[i];
		}
		
		System.out.println(result);
		// 요세하녕안
		
		// ☆★☆★=== 3. substring(int 시작index, int 끝index) ===☆★☆★
		// "안녕하세요".substring(1,4); // 1~4까지가 아니라 4 앞까지 즉, 1~3까지를 말함
		String substr = "안녕하세요".substring(1,4);
		System.out.println(substr);
		
		// === 4. substring(int 시작index) ===
		// "안녕하세요".substring(1); --> 1번 인덱스 "녕"부터 끝까지를 뽑아옴
		substr = "안녕하세요".substring(1);
		System.out.println(substr);
		
		String sosu = "2,3,5,7,11,";
		sosu = sosu.substring(0,sosu.length()-1);
		System.out.println(sosu);
		
		// === 5. "문자열".indexOf("찾을 문자열") ===
		// 		  "문자열"에서 최초로 나오는 "찾을 문자열"의 인덱스(int) 값을 알려줌
		int index = "시작하라 안녕하세요 건강하세요".indexOf("하");
					//012
		System.out.println(index); //'하'가 맨 처음 나오는 인덱스값이 나옴
		
		index = "시작하라 안녕하세요 건강하세요".indexOf("하세요");
				//012
		System.out.println(index);
		
		System.out.println("\n--------------------------------\n");
		
		String strMoney = "17,345,678";
		
		index = strMoney.indexOf(","); // 최초로 콤마가 나오는 index 방 == 2
		strMoney = strMoney.substring(0, index) + strMoney.substring(index+1); // "17"+"345,678"="17345,678"
		
		index = strMoney.indexOf(","); // 5
		strMoney = strMoney.substring(0, index) + strMoney.substring(index+1); // 17345678
		
		index = strMoney.indexOf(","); // -1 == 찾을 수 없다
		System.out.println(index);
		
		System.out.println(strMoney);
		
		System.out.println(Integer.parseInt(strMoney)+100);
		
		System.out.println("\n--------------------------------\n");
		
		String strMoney2 = "1,317,345,678";
		
		do {
			int idx = strMoney2.indexOf(",");
			
			if(idx == -1)
				break;
			else {
				strMoney2 = strMoney2.substring(0, idx) + strMoney2.substring(idx+1);
			}
		} while (true);
		
		System.out.println(strMoney2);
		
		System.out.println("\n--------------------------------\n");
		
		// === 6. "문자열".lastIndexOf("찾을 문자열") ===
		// 		  "문자열"에서 마지막으로 나오는 "찾을 문자열"의 인덱스(int) 값을 알려줌

		index = "시작하라 안녕하세요 건강하세요".lastIndexOf("하");
		System.out.println(index); 
		
		index = "시작하라 안녕하세요 건강하세요".lastIndexOf("하세요");
		System.out.println(index);
		
		sosu = "2,3,5,7,11,";
		sosu = sosu.substring(0, sosu.lastIndexOf(","));
		System.out.println(sosu); // 2,3,5,7,11
		
		System.out.println("\n1--------------------------------\n");
		// === 7. "문자열".split("구분자") ===
		// 		  "문자열"을 "구분자"로 잘라서 문자열 배열 타입으로 반환시켜줌
		String food = "파스타,국밥,볶음밥,고구마,계란말이";
		
		String[] foodArr = food.split(",");
		
		for(int i=0; i<foodArr.length; i++) {
			System.out.println(foodArr[i]);
		}
		
		System.out.println("\n2--------------------------------\n");
		food = "파스타	국밥	볶음밥	고구마	계란말이";
		
		foodArr = food.split("\t");
		
		for(int i=0; i<foodArr.length; i++) {
			System.out.println(foodArr[i]);
		}
		
		System.out.println("\n3--------------------------------\n");
		food = "파스타.국밥.볶음밥.고구마.계란말이";
		
		foodArr = food.split("\\."); // .은 구분자로 인식이 안되기 때문에 역슬래시 두개를 붙여서 확실하게 구분자로 정의
		
		for(int i=0; i<foodArr.length; i++) {
			System.out.println(foodArr[i]);
		}
		
		System.out.println("\n4--------------------------------\n");
		food = "파스타,국밥.볶음밥	고구마,계란말이";
		
		foodArr = food.split("\\,|\\.|\\t"); // 구분자 여러개 정의
		
		for(int i=0; i<foodArr.length; i++) {
			System.out.println(foodArr[i]);
		}
		
		System.out.println("\n--------------------------------\n");
		
		// === 8. String.join("구분자", 문자열 배열명) ===
		// 		    문자열배열을 "구분자"로 합쳐서 하나의 문자열로 반환
		
		String[] nameArr = {"한석규", "두석규", "세석규", "네석규", "오석규"};
		String names = String.join("-", nameArr);
		System.out.println(names); // 한석규-두석규-세석규-네석규-오석규
	
		System.out.println("\n--------------------------------\n");
		
		// === 9. "문자열".replaceAll("변경대상문자열", "새로 변경될 문자열") ===
		// 		  "문자열"에서 "변경대상 문자열"을 모두 "새로 변경될 문자열"로 교체해서 반환
		
		names = names.replaceAll("석규", "SK");
		System.out.println(names);
		
		System.out.println("\n--------------------------------\n");
		
		// === 10. "문자열".replaceFirst("변경대상문자열", "새로 변경될 문자열") ===
		// 		   "문자열"에서 "변경대상 문자열" 중 첫 번째만 "새로 변경될 문자열"로 교체해서 반환
		names = names.replaceFirst("SK", "스카이");
		System.out.println(names);
		
		System.out.println("\n=== 퀴즈 ===\n");
		String[] contents = {"안녕하세요", "건강하세요", "행복하세요 또봐요", "즐겁고 건강한 하루되세요"};
		/*
			"건강"이라는 단어 검색 시 
			건강하세요
			즐겁고 건강한 하루되세요 출력하기
		*/
		
		for(int i=0; i<contents.length; i++) {
			int idx = contents[i].indexOf("건강");
			if(idx != -1) {
				System.out.println(contents[i]);
			}
		}
			
		System.out.println("\n=== 퀴즈2 ===\n");
		/*
			"건강"이라는 단어로 시작하는 것만 출력하기
		 */
		
		for(int i=0; i<contents.length; i++) {
			int idx = contents[i].indexOf("건강");
			if(idx == 0) {
				System.out.println(contents[i]);
			}
		}
	
		// 또는 아래와 같이 할 수 있습니다링
		
		System.out.println("\n▼다른방법------------------------\n");
		
		// === 11. "문자열".startsWith("찾고자하는 문자열") ===
		//		   "문자열"에서 "찾고자하는 문자열"이 맨 처음 나오면 true를 반환
		//		      찾고자하는 문자열이 있든없든 처음에 없으면 false를 반환
		
		/*
			"건강"이라는 단어로 시작하는 것만 출력하기
		 */
		
		for(int i=0; i<contents.length; i++) {
			boolean bool = contents[i].startsWith("건강");
			if(bool)
				System.out.println(contents[i]);
		}
		
		
		System.out.println("\n-------------------------------\n");
		// "하세요" 라는 단어로 끝나는 것만 출력하기
		for(int i=0; i<contents.length; i++) {
			if(contents[i].endsWith("하세요"))
				System.out.println(contents[i]);
		}
		
		System.out.println("\n--------------------------------\n");
		// === 12. "문자열".endsWith("찾고자하는 문자열") ===
		//		   "문자열"에서 "찾고자하는 문자열"이 맨 마지막에 나오면 true를 반환
		//		        찾고자하는 문자열이 있든없든 맨 마지막에 없으면 false를 반환
		for(int i=0; i<contents.length; i++) {
			boolean bool = contents[i].endsWith("하세요");
			if(bool)
				System.out.println(contents[i]);
		}
		
		String str2 = "My name is JIWON 입니다.";
		System.out.println("\n--------------------------------\n");
		// === 13. "문자열".toUpperCase() ===
		//		   "문자열"에서 소문자가 있으면 모두 대문자로 변경해서 반환
		System.out.println(str2.toUpperCase());
		
		System.out.println("\n--------------------------------\n");
		// === 14. "문자열".toLowerCase() ===
		//		   "문자열"에서 대문자가 있으면 모두 소문자로 변경해서 반환
		System.out.println(str2.toLowerCase());
		
		System.out.println("\n--------------------------------\n");
		// === 15. "문자열".equals("비교대상 문자열"); ===
		// 		   "문자열"과 "비교대상 문자열"의 값이 일치하면 true를 반환
		// 		   "문자열"과 "비교대상 문자열"의 값이 일치하지 않으면 false를 반환 
		//		      대소문자를 반드시 검토
		String str3 = "koreA";
		if(str3.equals("koreA"))
			System.out.println("koreA를 입력하셨군요? :-)");
		else
			System.out.println("koreA를 입력하지 않으셨습니다.");
		
		String str4 = null;
		/*
		if(str4.equals("Seoul")) // NullPointerException
			System.out.println("Seoul를 입력하셨군요? :-)");
		else
			System.out.println("Seoul를 입력하지 않으셨습니다.");
		*/
		if("Seoul".equals(str4))
		// 	▲먼저 써주기
			System.out.println("Seoul를 입력하셨군요? :-)");
		else
			System.out.println("Seoul를 입력하지 않으셨습니다.");
		
		
		System.out.println("\n--------------------------------\n");
		// === 16. "문자열".equalsIgnoreCase("비교대상 문자열"); ===
		// 		   "문자열"과 "비교대상 문자열"의 값이 대,소문자 관계없이 일치하면 true를 반환
		// 		   "문자열"과 "비교대상 문자열"의 값이 일치하지 않으면 false를 반환 
		
		str4 = "KoreA";
		if("koRea".equalsIgnoreCase(str4))
			System.out.println("koRea를 입력하셨군요.");
		else
			System.out.println("koRea를 입력하지 않으셨군요.");
		
		
		System.out.println("\n--------------------------------\n");
		// === 17. "문자열".trim() ===
		// 		   "문자열".trim()은 "문자열"에 좌,우로 공백이 있을시 공백을 모두 제거하고 반환
		
		String str5 = "           수고 하셨습니다.     ";
		System.out.println("첫번째:"+str5+"내일 뵐게요 ^ㅁ^");
		System.out.println("첫번째:"+str5.trim()+"내일 뵐게요 ^ㅁ^");
		
		System.out.println("\n--------------------------------\n");
		// === 18. "문자열".isEmpty() ===
		// 		   "문자열"이 아무것도 없으면 true를 반환
		// 		   "문자열"이 뭔가 있으면 false를 반환
		System.out.println("".isEmpty()); // true
		System.out.println("abc".isEmpty()); // false
		System.out.println("     ".isEmpty()); // false
		System.out.println("     ".trim().isEmpty()); // true
		
		// === 참고 === //
		System.out.println("\n--------------------------------\n");
		
		int a = 123;
		double dbl = 4.567;
		String str6 = "이제 진짜 끝 집에가자!!!";
		
		System.out.printf("정수 a는 %d이고\n실수 dbl은 %f입니다.\n문자열 str6은 %s입니다.짐싸세요",a,dbl,str6);
		
	}
}

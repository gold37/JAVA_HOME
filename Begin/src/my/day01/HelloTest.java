/*
    == 자바 프로그래밍 언어의 특징 ==
   
   1. 운영체제(Operating System)에 독립적이다.
    -- 자바 언어가 나오기 전까지 기존 언어는 운영체제(Windows, Linux, Macintosh)에 종속적이었음.
	   왜냐하면 운영체제와 하드웨어 등이 이해 할 수 있도록 기존 언어는 각각 운영체제에 맞는 변환과정을 거쳐야 했었다.

    -- 하지만 자바 언어를 사용하여 만들어진 응용 프로그램는 운영체제와 하드웨어가 아닌 JVM 하고만 통신을 하고, 
	   응용 프로그램으로부터 전달받은 내용을 JVM이 해당 운영체제가 이해할 수 있도록 변환해서 전달해준다.
	   그러므로 운영체에 독립적이다.

       자바  <==> 운영체제 (독립적 관계)
       자바가상머신(Java Virtual Machine)  <==> 운영체제 (종속적 관계)

      [기존 언어] <==> [운영체제, 하드웨어]
      [자바 언어] <==> [JVM] <==> [운영체제, 하드웨어] 

    -> 즉, 자바는 운영체제를 고려하지 않고, 코드를 작성하며 JVM이 이를 각 운영체제에 맞게 변환시켜준다.
	  (그러므로 Windows 기반에서 작성한 자바소스(.java)를 다른 운영체제 Linux 등에서도 그대로 사용가능하다)


   .java파일 -> 사람이 읽을 수 있는 text로 이루어짐.
   .class파일 -> .java 파일을 컴파일 한 후 생성되는 파일로서 이것은 bytecode로 이루어져 있으며, 
                JVM이 이 .class파일을 각 운영체제(Window, Linux, Macintosh)에 맞는 기계어로 변환해주고 운영체제에 전달하여 실행시켜줌.

   .java 파일 (사람이 읽을 수 있는 text언어) ==> (컴파일 javac.exe) ==> Hello.class생성 (bytecode로 이루어짐) ==> (실행 java.exe(JVM)) ==> "Hello World~~~" 출력


  2. 자동으로 메모리 관리를 한다.
   -- C++은 메모리 관리를 위해 개발자가 직접 코드를 작성해야 하지만, 
      자바는 개발자가 메모리에 직접 접근할 수 없으며 자바가 직접 메모리를 관리하도록 되어있다. 
	  객체를 생성할 때 자동적으로 메모리 영역을 찾아서 할당해주고, 객체 사용이 완료되면 Garbage Collector를 실행시켜 자동적으로 사용하지 않는 객체를 제거해준다. 
	  따라서 개발자는 메모리 관리에 신경쓰지 않고, 코딩에만 집중하면 된다.

  3. 네트워크와 분산환경을 지원한다.
  -- 자바는 인터넷과 대규모 분산환경을 염두에 두고 만들어진 언어이므로 풍부하고 다양한 네트워크 프로그래밍 라이브러리(Java API)를 사용하여 비교적 짧은 시간에 
     네트워크 관련 프로그램을 쉽게 개발할 수 있도록 지원해준다.

  4. 멀티쓰레드를 지원한다.
  -- 자바는 쓰레드 생성 및 제어와 관련된 라이브러리 API를 제공하고 있기 때문에 실행되는 운영체제에 상관없이 멀티쓰레드를 쉽게 구현할 수 있게 해준다.

  5. 이식성이 높다.
  -- 이식성이란 서로 다른 실행 환경을 가진 시스템 간에 프로그램을 옮겨 실행할 수 있는 것을 말한다. 
     자바 언어로 개발된 프로그램은 소스 파일을 수정하지 않아도, 자바 실행 환경(JRE)이 설치되어 있는 모든 운영 체제에서 실행 가능하다.

  6. 사용하기 쉬운 언어이다.
  -- 배우기 쉽고 어려운 언어가 아니다.

*/

package my.day01;

//import java.lang.System;


import java.util.*;

public class HelloTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("hello world~~~~~~");
		//한 줄 주석문
		/*
			여러줄 
			주석문
		 */
		
		Date now = new Date();
		System.out.println("현재 시간:"+ now);
		
		String name = "홍길동";
		System.out.println(name);
		
		System.out.println("i'm hungry ㅠ3ㅠ..");
		
		System.out.println("=== Escape 문자 알아보기 ===");
		
		System.out.println("어제는 \"자바\" 첫 날 이군요");
		System.out.println("오늘은 'JAVA' 두 번째 날 이군요.");
		System.out.println("오늘은 \'JAVA\' 두 번째 날 이군요.");
		
		System.out.println("경로는 C:\\myjava\\HelloExam.java입니다.");
		
		System.out.println("국어\t영어\t\t수학");
		
		System.out.println("안녕하숑 \n만나서 방갑슴미다 ^ㅁ^");
		
		System.out.println("Eclipse를 사용 중입니다.\r\n재밌네요 하하하하하하하");
		
		System.out.println("sysout 그만하고싶댜 다른거 알려줘요 흐하하");
		System.out.println("캐리지 리턴!!!!!!!!!\r");
		
		
		System.out.println("\t김소월 님의 \'진달래\'\n"
				+ "나보기가 \"역겨워 가실때\" 에는 \n"
				+ "\tC:\\시집\\진달래.hwp");
		

	}

}

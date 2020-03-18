package my.day13.f.exception;

public class ExceptionTest1 {
	public static void main(String[] args) {
		
		String[] subjectArr = {"자바", "오라클", "JSP"};
		
		/*
		// 1. ArrayIndexOutOfBoundsException
		// ===> 배열의 크기가 오버가 되어지면 발생하는 익셉션
		
		for(int i=0; i<=subjectArr.length; i++) {
			System.out.println(subjectArr[i]);
		}
		*/
		try {
			for(int i=0; i<=subjectArr.length; i++) {
				System.out.println(subjectArr[i]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println(">> 배열의 인덱스 범위가 초과되었습니다.");
			System.out.println(e.getMessage()); // e.getMessage()은 오류 메시지를 알려주는 것
			//e.printStackTrace(); // 어디가 오류인지를 추적해서 화면에 찍어줌
		}
		
		
		System.out.println("\n---------------------------------------------\n");
		
		// 2. ArithmeticException
		// ===> 분모에 0이 들어가는 경우에 발생하는 익셉션
		
		try {
			int no = 10;
			
			for(int i=2; i>=0; i--) {
				System.out.println(no/i); // 10/2, 10/1, 10/0
			}
		}catch(ArithmeticException e) {
			System.out.println(">> 분모에는 0이 올 수 없습니다. \n");
		}
		
		System.out.println("\n---------------------------------------------\n");
		
		int[] noArr = {10,20,30};
		
		try {
			for(int i=3; i>=0; i--) {
				int val = noArr[i]/i; // noArr[3]/3, 30/2, 20/1, 10/0
				System.out.println(val);
			}
		} catch(ArrayIndexOutOfBoundsException e) {
			
			System.out.println(">> 배열의 인덱스 범위가 초과되었습니다.");
			
		} catch(ArithmeticException e) {
			
			System.out.println(">> 분모에는 0이 올 수 없습니다. \n");
			
		}
		
		finally {
			
			System.out.println("finally는 오류가 발생하든 안하든 관계 없이 무조건 실행하는 부분입니다.");
		}
		
		System.out.println("\n---------------------------------------------\n");
		
		int[] noArr2 = {10,20,30};
		
		try {
			for(int i=3; i>=0; i--) {
				int val = noArr2[i]/i; // noArr2[3]/3, 30/2, 20/1, 10/0
				System.out.println(val);
			}
		} catch(ArrayIndexOutOfBoundsException | ArithmeticException e) {
											// ▲ jdk 1.7 이후로만 병합 가능
			System.out.println("오류메세지: "+e.getMessage());
			//e.printStackTrace(); 
		}		
		finally {
			
			System.out.println("finally는 오류가 발생하든 안하든 관계 없이 무조건 실행하는 부분입니다.");
		}
		
		
		
		
		
		
		
		
		System.out.println("\n-----------------------퀴즈----------------------\n");
		
		
		int[] noArr3 = {10,20,30};

		for(int i=3; i>=0; i--) {
			try {
				int val = noArr3[i]/i; // noArr2[3]/3, 30/2, 20/1, 10/0
				System.out.println(val);
		} catch(ArrayIndexOutOfBoundsException | ArithmeticException e) {
											// ▲ jdk 1.7 이후로만 병합 가능
			System.out.println("오류메세지: "+e.getMessage());
		} finally {
			if(i==0) {
				System.out.println("finally는 오류가 발생하든 안하든 관계 없이 무조건 실행하는 부분입니다.");
				}
			}
		} 
		
		
		
		System.out.println("\n---------------------------------------------\n");
		
		String[] strArr = {"10","이십","30"};

		for(int i=3; i>=0; i--) {
			try {
				int val = Integer.parseInt(strArr[i])/i; // noArr2[3]/3, 30/2, 20/1, 10/0
				System.out.println(val);
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("오류메세지: 배열의 인덱스 번호"+e.getMessage()+"이(가) 존재하지 않습니다.");
		} catch(ArithmeticException e) {
			System.out.println("오류메세지: 부모를 0으로 할 수 없습니다.");
		} catch(Exception e) { // 모든 익셉션을 받음
			System.out.println("오류메세지: "+e.getMessage());
		}
			
		finally {
			if(i==0) {
				System.out.println("finally는 오류가 발생하든 안하든 관계 없이 무조건 실행하는 부분입니다.");
				}
			}
		} 
		
		
		System.out.println("\n---------------------------------------------\n");
		
		String[] strArr2 = {"10","이십","30"};

		for(int i=3; i>=0; i--) {
			try {
				int val = Integer.parseInt(strArr2[i])/i; // strArr2[3]/3, 30/2, 20/1, 10/0
				System.out.println(val);
		} catch(Exception e) { // Exception e를 하면 밑에 있는 익셉션을 다 처리해버려서 밑에 있는 익셉션에 도달 불가 빨간줄이 뜸
			System.out.println("오류메세지: "+e.getMessage());
		} catch(ArrayIndexOutOfBoundsException e) { // 오류가 발생하는 원인은 위에서 Exception e로 모든 익셉션 처리를 다 해주기 때문에 도달할 수 없으므로 오류가 발생함
			System.out.println("오류메세지: 배열의 인덱스 번호"+e.getMessage()+"이(가) 존재하지 않습니다.");
		} catch(ArithmeticException e) {
			System.out.println("오류메세지: 부모를 0으로 할 수 없습니다.");
		}
			
		finally {
			if(i==0) {
				System.out.println("finally는 오류가 발생하든 안하든 관계 없이 무조건 실행하는 부분입니다.");
				}
			}
		} 

		System.out.println("\n>>> 프로그램 종료 <<<");
		
	}
}

//일부러 만든 에러입니다
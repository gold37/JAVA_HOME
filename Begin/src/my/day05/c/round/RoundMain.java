package my.day05.c.round;

public class RoundMain {

	public static void main(String[] args) {
		//반올림에 대해서 알아본다.
		double db1=93.45678, db2=86.87654;
		
		System.out.println("===반올림하기 전===");
		System.out.println("db1=>"+db1+", db2 =>"+db2);
		
		System.out.println("\n===반올림한 후===");
		System.out.println("db1=>"+Math.round(db1)+", db2 =>"+Math.round(db2));
		// Math.round(실수) ==> 입력한 실수의 정수 일의자리까지만 보여주고 나머지 소수부는 반올림하면서 삭제된다. 
		//                 ==> 93.45678    소수부 첫번째 자리는 4이므로 반올림이 안된다. 즉, 93 이 된다.
		//                 ==> 86.87654    소수부 첫번째 자리는 8이므로 반올림이 된다. 즉, 87 이 된다.
	
		
		
		// == 특정 소수부 자리에서 반올림을 하고자 한다. ==
		// db1 => 93.45678  ==> 93.5
		// db2 => 86.87654  ==> 86.9
		// .을 옮겨주기 위해 x10을 해줌									 //x10을 해줬기 때문에 다시 나누기 10을 해줌		
		// 93.45678 * 10 ==> 934.5678 ==> Math.round(934.5678) ==> 935 / 10.0 ==> 93.5
		// 86.87654 * 10 ==> 868.7654 ==> Math.round(868.7654) ==> 869 / 10.0 ==> 86.9
	
		System.out.println("\n===소수부 첫 째 자리까지 나타내어주는 반올림===");
		System.out.println("db1=>"+Math.round(db1*10)/10.0+", db2 =>"+Math.round(db2*10)/10.0);
	
		System.out.println("\n===소수부 둘 째 자리까지 나타내어주는 반올림===");
		System.out.println("db1=>"+Math.round(db1*100)/100.0+", db2 =>"+Math.round(db2*100)/100.0);
		
	}

}

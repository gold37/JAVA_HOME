package jdbc.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MyUtil {
	
	// 필요한 메소드 만들기
	public static String getDay(int n) {
	
		// 현재 날짜와 시간을 얻어옴
		Calendar currentDate = Calendar.getInstance();
		currentDate.add(Calendar.DATE, n); // 현재 날짜에서 들어온 일 수 만큼 더해줌
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return dateFormat.format(currentDate.getTime()); // 이 형식대로 보여라. 결과가 String타입으로 나옴
	
	}
	
	
}

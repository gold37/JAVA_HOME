package my.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {

	// 현재 시각을 알려주는 static 메소드
	
	public static void currentTime() { //메소드, 행위
		Date now = new Date();//현재 시각
		
		SimpleDateFormat sdfrmt = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String result = sdfrmt.format(now);
		System.out.println(">>현재시각: " + result);

	}
}

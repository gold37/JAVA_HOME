package ch01;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

//** 처음 연결 테스트 파일 ** //
public class Example01 {
	public static void main(String[] args) {

		// 크롬드라이버가 위치한 경로 및 드라이버파일 위치를 지정해야 한다. -- 필수임!!!! 
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 타킷 사이트 주소 지정 ==> get()으로 시작해서 close()로 닫아야 한다.
		driver.get("http://www.naver.com");
		
		driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 
	}
}

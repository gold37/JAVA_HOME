package ch01;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Example02 {
	public static void main(String[] args) {
			
			// 크롬드라이버가 위치한 경로 및 드라이버파일 위치를 지정해야 한다. -- 필수임!!!! 
			System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
			WebDriver driver = new ChromeDriver();
			
			// 타킷 사이트 주소 지정 ==> get()으로 시작해서 close()로 닫아야 한다.
			driver.get("http://www.naver.com");

			// http://www.naver.com 에 가서 개발자도구(F12)를 연다.
			// 개발자도구의 좌측 상단에 있는 화살표 모양(inspect)를 클릭하여 네이버의 검색입력란에 클릭하여
			// input 태그의 id 값이 "query" 인 것을 알아왔다.

			WebElement inputSearch = driver.findElement(By.id("query")); // 네이버 메인화면에 F12해서 코드보면 검색창 id= "query"라 나옴.
			// id가 "query"인 엘리먼트 (요소, 태그)를 찾는 것이다.
			
			
			
			inputSearch.sendKeys("KH정보교육원"); // 검색어를 "KH정보교육원"으로 넣어주는 것이다.
			
			WebElement buttonSearch = driver.findElement(By.id("search_btn")); 
			/* WebElement는 웹상의 태그를 의미 */
			// 개발자도구에서 네이버의 검색버튼에 해당하는 id값을 알아오는데 그 id값이 "search_btn" 인 엘리먼트(요소)를 찾는 것이다.
			
			buttonSearch.click(); // 버튼을 클릭하라는 말이다.
			
			
			// driver.close(); // 꼭 해주어야 한다. 
			// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다
		
		
	}
}

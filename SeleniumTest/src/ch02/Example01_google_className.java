package ch02;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

// *** 클래스로 앨러먼트를 찾는 예제 - www.google.com 검색 사이트 *** // 
public class Example01_google_className {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.google.com/");
		
		List<WebElement> elementList = driver.findElements(By.className("gLFyf"));
		// 클래스 명이 gLFyf(구글 검색창 class 이름)으로 된 엘리먼트를 잡는다. 
		// 1
		
		System.out.println(elementList.size()); // List 크기 알아오기 
		// 클래스명으로 잡아온 것이 몇 개 있는지 확인해본다.
		
		WebElement inputSearch = elementList.get(0);// List에 있는 것 꺼내오기 get, 넣기 add
		// 		   ▲ 웬만하면 태그 명 써줌		▲ 한개밖에 없기때문에 0 쓰면 됨
		
		
		inputSearch.sendKeys("태연");
		// 검색어를 "태연"으로 넣어주는 것이다.
		
		
		WebElement inputSubmit = driver.findElement(By.name("btnK")); // check box같은 동일한 name이 많은 경우는 findElements해야됨
		
		inputSubmit.submit(); // 네이버는 click()이지만 구글은 type이 submit이기 때문에 submit()으로 해줘야됨
		// 전송
		
		
		
		// driver.close(); 
	}

}

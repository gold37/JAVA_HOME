package ch02;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

// *** 클래스로 앨러먼트를 찾는 예제 - www.google.com 검색 사이트 *** // 
public class Example02_google_className {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.google.com/");
		
		List<WebElement> elementList = driver.findElements(By.className("gsfi"));
		// 클래스 명이 gsfi(구글 검색창 class 이름)으로 된 엘리먼트를 잡는다. 
		// 2
		
		System.out.println(elementList.size()); // List 크기 알아오기 
		// 클래스명으로 잡아온 것이 몇 개 있는지 확인해본다.
		
		for(WebElement webelm :elementList) { // 확장 for문
			
			// System.out.println(webelm.getTagName()); // 요소의 태크 이름을 알아본다.
			// div, input
			
			if( "input".equalsIgnoreCase( webelm.getTagName() ) ) {
				webelm.sendKeys("아이린");
				// 검색어를 "아이린"으로 넣어줌
			}
			
		} // end of for ----------------------
		
		WebElement inputSubmit = driver.findElement(By.name("btnK")); 
		
		inputSubmit.submit(); // 전송		
		
		// driver.close(); 
	}

}

package ch02;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

// *** CSS selector로 앨러먼트를 찾는 예제 - www.google.com 검색 사이트 *** // 
public class Example03_google_cssSelector {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.google.com/");
		
		
		
		// CSS selector로 엘리먼트를 찾는것은
		// driver.findElement(By.cssSelector(cssSelector)); 이다.
		
		String selector = "#tsf > div:nth-child(2) > div.A8SBwf > div.RNNXgb > div > div.a4bIc > input";
		WebElement inputSearch = driver.findElement(By.cssSelector(selector)); // 구글 검색태그
		inputSearch.sendKeys("한소희");
		
		selector = "#tsf > div:nth-child(2) > div.A8SBwf > div.FPdoLc.tfB0Bf > center > input.gNO89b";
		WebElement inputSubmit = driver.findElement(By.cssSelector(selector));
		inputSubmit.submit(); // 전송		
		
		// driver.close(); 
	}

}

package ch02;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import idpw.MyIDPW;

// *** CSS selector로 앨러먼트를 찾는 예제 - www.naver.com 검색 사이트 *** // 
public class Example05_naver_cssSelector {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.naver.com/");
		
		String selector = "#account > a";
		WebElement divLogin = driver.findElement(By.cssSelector(selector));
		
		divLogin.click();
		
		selector = "#id";
		WebElement inputID = driver.findElement(By.cssSelector(selector));
		inputID.sendKeys(MyIDPW.naverid);
		
		selector = "#pw";
		WebElement divPW = driver.findElement(By.cssSelector(selector));
		divPW.sendKeys(MyIDPW.naverpw);
		
		selector = "#log\\.login";
		WebElement inputLogin = driver.findElement(By.cssSelector(selector));
		inputLogin.click();
		
		
		
		// driver.close(); 
	}

}

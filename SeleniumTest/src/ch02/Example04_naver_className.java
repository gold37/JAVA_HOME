package ch02;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import idpw.MyIDPW;

// *** 클래스로 앨러먼트를 찾는 예제 - www.naver.com 검색 사이트 *** // 
public class Example04_naver_className {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.naver.com/");
		
		WebElement divLogin = driver.findElement(By.className("sc_login"));
		
		divLogin.click();
		
		
		WebElement inputID = driver.findElement(By.id("id"));
		inputID.sendKeys(MyIDPW.naverid);
		
		WebElement divPW = driver.findElement(By.id("pw"));
		divPW.sendKeys(MyIDPW.naverpw);
		
		
		WebElement inputLogin = driver.findElement(By.id("log.login"));
		inputLogin.click();
		
		
		
		// driver.close(); 
	}

}

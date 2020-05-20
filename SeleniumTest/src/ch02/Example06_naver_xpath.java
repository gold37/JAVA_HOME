package ch02;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import idpw.MyIDPW;

// *** CSS selector로 앨러먼트를 찾는 예제 - www.naver.com 검색 사이트 *** // 
public class Example06_naver_xpath {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		driver.get("https://www.naver.com/");
		
		
		// NAVER 로그인 버튼의 xpath를 알아온다.
		String xpath = "//*[@id=\"account\"]/a";
		WebElement divLogin = driver.findElement(By.xpath(xpath));
		divLogin.click();
		
		xpath = "//*[@id=\"id\"]";
		WebElement inputID = driver.findElement(By.xpath(xpath));
		inputID.sendKeys(MyIDPW.naverid);
		
		xpath = "//*[@id=\"pw\"]";
		WebElement divPW = driver.findElement(By.xpath(xpath));
		divPW.sendKeys(MyIDPW.naverpw);
		
		xpath = "//*[@id=\"log.login\"]";
		WebElement inputLogin = driver.findElement(By.xpath(xpath));
		inputLogin.click();
		
		
		
		// driver.close(); 
	}

}

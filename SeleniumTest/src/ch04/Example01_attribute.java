package ch04;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Example01_attribute {

	public static void main(String[] args) {
		
		// 웹 브라우저 chrome 쓰겠다.
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 목적지 사이트 주소 지정. get()으로 시작해서 close()로 닫아야 한다.
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/attribute/test1.html");
		
		String xpath = "/html/body/input";
		WebElement elmt = driver.findElement(By.xpath(xpath));
		System.out.println(elmt.getAttribute("type")); // type 알아오기. text
		System.out.println(elmt.getAttribute("value")); // value 값 알아오기. 배고파요
		
		
		xpath = "/html/body/div";
		elmt = driver.findElement(By.xpath(xpath));		
		System.out.println(elmt.getText()); // 태그안에 있는 글자를 읽어온다.
		
		// driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 		
		
	}

}

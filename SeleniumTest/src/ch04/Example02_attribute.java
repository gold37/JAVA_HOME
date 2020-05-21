package ch04;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Example02_attribute {

	public static void main(String[] args) {
		
		// 웹 브라우저 chrome 쓰겠다.
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 목적지 사이트 주소 지정. get()으로 시작해서 close()로 닫아야 한다.
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/attribute/test2.html");
		
		String cssSelector = "body > div > input[type=text]";
		WebElement elmt = driver.findElement(By.cssSelector(cssSelector));
		System.out.println(elmt.getAttribute("type")); // type 알아오기. text
		System.out.println(elmt.getAttribute("value")); // value 값 알아오기. 배고파요
		
		System.out.println("---------------------------------------------------------------");
		
		
		String tagName = "div"; 
		elmt = driver.findElement(By.tagName(tagName)); // findElements라면 배열이라서 div 2개 다 나오지만, 	findElement로 적어줬기 때문에 제일 첫번째 div 태그만 잡아준다.	
		System.out.println(elmt.getText()); // 태그안에 있는 글자를 읽어온다.

		
		
		System.out.println("---------------------------------------------------------------");
		
		
		String html = elmt.getAttribute("innerHTML");
		System.out.println(html); // 태그도 보여줌

		
		
		System.out.println("---------------------------------------------------------------");
		
		
		String text = elmt.getAttribute("innerText");
		System.out.println(text); // 글자만 보여줌
		
		
		System.out.println("---------------------------------------------------------------");
		
		// [퀴즈] 타깃에 있는 모든 html 소스를 읽어서 콘솔에 출력하세요 
		tagName = "html"; 
		elmt = driver.findElement(By.tagName(tagName)); 
		html = elmt.getAttribute("innerHTML");
		System.out.println(html);
		
		/*
			String test = driver.getPageSource();
			System.out.println(test);
		 */
		
		
		// driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 		
		
	}

}

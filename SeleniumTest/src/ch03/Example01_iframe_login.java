package ch03;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Example01_iframe_login {

	public static void main(String[] args) {
		
		// 웹 브라우저 chrome 쓰겠다.
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 목적지 사이트 주소 지정. get()으로 시작해서 close()로 닫아야 한다.
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/iframeLogin/login.html");
		
		driver.switchTo().frame("subIframe"); // 실행하면 아이디와 암호가 적힘
		// frame을 name이 subIframe인 곳으로 바꿔준다. 기본은 parentFrame이다. 
		
		WebElement inputId = driver.findElement(By.id("id"));
		
		// Exception in thread "main" org.openqa.selenium.NoSuchElementException: no such element: Unable to locate element: {"method":"css selector","selector":"#id"}
		
		WebElement inputPassword = driver.findElement(By.id("password"));
		
		inputId.sendKeys("leess");
		inputPassword.sendKeys("qwer1234$");
		
		
		// 로그인을 위한 자바스크립트 함수를 호출한다.
		/* button이 onclick으로 함수를 사용하고 있음 */
		JavascriptExecutor jsexec = (JavascriptExecutor)driver;
		// 							▲ 자바스크립트를 실행하라는 의미 ▲ 현재 보여지고 있는 웹 창 
		jsexec.executeScript("fnLogin()");
		// ▲ loginInput.html
		
		// 다시 부모 프레임으로 전환한다.
		driver.switchTo().parentFrame(); // parentFrame 으로 바꿈
		
		WebElement pTag = driver.findElement(By.tagName("p")); // 전환됐는지 확인
		String ptext = pTag.getText();// p태그에 있는 글자 읽어옴
		
		System.out.println(ptext);
		// 로그인이 성공되면 naver.html 페이지로 이동한다.
		
		// driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 		
		
	}

}

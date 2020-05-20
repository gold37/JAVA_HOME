package ch02;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import idpw.MyIDPW;

// *** CSS selector 로 엘리먼트를 찾는 예제 - www.interpark.com 사이트에서 로그인 하기 *** //
// iframe 안으로 들어가서 엘리먼트를 찾는 것
public class Example08_interpark_cssSelector {

	public static void main(String[] args) {
		// 크롬드라이버가 위치한 경로 및 드라이버파일 위치를 지정해야 한다. -- 필수임!!!! 
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 타킷 사이트 주소 지정 ==> get()으로 시작해서 close()로 닫아야 한다.
		driver.get("https://www.interpark.com");
		
		// CSS selector 로 엘리먼트를 찾는 것은 
		// driver.findElement(By.cssSelector(css셀렉터)); 이다.
		
		// F12 개발자 도구를 열어서 Elements 를 통해 인터파크 로그인 앵커의 CSS selector 를 알아온다. 
		String selector = "#gateway > div > div.gatewayRight > div > ul > li.gatewayLogin > a";
		WebElement loginAnchor = driver.findElement(By.cssSelector(selector)); 
		loginAnchor.click();
		
		// <iframe name = "subIframe" ..... />에 들어온 것이므로 
		// 이 iframe 태그 속에 들어가서 로그인 관련 엘리먼트를 찾아야 한다.
		driver.switchTo().frame("subIframe");
		// 인터파크 iframe 태그의 name 값이 "subIframe"으로 되어있다.
		// 즉, 이 명령은 iframe 태그의 name 값이 "subIframe"으로 되어있는 그 안으로 들어가라고 지정해주는 것이다.
		
		WebElement inputId = driver.findElement(By.id("userId"));
		WebElement inputPw = driver.findElement(By.id("userPwd"));
		
		inputId.sendKeys(MyIDPW.interparkid);
		inputPw.sendKeys(MyIDPW.interparkpw);
		
		WebElement inputBtn = driver.findElement(By.id("btn_login"));
		// 로그인 버튼이다. 
		
		inputBtn.click();  
				
		// driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 		
		
	}

}
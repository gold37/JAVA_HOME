package ch04;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class Example03_selectTag {

	public static void main(String[] args) {
		
		// 웹 브라우저 chrome 쓰겠다.
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 목적지 사이트 주소 지정. get()으로 시작해서 close()로 닫아야 한다.
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/selectTagTest/select_test.html");
			
		
		// WebElement 자료형에는 select 의 option 값을 선택하는 기능이 없으므로 
		// Select 생성자를 이용해 select 형으로 변경한 후, selectByValue 값을 통해 value 값을 선택한다.
		/*
			=== 아래는 타깃 HTML 상의 소스 임 ===
			<select class="form-control" name="age" id="age">
		        <option value="">선택</option>
				<option value="10">10대</option>
				<option value="20">20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대</option>
				<option value="70">70대</option>
	      	</select>
			
		 */
		
		// id를 이용해서 타깃 웹페이지 화면에 보이는 값을 "20대"를 선택하도록 하겠다.
		Select sel = new Select(driver.findElement(By.id("age")));
		sel.selectByIndex(2); // 0-선택 1-10대 2-20대
		// 또는
		//sel.selectByValue("20");
		// 또는
		//sel.selectByVisibleText("20");
		
		// driver.close(); // 꼭 해주어야 한다. 
		// 브라우저창이 열린 뒤 닫히므로 우리는 안 닫게하려고 주석처리를 할 뿐이다. 		
		
	}

}

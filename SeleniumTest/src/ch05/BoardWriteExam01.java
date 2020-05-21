/*
		1. http://localhost:9090/JqueryStudy/seleniumtest/boardTest/loginInput.html 접속
		2. 아이디와 비밀번호는 test/test 입력
		3. 로그인 onClick 이벤트의 fnLogin() 함수 호출
		4. 페이지 이동 후 "E-CLASS 훈련생도 평가" 제목이 표시될 때까지 명시적 대기
		5. 자바스크립트 코드를 이용해서 게시판 페이지로 이동
		6. "E-CLASS 우리반 게시판" 제목이 표시될 때까지 명시적 대기
		7.  게시판글쓰기시작 버튼의 클릭시 수행할 함수 실행하기(버튼 클릭하지 않음)
		8.  "글제목 - 안녕하세요? 이순신 인사드립니다^^"
		9. "글내용 - iframe 으로 되어진 곳에 글내용을 적어 봅니다. ㅎㅎㅎ"
		10. 작성완료버튼 클릭시 실행할 함수 실행하기
 */

package ch05;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BoardWriteExam01 {

	public static void main(String[] args) {
		// 웹 브라우저 chrome 쓰겠다.
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 특정 Element가 나타날때까지 기다려주는 방식인 Explicitly Wait(명시적 대기)를 사용한다.
		WebDriverWait wait = new WebDriverWait(driver, 10);
		// 최대 10초 동안 기다리는 객체 생성
		
		// 목적지 사이트 주소 지정. get()으로 시작해서 close()로 닫아야 한다.
		// 1. 접속
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/boardTest/loginInput.html");
		
		
		// 2. 아이디 비번 생성
		WebElement inputId = driver.findElement(By.id("id"));
		WebElement inputPw = driver.findElement(By.id("password"));
		
		inputId.sendKeys("test");
		inputPw.sendKeys("test");
		
		// 3. 로그인 함수 호출
		JavascriptExecutor jsexec = (JavascriptExecutor)driver;
		jsexec.executeScript("fnLogin()");

		
		// 4. 대기 
		wait.until(ExpectedConditions.titleContains("E-CLASS 훈련생도 평가")); // title 태그 내용속에 훈련생도 평가 글자가 들어있는 페이지가 나올 때 까지 기다리세요
		
		// 5. 게시판 이동
		jsexec.executeScript("javascript:location.href='currBoard.html'");
		
		// 6. 대기
		wait.until(ExpectedConditions.titleContains("E-CLASS 우리반 게시판"));
		
		// 7. 게시판 글쓰기 버튼 클릭시 수행할 함수 호출
		jsexec.executeScript("fnWriteForm()");

		// 8. 글 제목 작성
		// 명시적 대기. 엘리먼트의 id가 title인 것이 나올때가지 대기하도록 한다.
		wait.until(ExpectedConditions.elementToBeClickable(By.id("title")));
		
		WebElement inputTitle = driver.findElement(By.id("title"));
		inputTitle.sendKeys("글제목 - 안녕하세요? ㅇㅇㅇ 인사드립니다 ^^");
		
		// driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);		
		// 무조건 5초간 대기 (암시적 대기 implicitly Wait)
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		inputTitle.clear(); // 5초 뒤에 글 내용을 비움
		
		
		// 9. 글 내용 작성
		driver.switchTo().frame("iframeMsg");
		
		List<WebElement> elmtList = driver.findElements(By.className("areaMsg"));
		
		System.out.println(elmtList.size());
		// 1
		
		WebElement txtArea = elmtList.get(0);
		txtArea.sendKeys("글내용 - iframe 으로 되어진 곳에 글내용을 적어 봅니다. ㅎㅎㅎ");
		
		// 10. 작성완료 클릭시 수행할 함수 호출
		driver.switchTo().parentFrame(); // 글 내용작성하고 글내용 글씨있는 곳으로 나와라
		jsexec.executeScript("javascript:fnRegister()");
		
		// alert 창이 뜰 때까지 명시적 대기
		wait.until(ExpectedConditions.alertIsPresent());
		driver.switchTo().alert().accept(); // alert() 창의 확인 클릭을 받아들이는 것
		
		//driver.close();
		
	}

}

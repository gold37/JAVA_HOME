package ch06Quiz;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class BoardWriteExam02 {

	public static void main(String[] args) {

		// 크롬드라이버가 위치한 경로 및 드라이버파일 위치를 지정해야 한다. -- 필수임!!!! 
		System.setProperty("webdriver.chrome.driver", "C:/seleniumlib/chromedriver.exe"); 
		WebDriver driver = new ChromeDriver();
		
		// 특정 Element 가 나타날때 까지 기다려주는 방식인 Explicitly Wait(명시적대기)를 사용한다.
		WebDriverWait wait = new WebDriverWait(driver, 10); // 최대 10초 동안 기다리는 객체 생성 
		
		// 타킷 사이트 주소 지정 ==> get()으로 시작해서 close()로 닫아야 한다.
		// 1. http://localhost:9090/JqueryStudy/seleniumtest/boardTest2/loginInput.html 
		driver.get("http://localhost:9090/JqueryStudy/seleniumtest/boardTest2/loginInput.html");
		
		// 자바스크립트 함수를 호출하는 객체
		JavascriptExecutor jsexec = (JavascriptExecutor)driver;
		
		List<Member> memberList = new ArrayList<Member>();
		memberList.add(new Member("leess","qwer1234$","이순신"));
		memberList.add(new Member("emojh","abcd1234$","엄정화"));
		memberList.add(new Member("hongkd","qwer1234#","홍길동"));
		
		for(Member mbr : memberList) {
		
			// 2. 아이디와 비밀번호는 test/test 입력
			WebElement inputId = driver.findElement(By.id("id"));
			WebElement inputPassword = driver.findElement(By.id("password"));
			
			inputId.clear(); // ID 지우기
			inputId.sendKeys(mbr.getId());
			
			inputPassword.clear(); // PASSWORD 지우기
			inputPassword.sendKeys(mbr.getPassword());
			
			// 3. 로그인 onClick 이벤트의 fnLogin() 함수 호출
			jsexec.executeScript("fnLogin()");
			
			// 4. 페이지 이동 후 "E-CLASS 훈련생도 평가" 제목이 표시될 때까지 명시적 대기
			wait.until(ExpectedConditions.titleContains("E-CLASS 훈련생도 평가"));
			// 보여지는 페이지의 title 태그 내용속에 "E-CLASS 훈련생도 평가" 라는 글자가 들어있는 페이지가 나올때 까지 기다려라는 말이다. 
			
			// 5. 자바스크립트 코드를 이용해서 게시판 페이지로 이동 
			jsexec.executeScript("javascript:location.href='currBoard.html'");
			
			// 6. "E-CLASS 우리반 게시판" 제목이 표시될 때까지 명시적 대기
			wait.until(ExpectedConditions.titleContains("E-CLASS 우리반 게시판"));
			
			// 7. 게시판글쓰기시작 버튼의 클릭시 수행할 함수 실행하기(버튼 클릭하지 않음)
			jsexec.executeScript("fnWriteForm()");
			
			// 8. "글제목 - 안녕하세요? 이순신 인사드립니다^^" 
			// 명시적 대기. 엘리먼트의 id 가 title 인 것이 나올때 까지 대기하도록 한다.
			wait.until(ExpectedConditions.elementToBeClickable(By.id("title")));
			
			WebElement inputTitle = driver.findElement(By.id("title"));
			inputTitle.clear();  // 글제목 내용 지우기
			inputTitle.sendKeys("글제목 - 안녕하세요? "+mbr.getName()+" 인사드립니다^^"); 
			
			// 9. "글내용 - iframe 으로 되어진 곳에 글내용을 적어 봅니다. ㅎㅎㅎ"
			driver.switchTo().frame("iframeMsg");
			
			List<WebElement> elmtList = driver.findElements(By.className("areaMsg"));
			
			System.out.println(elmtList.size());
			// 1 
			
			WebElement txtArea = elmtList.get(0);
			txtArea.clear();  // 글내용 지우기
			txtArea.sendKeys("글내용 - iframe 으로 되어진 곳에 글내용을 적어 봅니다. ㅎㅎㅎ");
			
			// 10. 작성완료버튼 클릭시 실행할 함수 실행하기
			driver.switchTo().parentFrame();
			jsexec.executeScript("javascript:fnRegister()");
			
			// alert 창이 들때까지 명시적 대기한다. 
			wait.until(ExpectedConditions.alertIsPresent());
			driver.switchTo().alert().accept(); // alert() 를 받아들이는 것이다. 즉, 확인 클릭이다.
		
			// **** 무작정(무조건) 2초간 대기(암시적 대기 implicitly wait) **** //
			try {
				Thread.sleep(2000);  // 2000 밀리초(== 5초)
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			// 11. 로그인 페이지로 이동하기
		    jsexec.executeScript("javascript:location.href='loginInput.html'");
			
		} // end of for------------------------
		
		driver.close();		

	}

}

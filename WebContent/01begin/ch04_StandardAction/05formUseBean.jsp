<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 얘만 적어주면 html이 아니라 jsp파일로 바뀜 -->

<%
	String ctxPath = request.getContextPath();
	// ctxPath --> /MyMVC
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 사용해 useBean으로 데이터 전송하기</title>

<style type="text/css">
	
	body {
	      font-family: Arial, "MS Trebuchet", sans-serif;
	      font-size: 16pt; 
	}
	
	* {margin: 0;}

	div#container { 
		width: 90%;
	    margin: 0 auto;
	    padding: 50px 0;
		text-align: center;					
		/* border: 1px solid red; */
	}
	
	fieldset {
	          text-align: left;
	          background: #ffffe6;}
	
	legend {font-size: 24pt;}
	
	fieldset>ul {
		list-style: none;
		padding: 0;
	}
	
	fieldset>ul>li {
		line-height: 40px;
	}
	
	fieldset>ul>li>label:first-child {
		display: inline-block;
		width: 10%;
		/* border: solid 1px green; */
	}
	
	fieldset>ul>li>input {
		width: 20%;
		height: 20px;
		/* border: solid 1px blue; */
	}
	
	div.schoolInterest {
		display: inline-block;
		width: 50%;
		/* border: solid 1px gray; */
	}
	
	div.schoolInterest>label {
		margin-right: 2%;
	}
	
	div.schoolInterest>input {
		margin-right: 5%;
	}
	
    fieldset>ul>li:last-child>input {
    	width: 10%;
    	height: 50px;
    	margin: 2% 4% 0 0;
    	font-size: 16pt;
    	font-weight: bold;
    	background: #006600;
    	color: #eee;
    	border: none;
    }
    
    fieldset>ul>li:last-child>input:hover {
    	opacity: 0.8;
    	cursor: pointer;
    	color: #ffffcc;
    }
	
	span.error {
		color: red;
		font-size: 10pt;
	}
	
	label#agree {
		font-size: 10px;
	}
	

</style>

<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/JqueryStudy/util/myutil.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		/* 
		$("span.error").hide();
		
		또는
		 */
		$("span.error").css('display', 'none'); // 맨 처음엔 error메세지 감추기
		
		/* 
		$("input#userid").bind('blur', function() { // userid에 포커스 들어왔다가 포커스를 잃어버리면 발생되는 이벤트 -> blur 
			alert("ㅎㅎㅎ");
		});
		
		또는
		 */
		$("input#userid").blur(function () {
			/* alert("ㅎㅋㅎㅋ"); */
			
			// 아이디는 5글자 이상 10글자 이하로 첫글자는 영문대문자이고 나머지는 영문자,숫자로 혼합되어져야 한다.
			// == 정규표현식 객체 만들기 == //
			// 	    항상 / 로 시작해서 / 로 끝나고 끝에 ; 을 붙인다.
			
			var regExp = /^[A-Z][A-Za-z0-9]{4,9}$/;
			// 생성된 정규표현식 객체 속에 데이터를 넣어서 검사하기
			var bool = regExp.test($(this).val()); // userid에 들어온 값이 올바른 값인지 유효성검사를 함
			// 리턴타입 boolean.
			
			if(!bool){ // 올바르지 않을 때
				$("span.userid_error").show();
				$("span.userid_error").css('display','');
				
				/* 
				$(":input").prop("disabled", true);
				
				또는
				 */
				$(":input").attr("disabled", true); // 모든 input태그 비활성화
				//$(":input")은 모든 input태그를 말함
				
				/* 
				$(this).attr("disabled", false);
				
				또는
				 */
				$(this).prop("disabled", false); // 나(userid)만 활성화

				$(this).val(""); // 값 비움
				$(this).focus(); // 다시 포커스 줌
				
			}
			else { // 올바를 때
				/*
				$("span.userid_error").hide();
				
				또는
				 */
				$("span.userid_error").css('display', 'none'); // error메세지 감추기
				$(":input").prop("disabled", false);
				$("input#passwd").focus();
			}
			
		}); // end of $("input#userid").blur(function (){})---------------
		 
		
		$("input#passwd").blur(function () {
			
			// 암호는 8글자 이상 15글자 이하의 영문자,숫자,특수기호가 혼합된 것이어야 한다.
			
			var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;         
			
			var bool = regExp.test($(this).val()); 
			
			if(!bool){ // 올바르지 않을 때
				
				$("span.password_error").css('display','');
				$(":input").attr("disabled", true);
				
				$(this).attr("disabled", false);
				$(this).val(""); // 값 비움
				$(this).focus();
			}
			else { // 올바를 때

				$("span.password_error").css('display', 'none'); // error메세지 감추기
				$(":input").prop("disabled", false);
				$("input#passwdCheck").focus();
			}
			
		});
		
		
		$("input#passwdCheck").blur(function () {
			
			if($(this).val() !=  $("input#passwd").val()){ // 올바르지 않을 때
				
				$("span.passwdCheck_error").html("암호와 암호확인 값이 서로 일치하지않습니다.").css('display', '');
				
				$("input#passwd").val("");
				$(this).val(""); // 값 비움
				
				$(":input").attr("disabled", true);
				
				$("input#passwd").attr("disabled", false);
				$(this).attr("disabled", false);
				
				$("input#passwd").focus();
			}
			else { // 올바를 때

				$("span.passwdCheck_error").empty();
				$(":input").attr("disabled", false);
				
				$("input#name").focus();
			}
			
		});
		
		
		$("input#name").blur(function () {
			
			if($(this).val().trim()=="") {
				$("span.name_error").html("성명은 필수입력란 입니다.").css('display', '');
				
				$(":input").attr("disabled", true);
				$(this).attr("disabled", false);
				$(this).val(""); // 값 비움
				$(this).focus();
			}
			
			else { // 올바를 때

				$("span.name_error").empty(); // error메세지 감추기
				$(":input").prop("disabled", false);
				$("input#email").focus();
			}
			
		});
		
		
		
		$("input#email").blur(function () {
		
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			var bool = regExp.test($(this).val());
		
			if(!bool){ // 올바르지 않을 때
				
				$("span.email_error").html("올바른 이메일이 아닙니다.").css('display','');
				
				$(":input").attr("disabled", true);
				$(this).attr("disabled", false);
				$(this).val(""); // 값 비움
				$(this).focus();
			}
			
			else { // 올바를 때

				$("span.email_error").empty(); // error메세지 감추기
				$(":input").prop("disabled", false);
				$("input#tel").focus();
			}
		
		});
		
		
		$("input#tel").blur(function () {
			
			var regExp = /^0[2-9][1-9]?-[1-9][0-9]{2,3}-[0-9]{4}$/;
		
			var bool = regExp.test($(this).val());
		
			if(!bool){ // 올바르지 않을 때
				
				$("span.tel_error").html("올바른 자택전화 형식이 아닙니다.").css('display','');
				
				$(":input").attr("disabled", true);
				$(this).attr("disabled", false);
				$(this).val(""); // 값 비움
				$(this).focus();
			}
			
			else { // 올바를 때

				$("span.tel_error").empty(); // error메세지 감추기
				$(":input").prop("disabled", false);
				$("input#jubun1").focus();
			}
		
		});
		
		
		$("input#jubun1").blur(function () {
			
			var regExp = /^[0-9]{6}$/;
		
			var bool = regExp.test($(this).val());
		
			if(!bool){ // 올바르지 않을 때
				
				$("span.jubun_error").html("숫자만 입력하세요").css('display','')
			
				
				$(":input").attr("disabled", true);
			
				$(this).attr("disabled", false);
				$("input#jubun1").attr("disabled", false);
				
				$(this).val(""); // 값 비움
				$(this).focus();
			}
			
			else { // 올바를 때
				$("span.jubun_error").empty();
				$(":input").prop("disabled", false);
				$("input#jubun2").focus();
			}
		
		});
		
		
		$("input:password[id=jubun2]").bind("blur", function () {
			
			var sGender = $(this).val().substring(0,1);
			
			switch (sGender) {
			case "1":
			case "3":
				$("input:radio[value='M']").prop("checked", true);	
			//  $("input:radio[value='M']") 은 선택자가 input 태그의 type이 radio 중 value 값이 'M' 인것을 요소(태그)로 하겠다.
			//  $("input:radio[value='M']").prop("checked", true); 은 해당 선택자(남자 라디오)에 체크하라는 뜻이다.     
				break;
			
			
			case "2":
			case "4":
				$("input:radio[value='F']").prop("checked", true);	
				break;
				
			default: // 1~4를 입력하지 않았을때
				$("input#jubun1").val("");
				$(this).val("");
				$("span.jubun_error").html("주민번호가 올바르지 않습니다.").css('display','');
				
				$(":input").attr("disabled", true);
				$("input#jubun1").attr("disabled", false);
				$(this).attr("disabled", false);
				break;
			}// end of switch(sGender) --------
			
		
		}); // $("input:password[id=jubun2]").bind("blur", function () {}) ----------
		
		
		$("#btnRegister").click(function() {
			// name이 registerFrm인 form을 submit하려고 할 때 발생하는 이벤트
			
			// 1. 주민번호가 올바른 주민번호인지 아닌지를 검사한다.
			var sJubun = $("input#jubun1").val().trim() + $("input#jubun2").val().trim();
			var bool = func_jubunCheck(sJubun); //주민번호 공식에 맞으면 true를 리턴하고, 틀리면 false를 리턴한다.
			
			if(!bool) {
				$("span.jubun_error").html("주민번호가 올바르지 않습니다.").css('display','');
				$("input#jubun1").val("");
				$("input#jubun2").val("");
				
				$("input:radio[value='M']").prop("checked", false);	
				$("input:radio[value='F']").prop("checked", false);
				
				$("input#jubun1").focus();
				
				return; // submit 하지말고 끝내라는 뜻 
				
			}
			
			
			// 2. 학력이 선택되었는지 검사한다.
			var nSchoolCheckedLen = $("input:radio[name=school]:checked").length;
			
			if(nSchoolCheckedLen == 0) { // 선택안한 경우
				alert("학력을 선택하세요!");
				return;
			}

			
			// 3. 관심분야는 최소한 2개 이상을 선택했는지 검사한다.
			var nInterestCheckedLen = $("input:checkbox[name=interest]:checked").length;
			
			if(nInterestCheckedLen < 2) { // 1개 이하일때
				alert("관심분야는 최소한 2개이상 선택하세요");
				return;
			}
			
			
			// 약관동의
			var bAgree = $("input:checkbox[name=agree]").prop("checked");
			
			if(bAgree == 0){
				alert("약관에 동의하셔야 회원가입이 가능합니다.");
				return;
			}
			
			
			var frm = document.registerFrm;
			frm.action = "05formUseBeanEnd.jsp";
			frm.method = "post";
			frm.submit();
			
			
		}); // end of $("#btnRegister").click(function() {})----------------
		
		
	});// end of $(document).ready()------------------

</script>

</head>
<body>
<div id="container">
	<form name="registerFrm">
		<fieldset>
			<legend>회원가입</legend>
			<ul>
				<li>
					<label for="userid">아이디</label>
					<input type="text" name="userid" id="userid" value="" maxlength="20" required autofocus autocomplete="off" />
					<span class="error userid_error">아이디는 5글자 이상 10글자 이하로 첫글자는 영문대문자이고 나머지는 영문자,숫자로 혼합되어져야 합니다.</span>     
				</li>
				<li>
					<label for="passwd">암호</label>
					<input type="password" name="passwd" id="passwd" value="" maxlength="20" required />
					<span class="error password_error">암호는 8글자 이상 15글자 이하의 영문자,숫자,특수기호가 혼합된 것이어야 합니다.</span>
				</li>
				<li>
					<label for="passwdCheck">암호확인</label>
					<input type="password" id="passwdCheck" value="" required />
				    <span class="error passwdCheck_error"></span>
				</li>
				<li>
					<label for="name">성명</label>
					<input type="text" name="name" id="name" value="" maxlength="20" required />
				    <span class="error name_error"></span>
				</li>
				<li>
					<label for="email">e메일</label>
					<input type="email" name="email" id="email" value="" maxlength="40" placeholder="예 abc@gmail.com" required />
				    <span class="error email_error"></span>
				</li>
				<li>
					<label for="tel">자택전화</label>
					<input type="tel"  name="tel" id="tel" value="" maxlength="13" placeholder="-까지 입력"/>
					<span class="error tel_error"></span>
				</li>
				<li>
					<label>주민번호</label>
					<input type="text" name="jubun1" id="jubun1" size="10" maxlength="6" required autocomplete="off" />&nbsp;-
					<input type="password" name="jubun2" id="jubun2" size="10" maxlength="7" required />   
					<span class="error jubun_error"></span>
				</li>
				<li>
					<label>성별</label>
					<label>남<input type="radio" name="gender" value="M" /></label>&nbsp;
					<label>여<input type="radio" name="gender" value="F" /></label>
				</li>
				<li>
					<label>학력</label>
					<div class="schoolInterest">
						<label for="school1">고졸</label><input type="radio" name="school" id="school1" value="고졸" />&nbsp;
				        <label for="school2">초대졸</label><input type="radio" name="school" id="school2" value="초대졸" />&nbsp;
				        <label for="school3">대졸</label><input type="radio" name="school" id="school3" value="대졸" />&nbsp;
				        <label for="school4">대학원졸</label><input type="radio" name="school" id="school4" value="대학원졸" />&nbsp; 
				    </div> 
				</li>
				<li>
					<label>관심분야</label>
					<div class="schoolInterest">
						<label for="interest1">Java</label><input type="checkbox" name="interest" id="interest1" value="Java" />&nbsp;
				        <label for="interest2">Oracle</label><input type="checkbox" name="interest" id="interest2" value="Oracle" />&nbsp;
				        <label for="interest3">HTML</label><input type="checkbox" name="interest" id="interest3" value="HTML" />&nbsp;
				        <label for="interest4">JavaScript</label><input type="checkbox" name="interest" id="interest4" value="JavaScript" />&nbsp;
					</div> 
				</li>
				<li>
					<label for="agree">약관동의 <input type="checkbox" name="agree"/></label>
				</li>
				<li>
					<iframe src="iframeAgree/agree.html" width="85%" height="150px" style="border: solid 1px navy; margin: 20px 0px"></iframe>
					<!-- html안에 또 다른 html을 넣을 때 iframe을 씀 -->
				</li>
				
				<li>
					<input type="button" id="btnRegister" value="회원가입" />
					<input type="reset" value="취소" />
				</li>
			</ul>
		</fieldset>
	</form>
</div>
</body>
</html>
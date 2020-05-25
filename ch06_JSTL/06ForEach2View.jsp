<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ==== JSTL(JSP Standard Tag Library) 사용하기 ==== --%>     
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 명단 출력하기(JSTL을 사용한 것)</title>
</head>
<body>
	<h2>회원 명단 출력하기(JSTL을 사용한 것)</h2>
	
	<c:if test="${!empty nameArr}">
		<ol>
			<c:forEach var="fruit" items="${nameArr}"> 
			<!-- begin 과 end 는 반복 횟수를 알고 있을 때, 모를 땐 items -->
				<li>${fruit}</li>
			</c:forEach>
		</ol>
	</c:if>
	
	<c:if test="${empty nameArr}">
		nameArr에는 과일 명단이 없습니다.
	</c:if>
	
	
	<br/>
	
	<hr style="border: solid 1px navy;" />
	
	
	<c:if test="${not empty nameArr2}">
		<ol>
			<c:forEach var="fruit2" items="${nameArr2}"> 
				<li>${fruit2}</li>
			</c:forEach>
		</ol>
	</c:if>
	
	<c:if test="${empty nameArr2}">
		nameArr2 에는 과일 명단이 없습니다. <br/>
	</c:if>
	
	
	
	
</body>
</html>
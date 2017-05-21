<%@ page language="java" import="project.businessmanager.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<!-- <style type="text/css">
body {
	background:
		url("${pageContext.request.contextPath}/images/background.jpg");
}
</style> -->

</head>
<br />
<body>
	 <div style="position: absolute; left: 50px; top: 20px">
		<%
			int currentQuestion = ((ExamManager) request.getSession().getAttribute("exam")).getCurrentQuestionNumber();
		    int totalQuestions = ((ExamManager) request.getSession().getAttribute("exam")).getQuestionList().size();
			// System.out.println("Question Number "+currentQuestion+ " retrieved ");
		%>
		 Current Question <%=currentQuestion%> / <%=totalQuestions %>
		
	</div> 


	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span>${sessionScope.quest.question}</span><br />
		<br />
		<form action="exam" method="post">
			<c:forEach var="choice" items="${sessionScope.quest.questionOptions}"
				varStatus="counter">
				<input type="radio" name="answer" value="${counter.count}">${choice}  <br />
			</c:forEach>
			<br />

			 <%
				if (currentQuestion > 1) {
			%>
			<input type="submit" name="action" value="Previous" />
			<%
				}
			%>

			<%
				if (currentQuestion <= totalQuestions) {
			%>
			<input type="submit" name="action" value="Next" />
			<%
				}
			%>
			<input type="submit" name="action" value="Finish Exam" /> 

		</form>
	</div>


</body>
</html>
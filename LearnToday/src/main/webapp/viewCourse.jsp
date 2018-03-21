<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<head>
<title><jsp:getProperty name="course" property="courseName"/> Details</title>
</head>

<body>
<div class="container">
<header>
<%@ include file="header.jsp" %>
</header>

<article>
<jsp:scriptlet>
    String user = (String)session.getAttribute("user");
    String message = "Welcome "+user+" !";
</jsp:scriptlet>
<b>
    <jsp:expression>message</jsp:expression>
</b>

<jsp:useBean id="course" class="com.learntoday.model.Course" scope="request"/>

   
   <div class="panel panel-primary">
   	<p class="panel-heading">Course Details </p>
   	
   	<div class="panel-body">
   	
   		<div class="media">
  			<div class="media-left">
    			<a href="#"><img class="media-object" src="${course.imageUrl}" alt="${course.courseName}"></a>
  			</div>
  			<div class="media-body">
  		  		<h4 class="media-heading">${course.courseName}</h4>
		   		<p><strong>Trainer Name : </strong> ${course.facultyName} </p>
		   		<p><strong>Course Description : </strong> <br/> ${course.description} </p>
		   		<p><strong>Course Fee : </strong> ${course.fees} </p>
  			</div>
	</div>
   				
   		<p class="text-center"><a href="Courses.jsp" class="btn btn-lg btn-success">View All Courses</a> </p>
   	</div>
   </div>
 </article>
 
 <footer>
 <%@ include file="footer.jsp" %>
 </footer>
 </div>
</body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="java.sql.*, com.learntoday.model.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Course</title>
</head>
<body>

<jsp:scriptlet>
	String userName = (String)session.getAttribute("user");
	if( userName == null ) {
	    response.sendRedirect("login.jsp?requestUrl=findCourse");
	} else {
</jsp:scriptlet>

<jsp:useBean id="course" class="com.learntoday.model.Course" scope="request"/>

<jsp:declaration>
   String courseName = null;
</jsp:declaration>

<jsp:scriptlet>

  String facultyName = null;
  String courseDuration = null;
  int courseFee = 0;
  
  courseName = request.getParameter("courseName");
  courseName=courseName.trim();
  System.out.println("course name selected :: "+courseName);
  Connection con = (Connection) application.getAttribute("connection");
  String sql = "select * from course where courseTitle='"+courseName+"'";
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  
  if(rs.next()) {
      course.setCourseName(courseName);
      course.setFacultyName(rs.getString(3));
      course.setImageUrl(rs.getString(4));
      course.setFees(rs.getInt(5));
      course.setDescription(rs.getString(6));
  }
	
</jsp:scriptlet>
<jsp:forward page="viewCourse.jsp"/>
<%
	}
%>
</body>
</html>
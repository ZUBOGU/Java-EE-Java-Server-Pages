<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>
</head>
<body>
<div class="container">

<header>
<%@ include file="header.jsp" %>
</header>

<article>
<div class="alter alert-danger">
<%
	  String imageUrl = config.getInitParameter("imageUrl");
	  String errorMessage = config.getInitParameter("errorMessage");
	  out.print("<center><img src='" + imageUrl + "' alt='" + errorMessage +"' width='150' height='150'/>");
	  out.print("<h1>Oops!... <br>" + errorMessage + "</h1> </center>");
%>
</div>
</article>

<footer>
<%@ include file="footer.jsp" %>
</footer>
</div>
</body>
</html>
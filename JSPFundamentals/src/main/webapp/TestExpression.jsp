<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java Fundamentals: Expression</title>
</head>
<body>
<p>Converting a String To Upper Case : <%= new String("Hello World").toUpperCase() %></p>
<p>What is 6*4 : <%= 6*4 %></p>
<p>Is 2 lesser than 1 : <%= 2 < 1 %></p><br/><br/>
<p>Current Date and Time : <%= new java.util.Date() %> </p>
</body>
</html>
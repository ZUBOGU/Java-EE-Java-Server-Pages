<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>LearnToday-Way To Success</title>
</head>
<body>
<div class="container">
<header>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <hgroup>
        <h1>LearnToday</h1>
        <h3>-Way to Success</h3>
    </hgroup>
</header>

<article>
<div class="row">
<div class="jumbotron">
    <h1 class="text-center">Enter to Learn and to Exit To Earn </h1>
    <p class="text-center">Our expertise empower you to achieve your goals and achieve success </p>
<div class="row">
<center>
<form class="form-inline" action="findCourse.jsp" >
  <div class="form-group">
    <label class="control-label">Search Course </label>
    <input type="text" class="form-control" name="courseName" id="courseName" placeholder="Enter Course Title">
  </div>
  <input type="submit" class="btn btn-primary" value="Search">
</form>
</center>
</div>
    <br/>
    <p class="text-center"><a href="courses.jsp" class="btn btn-lg btn-success">View All Courses</a> </p>
</div>
</div>

<div class="row">
    <p>New Users : <a href="register.jsp">Register Here</a>
</div>

<div class="row">
    <p>Existing Users: <a href="login.jsp">Login Here</a>
</div>
</article>

<footer>
<div class="row">
    <p class="text-center">Copyight &copy; LearnToday - <%= Calendar.getInstance().get(Calendar.YEAR) %> </p>
</div>
</footer>
</div>
</body>
</html>
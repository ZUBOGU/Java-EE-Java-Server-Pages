# Java-EE-Java-Server-Pages
Use Java Server Pages(JSP) to develop web based applications in simple and easy steps.

Start from the beginning, learning the fundamentals of JSP, Directives, and Standard Actions

Next, explore Java Standard Tag Library, Expression Language, Using Custom Tags, and Projects. 

Finally, tackle Project Development using the above topics.

## LearnToday Project Notes (How to run the web application)
Use bootstrap CDN(content delivery network) for the application.

### Create Data for course in MySQL.
Use mysql workbench to create Table
```
CREATE TABLE `mydb`.`course` (
  `CourseID` INT(11) NOT NULL AUTO_INCREMENT,
  `CourseTitle` VARCHAR(45) NOT NULL,
  `Trainer` VARCHAR(45) NOT NULL,
  `ImageUrl` VARCHAR(45) NULL DEFAULT NULL,
  `Fees` INT(11) NULL DEFAULT NULL,
  `CourseDescription` VARCHAR(450) NULL DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE INDEX `CourseTitle_UNIQUE` (`CourseTitle` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```

Insert Data to Table course
```
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('1', 'Android', 'Zubo', './images/android.png', '3500', 'Android is a mobile …');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('2', 'ASP.NET MVC', 'zubo', './images/aspmvc.png', '3499', 'ASP.NET MVC is …');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('3', 'ASP.NET', 'ZUBO', './images/aspnet.png', '3000', 'ASP.NET is ..');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('4', 'C#.NET', 'ZUBO', './images/csharp.png', '3000', 'C# is ..');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) 
VALUES ('5', 'Xamarin.Forms', 'Zubo	', './images/forms.png', '9999', 'Xamarin,Forms is ..');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('6', 'Xamarin.IOS', 'zubo', './images/ios.png', '12999', 'Xamarin.IOS is ..');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('7', 'JDBC', 'ZUBO', './images/jdbc.png', '8999', 'JDBC is ..');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`)VALUES ('8', 'JSP', 'Zubo', './images/jsp.png', '9999', 'JavaServer Pages(JSP) is a …');
INSERT INTO `mydb`.`course` (`CourseID`, `CourseTitle`, `Trainer`, `ImageUrl`, `Fees`, `CourseDescription`) VALUES ('9', 'Xamarin.Android', 'zubo', './images/xamarin.png', '19999', 'Xamarin,Android is ..');
```
Query Table
```
SELECT * FROM mydb.course;
```

### Rating Table Data
```
CREATE TABLE `mydb`.`Ratings` (
  `RatingID` INT(11) NOT NULL AUTO_INCREMENT,
  `CourseTitle` VARCHAR(45) NULL DEFAULT NULL,
  `UserName` VARCHAR(45) NULL DEFAULT NULL,
  `Rating` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`RatingID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```

### MySQL for mac notes
Update Path and change root user password
```
cat ~/.bash_profile 
echo 'export PATH="/usr/local/mysql/bin:$PATH"' >> ~/.bash_profile
mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
\q
CREATE DATABASE mydb
```

Create a new schema 'mydb' which is user to connect to DB. Create `users` table which as `username` and `password` columns.

Then we can use JDBC to register new user and Authenticate existing users.
```
CREATE TABLE mydb.users (usrname VARCHAR(20), password VARCHAR(20));
select * from users;
```

### Deploy war file
> cd LearnToday

> mvn clean install

> cp target/LearnToday.war ~/apache-tomcat-9.0.5/webapps/

Copy LearnToday.war file into Tomcat /webapps directory.

Go to browser and view the page.

> http://localhost:8080/LearnToday

Add the url path in JSP Page

> http://localhost:8080/LearnToday/index.jsp

### Maven Archetype to initial a project
```mvn -DarchetypeGroupId=org.codehaus.mojo.archetypes -DarchetypeArtifactId=webapp-javaee7 -DarchetypeVersion=1.1 -DgroupId=com.LearnToday -DartifactId=LearnToday -Dversion=1.0 -Darchetype.interactive=false --batch-mode -Dpackage=com.learntoday archetype:generate```

## JSP Fundamentals

Java Server Pages is a technology that helps software developers to create platform independent dynamic web applications rapidly based
on HTML or XML document types.

limitations of servlets:
```
Requires strong knowledge of Java
Writing HTML code will be difficult
Need to recompile & redeploy
```

Advantage of Using JSP:
```
Not mandatory to have a strong programming knowledge. 
Writing the HTML code in JSP program is easy and it is similar to HTML.
Modifications done to the JSP is recognized automatically and immediate.
JSP programs are by default thread safe. 
JSP programs can use standard tags, we can create our own custom tags using tag extension API.
Easy to learn, implement, and to maintain JSP pages.
```

### JSP Development Models
#### JSP Model 1 Architecture
```
Pros:
Development will be easy and faster
Cons:
Not suitable for large-scale application development
No Separation of Concerns
Maintenance will be problem
```

#### JSP Model 2 Architecture (MVC, model, view, controller)
Model: hold business logic and the state, retrieving and update the data. Talks to the DB.

View: presentation.

Controller: tell the model to update itself and make the model state available for the view.

##### JSP Model 2 Architecture - MVC 1
JSP - controller and view. Java Components - model.

##### JSP Model 2 Architecture - MVC 2
Servlet - Controller. JSP - View. Java Beans - model. 
```
Pros:
Navigation Control Centralized
Follows Industry Standard
Easy to Maintain
Better Separation Of Concern
Parallel Development
Cons :
Need to Recompile the Servlet Class
```

### Expression Tag
JSP expressions are used to compute an expression and the result of that is included in HTML page that's returned to the browser.

```
<p> current date and time
<%=
new java,util.Date()
%>
<p>
```

This is a ```out.write()``` in ```_jspService(...)``` java class.

### Declaration Tag
Syntax: to define the declaration tag
```
<%!%>
<%! int id = 10; %>
```

This is a declaration(method or variable) in ```demo_jsp.java``` class.

### Scriptlet Tag
Scripting Element which allows us to add any variable declaration and any computed logic with in the JSP page. It cannot have any method.

Syntax
```
<%
// Java Code Block1
%>
```

This is a variable or computed logic inside ```_jspService(...)``` method of ```demo_jsp.java``` class.

## JSP Directive
The directives of JSP are used to provide some meaningful information about the current JSP page to the JSP Container which will be required during the Translation phase.

### @page Directive
Syntax: Define a page directive

```<%@ page attribute="value" attribute="value" ... %>```

Can use multiple page directives. Cannot specify same attribute more than once(exclude import).
```
language="scripting language"
extends="className"
import="importList"
session="true|false"
buffer="none="none|sizekb"
autoFlush="true|false"
info="info_text"
contenetType="ctinfo"
errorPage="error_url"
isErrorpage="true|false"
```

```
<%@ page language="java" %>
<%@ page import="java.sql.*, java,util.*" %>
<%@ page import=“java.sql.*”,import=“java.util.*”%>
<%@ page info="this is home page" %>
<%@ page extend="this is home page" %>
<%@ page contentType="text/html" %>
<%@ page isELIgnored="true" %>  // expression language
<%@ page isThreadSafe="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ page buffer="10kb" %>
<%@ page autoFlush="true|false" %>
```

### @inclue Directive
will specify the JSP Container to read the specified file and merges its contents into the JSP source code currently being parsed at the Translation phase
Include Directive
```
<%@ include file="filename"%>
<%@ include file="header.jsp"%>
```

### @taglib Directive
```
Set of custom tags
Identifies the location of the library
Identifying the custom tags
```

Syntax: To Define the taglib directive
```
<%@ taglib uri="uriofTagLibrary" prefix="prefixOfTag"/%>
<%jsp:directive.tagliburi="uri" prefix="prefixOfTag"/%>
```

## Request and Server Context through Built-in Objects
### Request
Request Object Methods
```
setAttribute
getAttribute
getCookies()
getHeaderNames()
getHeader(string name)
getMethod()
getParameter(string name)
getQueryString(string name)
getLocale()
```

### Response
```
setIntHeader(String name,Intvalue)
response.setHeader("Refresh",5)

setContentType(String type)
response.setContentType("text/html")

sendRedirect(String location)
response.sendRedirect("sucess.jsp")

addCookie(Cookie cookie)
response.addCookie(userCookie)
```

### Out
In Servlets
```
Prinitwriterout =response.getWriter();
```

In JSP
```
Out [BuiltinObject]
jspWriterout=pagecontext.getout()
```
Throws IOException

Out Built-in Object Methods
```
print
printIn
flush
```
Syntax to display the current date and time
```
out.print("Today is:"+java.util.Calendar.getInsatance().getTime());
```

### PageContext
Important Methods to PageContext
```
setAttribute
getAttribute
findAttribute
removeAttribute
```
```
<%Float no1=newFloat(62.5)%>
<%pageContext.setAttribute("no1“,no1);%>
<%pageContext.getAttribute("no1“,no1)%>
<%Float no2=newFloat(84.3)%>
<%pageContext.setAttribute
("no2“,no2,PageContext.”SESSION_SCOPE");%>
<%pageContext.getAttribute
("no2“,PageContext.”SESSION_SCOPE");%>
```

### Session
Session Builtin Object
```
setAttribute( String name,Objectvalue)
getAttribute(String name)
removeAttribute(String name)
```
Syntax To set the session
```
<%pageContext.setAttribute
("no",value,PageContext.SESSION_SCOPE); %>
<%session.setAttribute("no",value)%>
```

### Application
```
javax.servlet.ServletContextapplication=pageContext.getServeltContext()
```
Syntax
```
application.setAttribute(String name,Object value) // To Set
application.getAttribute(String name) // To Read
```

### Config
Config build in object is used for getting configuration information for a particular JSP page.
Config Implicit Object
```
getInitParameter(String name)
getInitParameterNames()
getServletContext()
getServletName()
```

## Handling Exceptions in JSP
```
Try-Catch Block
isErrorPage and ErrorPageattribute
<error-page> tag
```

Syntax To Declare an Error Page for All Type of Exception
```
<error-page>
<exception-type>java.lang.Throwable</exception-type>
<location>/error.jsp</location>
</error-page>
```

Syntax To Declare an Error Page for More Detailed Exception
```
<error-page>
<exception-type>java.lang.ArithmeticException
</exception-type>
<location>/error.jsp</ location>
</error-page> </error-page>
```

Syntax To Declare an Error Page for Based on HTTP Error Status Codes
```
<error-page>
<error-code>404</error-code>
<location>/error.jsp</location>
</error-page>
```

## Standard Actions
JSP Standard Actions
```
<jsp:include> <jsp:forward> <jsp:param> <jsp:useBean> <jsp:setProperty> <jsp:getProperty> <jsp:plugins> <jsp:fallback> <jsp:attribute> <jsp:body> <jsp:invoke> <jsp:element> <jsp:text>
```

### <jsp:include>
Syntax
```
<jsp:include page="url flush=“true| false"/>
```

What is the difference between include action and include directive?

Include directive (<%@include%>)
```
Copies the code from one page to another page
Copies the code during the translation time
Generates only one Servlet
Static Binding
```

Include action (jsp:include)
```
Copies the results from one page to another page
Copies the output during the runtime
Generates two Servlets Performs 
Dynamic Binding
```

### <jsp:forward>
```<jsp:forward=getRequestDispatcher().forward()```
JSP page must be buffered to use a ```<jsp:forward >``` tag
Syntax
```
<jsp:forward page="url"/>
```
Compare ```<jsp:forward>```
```
Direct communication between source and destination pages
Uses same request and response object
Source and destination pages should belong to same application
```

Sendredirect
```
Indirect communication between source and destination page
Uses separate request and response object
Can be in one same application / different application / same server / different server
```

### <jsp:param>
Sytax
```<jsp:param name="..." value="..."/>```
Used as a sub-tag for include,forward or plugin action

### <jsp:useBean>
UseBean action is a way for declaring and initializing the actual java bean component object.

What is JavaBean?

Class must be public. Have 0 argumnet constructor. variable declared inside are called as bean properties. All the bean propertieshsould bedeclared private. Bean property must be specift a setter and getter methods and public. Class must implement serializable interface.

Sample Java Class
```
package com.learntoday.model;
import java.io.Serializable;
@SuppressWarnings("serial")
public class Name implements Serializable {
	private String firstName;
	private String lastName;
	public Name(){ }
	public void setFirstName(String fname){
		this.firstName = fname;
	}
	public String getFirstName(){
		return this.firstName;
	}
	public void setLastName(String lname){
		this.lastName = lname;
	}
	public String getLastName(){
		return this.lastName;
	}
}
```

Syntax:
```<jsp:useBean attributes/>```

Attributes:
```
id
class
scope
	page
	request
	session 
	application
type
beanName
```

### <jsp:setProperty>
Syntax:
```<jsp:setProperty name= "..." property="propertyName|*" value="..."param="..."/>```

setProperty
```
<jsp:useBean id="nameBean" class="com.model.Name" scope="session">
<jsp:setProperty name="nameBean“ property="firstName“ params="firstName"/>
<jsp:setProperty name="nameBean“ property="lastName“ params="lastName"/> </jsp:useBean>
```

If the params and properties name match
```
<jsp:useBean id="nameBean" class="com.psdemos.model.Name" scope="session">
<jsp:useBean id="nameBean“ property="*"/> </jsp:useBean>
```

### <jsp:getProperty>
Syntax:
```<jsp:getProperty name="..." property="..."/>```

In another JSP page, Without scope session, inside useBean and outside useBean's getProperty is returning null.

With scope session, inside useBean is returning null and outside useBean getProperty is returning value.

### <jsp:plugins> and <jsp:fallback>
Syntax:
```
<jsp:plugin type="bean | applet " code="..."codebase="..."> 
<jsp:params>
<jsp:param name="..." value="..."> 
</jsp:params>
</jsp:plugin>
```

```<jsp:fallback>```
used to provide some meaning information to the client's browser if the requested plugin cannot be started Optional attributes type,align,height,width,name,title

### <jsp:element>,<jsp:attribute> and <jsp:body>
Syntax
```
<jsp:element> without a body
<jsp:element name="elementName"/>

<jsp:element> with a body
<jsp:element name="elementName"> 
<jsp:attribute>...</jsp:attribute> 
<jsp:body>...</jsp:body> 
</jsp:element>
```

## Simplifying JSP Development with Expression Language
### EL Fundamentals
Expression Language Fundamentals
```
Introduced from JSP 2.0
Accessing data from a JavaBean,Request,Response,Session,Applic ation
*, +, - , () , [ ] and < or It, > or gt , ! or not 
Null Friendly Language
```

Syntax:
```
$ { expression }
```

EL Advantages
```
More information using simple expression 
Easy to access or modify Bean Properties 
Access Nested Property
Collection Elements
Provides Math and Conditional Operators 
Supports Automatic Type Conversions
```

Syntax: Deployment Descriptor Element
```
<jsp:config>
<el-ignored> true | false </el-ignored> 
</ jsp:config>
```

Syntax: With in Page directive
```
<%@page isELIgnored="true | false" %> 
```

### Basic Operators
Arithmetic Operators
Logical Operators
Relational Operators
Reserved words such as true,false,null,empty

### Implicit Objects
EL-Implicit Objects
```
pageContext Object
	- ${ pageContext.request.queryString} 
header object
	- $[header["user-agent"] 
headerValue
scope object
	pageScope 
	reuestScope 
	sessionScope 
	applicationScope
param 
paramValues 
initParam 
cookie
```

Syntax To access the Java Bean property
```
${course.courseName} ${reuestScope.course.courseName}
```

Access Nested Property
```
$(requestScope.person.car.carName)
```

## JSP Standard Tag Library (JSTL)
JSTL Features
```
Loop
Condition Execution 
Database Access 
Internationalization 
XML Processing
```

```
Core Tags
Formatting Tags
Database Tags
Functions Tags
XML Tags
```

### Core Tags
Syntax JSTL Core tags
```
<%@taglib prefix="c“ uri="http://java.sun.com/jsp/jstl/core" %>
```

```
<c:out> <c:set> <c:remove> <c:catch> <c:if> <c:choose> <c:when> <c:otherwise> <c:import> <c:foreach> <c:forTokens> <c:param> <c:redirect> <c:url>
```

### Formatting Tags
Syntax To use the JSTL Formatting tags
```
<%@taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt " %>
```

```
<fmt:formatNumber> <fmt:parseNumber> <fmt:formatDate> <fmt:parseDate> <fmt:bundle> <fmt:setLocale> 
<fmt:setBundle> <fmt:timeZone> <fmt:setTimeZone> <fmt:message> <fmt:requestEncoding>
```

### SQL Tags
Syntax To include the JSTL SQL tag library
```
<%@ taglib prefix="sql" uri ="http://java.sun.com/jsp/jstl/sql" %>
```

```
<sql:setDataSource> <sql:query> <sql:update> <sql:param> <sql:dateParam> <sql:transaction>
```

### JSTL Functions
Syntax To include the JSTL Function tag library
```
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/function" %>
```

```
fn:contains fn:containsIgnoreCase fn:endsWith fn:idexOf fn:join fn:length 
fn:split fn:stratsWith fn:substring fn:toUpperCase fn:toLowerCase fn:trim
```

## Custom Tags
Types of Tag Handlers: Simple Tag Handlers and Classic Tag Handlers.

Create a Custom Tag
```
Create a Tag Handler Class
Create a Tag Library Descriptor (tld file)
Create A JSP page
```

Tag with Body
Tag with Attributes


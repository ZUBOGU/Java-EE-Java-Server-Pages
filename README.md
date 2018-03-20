# Java-EE-Java-Server-Pages
Use Java Server Pages(JSP) to develop web based applications in simple and easy steps.

Start from the beginning, learning the fundamentals of JSP, Directives, and Standard Actions

Next, explore Java Standard Tag Library, Expression Language, Using Custom Tags, and Projects. 

Finally, tackle Project Development using the above topics.

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
<%@include file="header.jsp"%>
```

### LearnToday Project
Use bootstrap CDN(content delivery network) for the application

### Deploy war file
> cd JSPFundamentals

> mvn clean install

Copy JSPFundamentals-1.0.war file into Tomcat /webapps directory.

Go to browser and view the page.

> http://localhost:8080/JSPFundamentals-1.0

Add the url path in JSP Ppage

> http://localhost:8080/JSPFundamentals-1.0/HelloWorld.jsp

### Maven Archetype to initial a project
```mvn -DarchetypeGroupId=org.codehaus.mojo.archetypes -DarchetypeArtifactId=webapp-javaee7 -DarchetypeVersion=1.1 -DgroupId=com.JSPFundamentals -DartifactId=JSPFundamentals -Dversion=1.0 -Darchetype.interactive=false --batch-mode -Dpackage=com.JSPFundamentals archetype:generate```
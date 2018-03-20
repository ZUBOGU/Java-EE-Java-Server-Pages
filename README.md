# Java-EE-Java-Server-Pages
Use Java Server Pages(JSP) to develop web based applications in simple and easy steps.

Start from the beginning, learning the fundamentals of JSP, Directives, and Standard Actions

Next, explore Java Standard Tag Library, Expression Language, Using Custom Tags, and Projects. 

Finally, tackle Project Development using the above topics.

### Introduction
#### JSP

Java Server Pages is a technology that helps software developers to create platform independent dynamic web applications rapidly based

on HTML or XML document types.

limitations of servlets: Web application development using servlets requires strong knowledge of Java. Writing the HTML code within the

servlet page will be very difficult. Servlet is a picture of both presentation logic written using HTML and business logic written 

using Java. Whenever we make any changes or modifications to the servlet, it has to be recompiled and then redeployed to see the changes

Advantage of Using JSP:
```
Not mandatory to have a strong programming knowledge. 
Writing the HTML code in JSP program is easy and it is similar to HTML.
Modifications done to the JSP is recognized automatically and immediate.
JSP programs are by default thread safe. 
JSP programs can use standard tags, we can create our own custom tags using tag extension API.
Easy to learn, implement, and to maintain JSP pages.
```

#### JSP Development Models
##### JSP Model 1 Architecture
Pros: Development will be easy and faster

Cons: Not suitable for large-scale application development.

No separation of Concerns.

Maintenance will be problem.

##### JSP Model 2 Architecture (MVC, model, view, controller)
Model: hold business logic and the state, retrieving and update the data. Talks to the DB.

View: presentation.

controller: tell the model to update itself and make the model state available for the view.

###### JSP Model 2 Architecture - MVC 1
JSP - controller and view. Java Components - model.

###### JSP Model 2 Architecture - MVC 2
Servlet - Controller. JSP - View. Java Beans - model. 

Pros:

Navigation Control Centralized.

Follows Industry Standard.

Easy to Maintain.

Better Separation of Concerns.

Parallel Development

Cons:
Need to Recompile the Servlet Class

### Deploy war file

> cd JSPFundamentals

> mvn clean install

Copy JSPFundamentals-1.0.war file into Tomcat /webapps directory.

Go to browser and view the page.

> http://localhost:8080/JSPFundamentals-1.0

Add the url path in jSP Ppage

> http://localhost:8080/JSPFundamentals-1.0/HelloWorld.jsp

### Maven Archetype to initial a project
```
mvn -DarchetypeGroupId=org.codehaus.mojo.archetypes -DarchetypeArtifactId=webapp-javaee7 -DarchetypeVersion=1.1 -DgroupId=com.JSPFundamentals -DartifactId=JSPFundamentals -Dversion=1.0 -Darchetype.interactive=false --batch-mode -Dpackage=com.JSPFundamentals archetype:generate
```
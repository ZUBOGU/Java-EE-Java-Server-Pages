package com.learntoday.customtag;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.io.*;
import java.sql.*;

public class RatingsDisplayTag extends SimpleTagSupport {

	private String course;
	StringWriter writer = new StringWriter();

	public void setCourse(String course) {
		this.course = course;
	}

	public void doTag() throws JspException,IOException             {
	 	JspWriter out = getJspContext().getOut();
        Connection con = getConnection();
        String sql = "select count(username) as users, rating from ratings where coursetitle='"+course+"' group by rating";
        int userCount =0;
		int rating=0;
		int totalUserRating = 0;
		int totalUsers = 0;
		float courseRating= 0;
        try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				userCount=rs.getInt("users");
				rating=rs.getInt("rating");
				totalUserRating+=userCount*rating;
				totalUsers+=userCount;
			}
			courseRating = totalUserRating/totalUsers;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	    out.print(courseRating);
	}

	private Connection getConnection() {
	    Connection con = null;
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
	    }catch(Exception ex) {
	        ex.printStackTrace();
	    }
	    return con;
	}

}
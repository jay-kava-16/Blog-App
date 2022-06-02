<%-- 
    Document   : viewBlog
    Created on : 15-Apr-2022, 6:34:59 PM
    Author     : Bhumit
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {font-family: Arial, Helvetica, sans-serif;
background-color: #E3E3E3;}
        </style>
        <title>View Blog</title>
        
    </head>
    <body>
        <center>
            <h3>View Blog</h3>
            
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/blogapp" user="root" password="" var="db"/>
            <sql:query dataSource="${db}" var="q1">
                SELECT * FROM blog where user_id = ${sessionScope.userID};
            </sql:query>
            <c:forEach var="row" items="${q1.rows}">     
                
                <a href='editBlog.jsp?blog_id=${row.blog_id}'/>
                    <div class="card" style="width: 18rem; margin-top: 15px">
                        <div class="card-body">
                          <h5 class="card-title">${row.blog_title}</h5>
                          <p class="card-title" style="font-size: 13px">${row.date}</p>
                          <hr>
                          <p class="card-text">${row.blog_desc}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>    
            
        </center>
    </body>
</html>

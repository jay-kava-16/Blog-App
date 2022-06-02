3<%-- 
    Document   : HomePage
    Created on : 15-Apr-2022, 6:34:16 PM
    Author     : Bhumit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;
background-color: #E3E3E3;}
            button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}
        </style>
    </head>
    <body>
        <div style="padding-left:10px; padding-right: 30px ;margin-top: 5px; margin-left: 10px; display: flex; justify-content: space-between">
             
            <p>
            <%
                session = request.getSession();
                String username = session.getAttribute("username").toString();
                out.println("Welcome, "+"<b>"+username+"</b>");
            %>
            </p>
            <form action="logout">
                <button type="submit">Logout</button>
            </form>
        </div>
    <center>
        <div>
            <form action="addBlog.jsp">
                
                <button type="submit" style="width: 155px">Add Blog</button>
            </form>
            <form action="viewBlog.jsp">
                
                <button type="submit" style="width: 255px">View/Delete/Update Blog</button>
            </form>
            
            <hr>
        </div>
        
        
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/blogapp" user="root" password="" var="db"/>
        <sql:query dataSource="${db}" var="q1">
            SELECT * FROM blog;
        </sql:query>
        <c:forEach var="row" items="${q1.rows}">     
            <div class="card" style="width: 18rem; margin-top: 15px">
                <div class="card-body">
                  <h5 class="card-title">${row.blog_title}</h5>
                  <p class="card-title" style="font-size: 13px">${row.date}</p>
                  <hr>
                  <p class="card-text">${row.blog_desc}</p>
                </div>
            </div>
        </c:forEach>    
    </center>
    </body>
</html>

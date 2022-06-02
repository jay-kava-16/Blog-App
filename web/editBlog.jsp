<%-- 
    Document   : editBlog
    Created on : 15-Apr-2022, 6:34:36 PM
    Author     : Bhumit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        <center>
            <h3>Edit Blog</h3>
            <hr>
            <%
                int blog_id = Integer.parseInt(request.getParameter("blog_id").toString());
            %>
            
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/blogapp" user="root" password="" var="db"/>
            <sql:query dataSource="${db}" var="q1">
                SELECT * FROM blog where blog_id = <%=blog_id%>;
            </sql:query>
                
                <!--<form action="deleteBlogServlet" id="form2"></form>-->
                <form action="editBlogServlet" id="form1">
                <input type="hidden" value="<%=blog_id%>" name="blog_id"/>
            <c:forEach var="row" items="${q1.rows}">
                <!--<form action="deleteBlogServlet" id="form2"></form>-->
                                
                                Title
                           
                                <!--<div class="form-group row">-->
                                    <input type="text" name="blog_title" value="${row.blog_title}"/>
<!--                                </div>-->
<br><br>
                        
                        <!--<hr>-->
                        
                                Description
                           
                                <textarea  name="blog_description" rows="8" cols="50">${row.blog_desc}</textarea>
          
                                <br> <br>
                                
                                <button type="submit" style="width : 150px">Update Blog</button>
                  

                </form>
                            
                                <form action="deleteBlogServlet" id="form2">
                                <input type="hidden" value="<%=blog_id%>" name="blog_id" form="form2"/>
                                <br>
                                <!--<input type="submit" value="Delete" form="form2"/>-->
                                <button type="submit" form="form2" style="width : 120px">Delete</button>
                                </form>
                                <hr>
                       
                
                
                
            </c:forEach>
        </center>
    </body>
</html>

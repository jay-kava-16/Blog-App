<%-- 
    Document   : addBlog
    Created on : 15-Apr-2022, 6:34:26 PM
    Author     : Bhumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;
background-color: #E3E3E3;}
            button {
  background-color: #04AA6D;
  color: white;
  border-radius: 5px;
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
            <h3>New Blog</h3>
            <form action="addBlogServlet">
                <table>
                    
                    <tr>
                        <td>
                            Title
                        </td>
                        <td>
                            <div class="form-group row">
                               <input type="text"   name="blog_title" required/>
                            </div>
                        </td>
                    </tr>
                    <hr>
                    <tr>
                        <td>
                            Description
                        </td>
                        <td>
                            <textarea  name="blog_description" required></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <!--<input type="reset" value="Reset"/>-->
                             <button type="reser">Reset</button>
                        </td>
                        <td>
                            <!--<input type="submit" value="Add Blog"/>-->
                            <button type="submit">Add Blog</button>
                        </td>
                    </tr>
                </table>
               
            </form>
        </center>
    </body>
</html>

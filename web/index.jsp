<%-- 
    Document   : index
    Created on : 15-Apr-2022, 6:33:37 PM
    Author     : Bhumit
--%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;
background-color: #E3E3E3;}
form {border: 3px solid #f1f1f1;
width:30%;
box-sizing: border-box;
background-color: #748bf2;
}

input[type=textarea], input[type=password],input[type=text] {
  width:100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 3px solid #ccc;
  box-sizing: border-box;
  
}

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






.container {
  padding: 16px;
  height: 400px;
  width: 300px;
  
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
    </head>
    <body>
        <%
            session = request.getSession();
            if (session.getAttribute("status") != null) {
                String status = session.getAttribute("status").toString();
                if (status.equals("true")) {
                    response.sendRedirect("HomePage.jsp");
                }
            }
        %>
<!--    <center>
        <br>
        <h2>Login</h2> 
            <form action="loginServlet" method="post" >
                <table>
                    <tr>
                        <td>
                            
                            Email&nbsp&nbsp&nbsp&nbsp
                        </td>
                        <td>
                            <div class="form-group row">
                                <input type="email" name="email"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group row">
                                Password&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            </div>
                        </td>
                        <td>
                            <div class="form-group row">
                                <input type="password" name="password"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Login"/>
                        </td>
                    </tr>
                    <br><br>
                    <tr>
                        <td colspan="2">
                            don't have an account ? <a href='registration.jsp'>Sign In</a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>-->

<center>
    <br>
<h2>Login Form</h2>

<form action="loginServlet" method="post">


  <div class="container">
    <label for="uname"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
  <tr>
                        <td colspan="2">
                            don't have an account ? <a href='registration.jsp'>Sign In</a>
                        </td>
                    </tr>
  </div>

</form>
</center>
    </body>
</html>

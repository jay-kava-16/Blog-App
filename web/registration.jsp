<%-- 
    Document   : registraton
    Created on : 15-Apr-2022, 6:34:46 PM
    Author     : Bhumit
--%>

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
width:40%;
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
<!--        <center>
            <h2>Sign In</h2> <br>
            <form action="registrationServlet">
                <table>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <input type="text" name="name"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Email
                        </td>
                        <td>
                            <input type="email" name="email"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <input type="password" name="password"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Confirm Password
                        </td>
                        <td>
                            <input type="password" name="conf_password"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Sign In"/>
                        </td>
                    </tr>
                    <br><br>
                    <tr>
                        <td colspan="2">
                            Already have an account ? <a href='index.jsp'>Login</a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>-->
<center>

<h2>Sign In</h2>
<form action="registrationServlet" >


  <div class="container" >
    <label for="uname"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
    
    <label for="uname"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    
    <label for="uname"><b>Password</b></label>
    <input type="text" placeholder="Enter Password" name="password" required>
    

    <label for="psw"><b>Conform Password</b></label>
    <input type="password" placeholder="Enter Conform Password" name="conf_password" required>
        
    <button type="submit">Sign In</button>
  <tr>
                        <td colspan="2">
                           Already have an account ? <a href='index.jsp'>Login</a>
                        </td>
                    </tr>
  </div>

</form>
</center>
    </body>
</html>

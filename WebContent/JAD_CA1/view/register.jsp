<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/login.css" />
</head>
<body>
<div class="login">
  <h1>Register</h1>
  <!-- Register form -->
    <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
		
		<% 
	    //If invalid, display error message
		if (request.getParameter("errCode") != null) {
		        out.println("An account with this username or email may already exist<br>");
		}
		%>
    
      <input type="text" name="loginid" placeholder="Username" required="required" />
      <input type="password" name="password" placeholder="Password" required="required" />
      <input type="email" name="email" placeholder="Email" required="required" />
      <input type="tel" name="phone" placeholder="Phone" required="required" />
      <button type="submit" class="btn btn-primary btn-block btn-large">Register Now</button><br>
           
    </form>
</div>
</body>
</html>
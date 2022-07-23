<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Raleway" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/editUser.css">
<link rel="stylesheet" href="styles/form.css">
<link rel="stylesheet" href="styles/adminPage.css">
</head>
<body>
<%
//retrieve session attribute for userid
	int userid = (Integer)session.getAttribute("sessUserID");
	
//If there is no session attribute for userid, redirect back to login page	
	if(session.getAttribute("sessUserID") == null){
		response.sendRedirect("../view/login.jsp");
	}
%>

<%
//Get user's details
String name = request.getParameter("name");
String email= request.getParameter("email");
String password = request.getParameter("password");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String id = request.getParameter("id");
%>
  <!-- Forked from a template on Tutorialzine: https://tutorialzine.com/2016/06/freebie-landing-page-template-with-flexbox -->
  <header>
    <h2><a href="#">Life is a party!</a></h2>
    <nav>
 	  <li><a href="../view/index.jsp">Home</a></li>
      <li><a href="../view/tourCategory.jsp">Tours</a></li>
      <li><a href="../view/profilePage.jsp">Profile</a></li>
    </nav>
  </header>

<!-- Edit details form -->
  <section class="destinations">
    <h3 class="title">Edit Your Details:</h3>
    <hr>
    <div class="small-container">
    <div class="card shadow border-0 mb-7">
    <form action="<%=request.getContextPath()%>/UpdateUserServlet" method="post">
    
    	<% 
	    //If invalid, display error message
		if (request.getParameter("errCode") != null) {
		        out.println("An unexpected error has occurred<br>");
		}
		%>
	                
      <div class="main">
      <h5>Id:</h5>
	  <div class="form-group has-search">
	    <input type="text" name="id" class="form-control" value="<%=id%>" readonly>
	  </div>	
	  
	  <h5>Name:</h5>
	  <div class="form-group has-search">
	    <input type="text" name="name" class="form-control" value="<%=name%>">
	  </div>	
	  
	  <h5>Email:</h5>
	  <div class="form-group has-search">
	    <input type="text" name="email" class="form-control" value="<%=email%>">
	  </div>
	  
	  <h5>Password:</h5>
	  <div class="form-group has-search">
	    <input type="text" name="password" class="form-control" value="<%=password%>">
	  </div>
	  
	  <h5>Address:</h5>
	  <div class="form-group has-search">
	    <textarea name="address" class="form-control" value="<%=address%>" placeholder="Add Address"></textarea>
	  </div>
	  
	  <h5>Phone:</h5>
	  <div class="form-group has-search">
	    <input type="text" name="phone" class="form-control" value="<%=phone%>">
	  </div>
	  
	  <button type="submit" class="btn btn-primary btn-block btn-large" style="margin-top:20px;">Submit</button>
	  
	</div>
	</form>
	</div>
    </div>
  </section>

  <section class="contact">
    <h3 class="title">Learn more</h3>
    <p>Want to know about our upcoming events, or come to one of our mixers? Just sign up for our mailing list. No spam from us, we promise! Except for the spam we give you to keep up your energy while you're having fun with your friends. Have a blast! We have tons of that.</p>
    <hr>
    <form>
      <input type="email" placeholder="Email">
      <a href="#" class="btn">Subscribe now</a>
    </form>
  </section>

  <footer>
    <p>Images courtesy of <a href="http://unsplash.com/">unsplash</a>.</p>
    <p>Why are you even reading this?! There's never anything interesting in the footer!</p>
    <ul>
      <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
      <li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a></li>
      <li><a href="#"><i class="fa fa-snapchat-square fa-2x"></i></a></li>
    </ul>
  </footer>
</body>
</html>
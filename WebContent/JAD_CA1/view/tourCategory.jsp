<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="category.Category" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Raleway" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/tourCategory.css">
</head>
<body>
  <!-- Forked from a template on Tutorialzine: https://tutorialzine.com/2016/06/freebie-landing-page-template-with-flexbox -->
  <header>
    <h2><a href="#">Life is a party!</a></h2>
    <nav>
 	  <li><a href="../view/index.jsp?userID">Home</a></li>
      <li><a href="../view/tourCategory.jsp">Tours</a></li>
      <li><a href="../view/profilePage.jsp?userID=<%= session.getAttribute("sessUserID") %>">Profile</a></li>
    </nav>
  </header>


  <section class="destinations">
    <h3 class="title">Tour Category:</h3>
    <p>View the various tour categories we have to offer!</p>
    <form action="<%=request.getContextPath()%>/SearchTourServlet" method="post">
    <div class="content">
      <div class="searchbar">
        <div class="icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#5F6368">
            <path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>
        </div>
        <input type="text" autocomplete="off" name="userInput" placeholder="Search for a tour">
    </div>
    </form>
    <hr>
    <div class="small-container">
    <% 
    //Create arrayList for category
    ArrayList<Category> category = new ArrayList<Category>(); %>
  <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
	
		String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
		
		Connection conn = DriverManager.getConnection(connURL);
		
		Statement stmt = conn.createStatement();
		
		//Retrieve category from db
		String sqlStr = "SELECT * FROM category";
		ResultSet rs = stmt.executeQuery(sqlStr);
	
		////Add category objects into the array
	    while (rs.next()) {
	    	
	    	int id = rs.getInt("id");
	        String name = rs.getString("name");
	        String imgCategory = rs.getString("imgCategory");
	        category.add(new Category(id, name, imgCategory));
	        
 			}
	    
	    conn.close();
	}catch(Exception e){
		out.println("Error :" + e);
	}%>

	<%
	//Display the categories
	for(Category c : category){%>
	        <% int catID = c.getId();%>
			<a href="../view/tourListing.jsp?catID=<%= catID %>">
 	        <div class="row">
		    <div class="col-2">
		      <img src=<%= c.getImgCategory() %> alt="" />
		      <h4 align="center"><%= c.getName() %></h4>
		      <div class="rating">
		        <i class="fas fa-star"></i>
		        <i class="fas fa-star"></i>
		        <i class="fas fa-star"></i>
		        <i class="fas fa-star"></i>
		        <i class="far fa-star"></i>
		      </div>
		      <p></p>
		      <p></p>
		    </div>
		    </div> 
		    </a>
     <%}%>
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
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="tours.Tours" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/tourDetails.css">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Raleway" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<header>
    <h2><a href="#">Life is a party!</a></h2>
    <nav>
 	  <li><a href="../view/index.jsp?userID">Home</a></li>
      <li><a href="../view/tourCategory.jsp">Tours</a></li>
      <li><a href="../view/profilePage.jsp?userID=<%= session.getAttribute("sessUserID") %>">Profile</a></li>
    </nav>
  </header>

<div id="container">  
<% 
//Create arrayList for tours
ArrayList<Tours> tours = new ArrayList<Tours>();
  int tourID = Integer.parseInt(request.getParameter("tourID"));%>
  <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
	
		String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
		
		Connection conn = DriverManager.getConnection(connURL);
		
		Statement stmt = conn.createStatement();
		
		//Retrieve tour from db
		String sqlStr = "SELECT * FROM tour";
		ResultSet rs = stmt.executeQuery(sqlStr);
	
		//Add tour objects into the array
	    while (rs.next()) {
	    	
	    	int id = rs.getInt("id");
	        String title = rs.getString("title");
	        String briefDesc = rs.getString("briefDesc");
	        String detailedDesc = rs.getString("detailedDesc");
	        String price = rs.getString("price");
	        String availableSlots = rs.getString("availableSlots");
	        String imgLocation = rs.getString("imgLocation");
	        int categoryID = rs.getInt("categoryID");
	        tours.add(new Tours(id, title, briefDesc, detailedDesc, price, availableSlots, imgLocation, categoryID));
	        
 			}
	    
	    conn.close();
	}catch(Exception e){
		out.println("Error :" + e);
}%>
 <%
 //Display respective tour details
for(Tours t : tours){
if(t.getId() == tourID){
%>
<!-- Start  Product details -->
  <div class="product-details">
    
    <!--  Product Name -->
  <h1><%= t.getTitle() %></h1>
<!--    <span class="hint new">New</span> -->
<!--    <span class="hint free-shipping">Free Shipping</span> -->
<!--    the Product rating -->
  <span class="hint-star star">
    <i class="fa fa-star" aria-hidden="true"></i>
    <i class="fa fa-star" aria-hidden="true"></i>
    <i class="fa fa-star" aria-hidden="true"></i>
    <i class="fa fa-star-half-o" aria-hidden="true"></i>
    <i class="fa fa-star-o" aria-hidden="true"></i>
  </span>
    
  
<!-- The most important information about the product -->
    <p class="information"><%= t.getDetailedDesc() %></p>

    
    
<!--    Control -->
      
</div>
<!--  End Product details   -->
  
  
  
<!--  Start product image & Information -->
  
<div class="product-image">
  
  <img src="<%= t.getImgLocation() %>" alt="Tour Image">
  
<!--  product Information-->
<div class="info">
  <h2>Tour Description</h2>
  <ul>
    <li><strong>Price: </strong>$<%= t.getPrice() %></li>
    <li><strong>Slots Available: </strong><%= t.getAvailableSlots() %></li>
    <div class="control">
	<!-- Start Button buying -->
	  <button class="btn">
	<!--    the Price -->
	   <span class="price">$<%= t.getPrice() %></span>
	<!--    shopping cart icon-->
	   <span class="shopping-cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
	<!--    Buy Now / ADD to Cart-->
	   <span class="buy" href="../view/shoppingCart.jsp">Add to cart</span>
	 </button>
  <!-- End Button buying -->
  </div>
  </ul>
</div>
</div>
<!--  End product image  -->
<%}
}%>
</div>
</body>
</html>
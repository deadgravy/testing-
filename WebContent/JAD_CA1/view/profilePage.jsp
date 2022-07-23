<%@page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>
<%@ page import="users.Users" %>
<%
//Set userid and user role
/* String userid = null;
String userRole = null; */

//Redirect to login page if user is not logged in
if(session.getAttribute("sessUserID") == null){
	response.sendRedirect("../view/login.jsp");
}else{
	int userid = (Integer)session.getAttribute("sessUserID");
	String userRole = (String)session.getAttribute("sessUserRole");
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Student Profile Page Design Example</title>

    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
	<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Raleway" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="styles/profile.css" />
</head>
<body>

  <header>
    <h2><a href="#">Life is a party!</a></h2>
    <nav>
 	  <li><a href="../view/index.jsp">Home</a></li>
      <li><a href="../view/tourCategory.jsp">Tours</a></li>
      <li><a href="../view/profilePage.jsp?userID=<%= session.getAttribute("sessUserID") %>">Profile</a></li>
    </nav>
  </header>
<div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
 
            <!-- Ad Here -->
            
        </div>
    </div>
</div>


<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- Student Profile -->
<% 
//Create arrayList for users if userID exists
if(session.getAttribute("sessUserID") != null){
ArrayList<Users> users = new ArrayList<Users>();
int userID = (Integer)session.getAttribute("sessUserID");
%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
	
		String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
		
		Connection conn = DriverManager.getConnection(connURL);
		
		Statement stmt = conn.createStatement();
		
		//Retrieve users from db
		String sqlStr = "SELECT * FROM user";
		
		ResultSet rs = stmt.executeQuery(sqlStr);
	
		//Add user objects into the array
	    while (rs.next()) {
	    	
	    	int id = rs.getInt("id");
	        String name = rs.getString("name");
	        String password = rs.getString("password");
	        String email = rs.getString("email");
	        String role = rs.getString("role");
	        String address = rs.getString("address");
	        int phone = rs.getInt("phone");
	        double moneySpent = rs.getDouble("moneySpent");
	        users.add(new Users(id, name, password, email, role, address, phone, moneySpent));
	        
 			}
	    
	    conn.close();
	}catch(Exception e){
		out.println("Error :" + e);
}
%>
<%
//Display the respective user
for(Users u : users){

	if(u.getId() == userID){
	
	/* session.setAttribute("", u.getName()); */
%>
<div class="student-profile py-4">
  <div class="container">
  

    <div class="row">
    
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="https://source.unsplash.com/600x300/?student" alt="student dp">
            <h3><%= u.getName() %></h3>
          </div>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">Name:</strong><%= u.getName() %></p>
            <p class="mb-0"><strong class="pr-1">Email:</strong><%= u.getEmail() %></p>
          </div>
        </div>
        
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Your Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">

              <tr>
                <th width="30%">Name</th>
                <td width="2%">:</td>
                <td><%= u.getName() %></td>
              </tr>
              <tr>
                <th width="30%">Email</th>
                <td width="2%">:</td>
                <td><%= u.getEmail() %></td>
              </tr>
              <tr>
                <th width="30%">Password</th>
                <td width="2%">:</td>
                <td><%= u.getPassword() %></td>
              </tr>
              <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td><%= u.getAddress() %></td>
              </tr>
              <tr>
                <th width="30%">Phone</th>
                <td width="2%">:</td>
                <td><%= u.getPhone() %></td>
              </tr>
	          
            </table>

   <div class="container">
  <div class="overlay"></div>
  <!-- Edit user details button -->
  <form action="../view/editUser.jsp?name=<%=u.getName()%>&email=<%= u.getEmail()%>&password=<%=u.getPassword()%>
  &id=<%=u.getId()%>&phone=<%=u.getPhone()%>&address=<%=u.getAddress()%>" method="post">
  
  <button class="accept button">Edit</button>
  	</form>
  </div>
  <!-- Logout -->
  <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet" style="width: 100px;">
      <i class="bi bi-box-arrow-left"></i> Logout
  </a>
</div>

          </div>
        </div>
        
      </div>
    </div>
  </div>
</div>
<%}
}
}
%>
           
    		</div>
		</div>
</section>
     

	</body>
</html>
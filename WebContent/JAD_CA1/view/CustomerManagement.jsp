<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="users.Users" %>
<%
	//If there is no session attribute for userid, redirect back to login page	
	if(session.getAttribute("sessUserRole").equals("customer") || session.getAttribute("sessUserRole") == null){
		response.sendRedirect("../view/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/adminPage.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- Dashboard -->
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
    <!-- Vertical Navbar -->
    <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
        <div class="container-fluid">
            <!-- Toggler -->
            <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Brand -->
            <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#">
                <img src="https://preview.webpixels.io/web/img/logos/clever-primary.svg" alt="...">
            </a>
            <!-- User menu (mobile) -->
            <div class="navbar-user d-lg-none">
                <!-- Dropdown -->
                <div class="dropdown">
                    <!-- Toggle -->
                    <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar-parent-child">
                            <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                            <span class="avatar-child avatar-badge bg-success"></span>
                        </div>
                    </a>
                    <!-- Menu -->
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                        <a href="#" class="dropdown-item">Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Billing</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">Logout</a>
                    </div>
                </div>
            </div>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidebarCollapse">
                <!-- Navigation -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../view/adminPage.jsp">
                            <i class="bi bi-house"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../view/SalesManagement.jsp">
                            <i class="bi bi-bar-chart"></i> Sales Management
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../view/TourPackageManagement.jsp">
                            <i class="bi bi-bookmarks"></i> Tour Package Management 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../view/CustomerManagement.jsp">
                            <i class="bi bi-people"></i> Customer Management
                        </a>
                    </li>
                </ul>
                <!-- Divider -->
                <hr class="navbar-divider my-5 opacity-20">
                <!-- Navigation -->
                <ul class="navbar-nav mb-md-4">
                    <li>
                     
                    </li>
                </ul>
                <!-- Push content down -->
                <div class="mt-auto"></div>
                <!-- User (md) -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="bi bi-person-square"></i> Account
                        </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet" style="width: 100px;">
				      <i class="bi bi-box-arrow-left"></i> Logout
				  	</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <!-- Header -->
        <header class="bg-surface-primary border-bottom pt-6">
            <div class="container-fluid">
                <div class="mb-npx">
                    <div class="row align-items-center">
                        <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                            <!-- Title -->
                            <h1 class="h2 mb-0 ls-tight">Customer management page</h1>
                        </div>
                        <!-- Actions -->
                        <div class="col-sm-6 col-12 text-sm-end">
                            <div class="mx-n1">
                                <a href="../view/adminCreateTour.jsp" class="btn d-inline-flex btn-sm btn-primary mx-1">
                                    <span class=" pe-2">
                                        <i class="bi bi-plus"></i>
                                    </span>
                                    <span>Create</span>
                                </a>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </header>
        <!-- Main -->
       
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Tours</h5>
                        <% 
						    //If invalid, display error message
							if (request.getParameter("errCode") != null) {
							        out.println("Something went wrong<br>");
							}
						%>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">address</th>
                                     <th scope="col">Phone</th>
                                    <th scope="col">Money Spent</th>
                                    
                                    <th></th>
                                </tr>
                            </thead>
                            <% 
                            //Create arrayList for tours
                            ArrayList<Users> users = new ArrayList<Users>(); %>
                            <%
								try{
									Class.forName("com.mysql.jdbc.Driver");
								
									String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
									
									Connection conn = DriverManager.getConnection(connURL);
									
									Statement stmt = conn.createStatement();
									
									//Retrieve tours from db
									String sqlStr = "SELECT * FROM user";
									ResultSet rs = stmt.executeQuery(sqlStr);
								
									//Add tour objects into the array
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
							}%>
							<tbody>
							<%
							//Display respective tours
								for(Users u : users){
								%>
								<tr>
                                    <td>
                                        <%= u.getName() %>
                                    </td>
                                    <td>
                                        <%= u.getPassword() %>
                                    </td>
                                    <td>                                       
                                        <%= u.getEmail() %>
                                    </td>
                                    <td>
                                        <%= u.getRole() %>
                                    </td>
                                        <td>
                                        <%= u.getAddress() %>
                                    </td>
                                      <td>
                                        <%= u.getPhone() %>
                                    </td>
                                      <td>
                                        <%= u.getMoneySpent() %>
                                    </td>
                                    <td class="text-end">
                                        <a href="" class="btn btn-sm btn-neutral">View</a>
                                    </td>
                                    <td class="text-end">
                                                 <a href="">
                                    <span class=" pe-2">
                                        <i class="bi bi-pencil"></i>
                                    </span>
                                    <span>Edit</span>
                         			</a>			
                         			   
                                           <a href="" class="btn btn-sm btn-neutral">Delete</a>
                                    </td>
                                </tr>
								
							     	<%}
						    %>                                                      
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html> 
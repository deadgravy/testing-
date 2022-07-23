<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="category.Category" %>
<%
//Retrieve session attribute for userid
	int userid = (Integer)session.getAttribute("sessUserID");

//If there is no session attribute for userid, redirect back to login page
	if(session.getAttribute("sessUserID") == null){
		response.sendRedirect("../view/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/adminPage.css">
<link rel="stylesheet" href="styles/form.css">
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
                        <a class="nav-link" href="#">
                            <i class="bi bi-house"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="bi bi-bar-chart"></i> Analitycs
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="bi bi-chat"></i> Messages
                            <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-auto">6</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="bi bi-bookmarks"></i> Collections
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="bi bi-people"></i> Users
                        </a>
                    </li>
                </ul>
                <!-- Divider -->
                <hr class="navbar-divider my-5 opacity-20">
                <!-- Navigation -->
                <ul class="navbar-nav mb-md-4">
                    <li>
                        <div class="nav-link text-xs font-semibold text-uppercase text-muted ls-wide" href="#">
                            Contacts
                            <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-4">13</span>
                        </div>
                    </li>
                    <li>
                        <a href="#" class="nav-link d-flex align-items-center">
                            <div class="me-4">
                                <div class="position-relative d-inline-block text-white">
                                    <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar rounded-circle">
                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-success rounded-circle"></span>
                                </div>
                            </div>
                            <div>
                                <span class="d-block text-sm font-semibold">
                                    Marie Claire
                                </span>
                                <span class="d-block text-xs text-muted font-regular">
                                    Paris, FR
                                </span>
                            </div>
                            <div class="ms-auto">
                                <i class="bi bi-chat"></i>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link d-flex align-items-center">
                            <div class="me-4">
                                <div class="position-relative d-inline-block text-white">
                                    <span class="avatar bg-soft-warning text-warning rounded-circle">JW</span>
                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-success rounded-circle"></span>
                                </div>
                            </div>
                            <div>
                                <span class="d-block text-sm font-semibold">
                                    Michael Jordan
                                </span>
                                <span class="d-block text-xs text-muted font-regular">
                                    Bucharest, RO
                                </span>
                            </div>
                            <div class="ms-auto">
                                <i class="bi bi-chat"></i>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link d-flex align-items-center">
                            <div class="me-4">
                                <div class="position-relative d-inline-block text-white">
                                    <img alt="..." src="https://images.unsplash.com/photo-1610899922902-c471ae684eff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar rounded-circle">
                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-danger rounded-circle"></span>
                                </div>
                            </div>
                            <div>
                                <span class="d-block text-sm font-semibold">
                                    Heather Wright
                                </span>
                                <span class="d-block text-xs text-muted font-regular">
                                    London, UK
                                </span>
                            </div>
                            <div class="ms-auto">
                                <i class="bi bi-chat"></i>
                            </div>
                        </a>
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
                        <a class="nav-link" href="../view/login.jsp">
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
                            <h1 class="h2 mb-0 ls-tight">Administrator page</h1>
                        </div>
                        <!-- Actions -->
                       
                    </div>
                   
                </div>
            </div>
        </header>
        <!-- Main -->
       
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Create tour</h5>
                    </div>
                    
                    <% 
                    //Create arrayList to store categories
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
						
							//Add category objects into the array
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
					
                    <!-- Create tour form -->
                    <form action="<%=request.getContextPath()%>/AdminCreateServlet" method="post"  >
                    <!-- Show error if inputs are invalid -->
                    <% 
						if (request.getParameter("errCode") != null) {
						        out.println("Please enter valid inputs!<br>");
						}
					%>
                    <div class="main">
                      <h5>Title:</h5>
					  <div class="form-group has-search">
					    <input type="text" name="title" class="form-control" required>
					  </div>
					  
					  <h5>Brief Description:</h5>
					  <div class="form-group has-search">
					    <input type="text" name="briefDesc" class="form-control" required>
					  </div>	
					  
					  <h5>Detailed Description:</h5>
					  <div class="form-group has-search">
					    <input type="text" name="detailedDesc" class="form-control" required>
					  </div>
					  
					  <h5>Price:</h5>
					  <div class="form-group has-search">
					    <input type="text" name="price" class="form-control" required>
					  </div>
					  
					  <h5>Slots:</h5>
					  <div class="form-group has-search">
					    <input type="text" name="availableSlots" class="form-control" required>
					  </div>
					   <h5>Images:</h5>
					  <div class="form-group has-search">
					   <input type="file" name="image" >
					  </div>
					  
					  
					  <h5>Tour Category:</h5>
					  <div class="box">
					  
					  <select name="tourCat">
					  <%for(Category c : category){
							%>
						    <option value="<%= c.getId() %>"><%= c.getName() %></option>
						    <%} %>
					  </select>
					  </div>
					  
					  <button type="submit" class="btn btn-primary btn-block btn-large" style="margin-top:20px;">Create</button>
					  
					</div>
					</form>
					
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
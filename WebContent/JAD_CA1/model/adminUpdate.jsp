<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! int numRowsAffected = 0; %>
	<%
	//Retrieve all input parameters in edit form
	String tourid = request.getParameter("tourID");
	String title = request.getParameter("title");
	String price = request.getParameter("price");
	String slots = request.getParameter("slots");
	String briefDesc = request.getParameter("briefDesc");
	String detailedDesc = request.getParameter("detailedDesc");
	String category = request.getParameter("category");
	%>

	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";

		Connection conn = DriverManager.getConnection(connURL);

		Statement stmt = conn.createStatement();
		
		String someNewName = title;
		int someID = Integer.parseInt(tourid);
		double Newprice = Double.parseDouble(price);
		int Newslot = Integer.parseInt(slots);
		String newBriefDesc = briefDesc;
		String newDetailedDesc = detailedDesc;
		String newCategory = category;
		String sqlStr = "UPDATE tour SET title = ?,price= ?,availableSlots=?,briefDesc=?,detailedDesc=?,categoryID=? WHERE id = ?";
		
		//Check if price and slot are negative values
		if(Newprice < 0 || Newslot < 0){
			response.sendRedirect("../view/errorPage.jsp");
		}else{
		
		//Update tour details
		PreparedStatement ps = conn.prepareStatement(sqlStr);
 		ps.setString(1, someNewName);
		ps.setDouble(2, Newprice); 
		ps.setInt(3, Newslot); 
		ps.setString(4, newBriefDesc); 
		ps.setString(5, newDetailedDesc);
		ps.setString(6,newCategory);
		ps.setInt(7, someID); 

		numRowsAffected = ps.executeUpdate();
		
		//Redirect to adminPage if successfull
		response.sendRedirect("../view/adminPage.jsp");
		
		conn.close();
		}

	} catch (Exception e) {
		//If error redirect to errorPage
		response.sendRedirect("../view/errorPage.jsp");
	}
	%>
</body>
</html>
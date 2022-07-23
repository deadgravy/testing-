package TourServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchTourServlet
 */
@WebServlet("/SearchTourServlet")
public class SearchTourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTourServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String input = request.getParameter("userInput");
		
		if(input == null){
			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/tourListing.jsp?errCode=invalidInput");
			return;
		}

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		// Define Connection URL
        String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";

        // Establish connection to URL
        try {
			Connection conn = DriverManager.getConnection(connURL);
			
			Statement stmt = conn.createStatement();
			
			String sqlStr = "SELECT  COUNT(*) OVER () AS rowCount,t.* FROM tour t WHERE (title LIKE '%"+ input +"%') OR (briefDesc LIKE '%"+ input +"%') OR (detailedDesc LIKE '%"+ input +"%') ";
	        
	        // Get the result by executing the query
			ResultSet rs = stmt.executeQuery(sqlStr);
			
			//Create an arrayList to store the tour ids
			ArrayList<Integer> id = new ArrayList<Integer>();
			
		    while (rs.next()) {
		    	
		    	//Add the id/ids into the array
				id.add(rs.getInt("id"));

		    }
			    
		    //Store the array in a session
		    HttpSession session = request.getSession(true);
		    session.setAttribute("sessTourID", id);
		    
		    //If tour does not exist, return an error
	    	if(id.size()==0){
	    		response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/tourListing.jsp?errCode=invalidInput");
	    	} else {
	    		//Redirect to tour listing page
		    	response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/tourListing.jsp");
	    	}
	    	
	    	conn.close();
	    	return;

	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package administration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminCreateServlet
 */
@WebServlet("/AdminCreateServlet")
public class AdminCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCreateServlet() {
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
		
		// Establish connection to URL
        try {
        	
        	String title = request.getParameter("title");
    		String briefDesc = request.getParameter("briefDesc");
    		String detailedDesc = request.getParameter("detailedDesc");
    		String price = request.getParameter("price");
    		String availableSlots = request.getParameter("availableSlots");
    		String catID = request.getParameter("tourCat");
			int Price = Integer.parseInt(price);
			int AvailableSlots = Integer.parseInt(availableSlots);
			int CatID = Integer.parseInt(catID);
    		
    		if(title == null || briefDesc == null || detailedDesc == null || price == null || availableSlots == null || catID == null){
    			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminCreateTour.jsp?errCode=invalidBody");
    			return;
    		} else {
    			
    			try{ 
    				Class.forName("com.mysql.jdbc.Driver");
    			}catch (ClassNotFoundException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    			
    			// Define Connection URL
    	        String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
    	        
    	        Connection conn = DriverManager.getConnection(connURL);
    	        
    	        PreparedStatement stmt = conn.prepareStatement("INSERT INTO tour (title, briefDesc, detailedDesc, price, availableSlots, imgLocation, categoryID) VALUES (?, ?, ?, ?, ?, ?, ?)");
    			stmt.setString(1, title);
    	        stmt.setString(2, briefDesc);
    	        stmt.setString(3, detailedDesc);
    	        stmt.setInt(4, Price);
    	        stmt.setInt(5, AvailableSlots);
    	        stmt.setString(6, "./Images/canada.jpg");
    	        stmt.setInt(7, CatID);
    	        
    	        // Get the result by executing the query
    	        int rowsAffected = stmt.executeUpdate();
    	        
    	        System.out.println("rowsAffected " + rowsAffected);
    	        
    	        if (rowsAffected == 0) {
    	        	response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminCreateTour.jsp?errCode=unexpectedErr");
    			} else {
    				response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp");
    			}
    	        
    		}     
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminCreateTour.jsp?errCode=invalidInput");
		} 
	}
}



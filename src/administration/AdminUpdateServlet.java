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
 * Servlet implementation class adminUpdateServlet
 */
@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateServlet() {
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
        	
        	String tourid = request.getParameter("tourID");
        	int tourID = Integer.parseInt(tourid);
        	String title = request.getParameter("title");
        	String price = request.getParameter("price");
        	double Price = Double.parseDouble(price);
        	String slots = request.getParameter("slots");
        	int Slots = Integer.parseInt(slots);
        	String briefDesc = request.getParameter("briefDesc");
        	String detailedDesc = request.getParameter("detailedDesc");
        	String category = request.getParameter("category");
    		
    		if(tourid == null || title == null || price == null || slots == null || briefDesc == null || detailedDesc == null || category == null){
    			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp?errCode=invalidBody");
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
    	        
    	        if(Price < 0 || Slots < 0){
    				response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/errorPage.jsp");
    			} else {
    	        
    	        PreparedStatement stmt = conn.prepareStatement("UPDATE tour SET title = ?,price= ?,availableSlots=?,briefDesc=?,detailedDesc=?,categoryID=? WHERE id = ?");
    	        stmt.setString(1, title);
    	        stmt.setDouble(2, Price); 
    	        stmt.setInt(3, Slots); 
    	        stmt.setString(4, briefDesc); 
    	        stmt.setString(5, detailedDesc);
    	        stmt.setString(6, category);
    	        stmt.setInt(7, tourID); 
    	        
    	        // Get the result by executing the query
    	        int rowsAffected = stmt.executeUpdate();
    	        
    	        System.out.println("rowsAffected " + rowsAffected);
    	        
    	        if (rowsAffected == 0) {
    	        	response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp?errCode=unexpectedErr");
    			} else {
    				response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp");
    			}
    	        
    			}
    	        
    		}     
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp?errCode=invalidInput");
		} 
	}

}

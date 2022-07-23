package Auth;

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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
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
        
        	String Id = request.getParameter("id");
			String username = request.getParameter("name");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String Phone = request.getParameter("phone");
		
		if(Id == null || username == null || password == null || email == null || Phone == null){
			response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/editUser.jsp?errCode=unexpectedErr");
			return;
		} else {
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			// Define Connection URL
	        String connURL = "jdbc:mysql://localhost:3306/jaddatabase?user=root&password=Root1234&serverTimezone=UTC";
	        
	        Connection conn = DriverManager.getConnection(connURL);
	        
	        int id = Integer.parseInt(Id);
	        int phone = Integer.parseInt(Phone);
			
			PreparedStatement sqlStr = conn.prepareStatement("UPDATE user SET name=?, password=?, email=?, role=?, address=?, phone=?, moneySpent=? WHERE id=?");
	        sqlStr.setString(1, username);
	        sqlStr.setString(2, password);
	        sqlStr.setString(3, email);
	        sqlStr.setString(4, "customer");
	        sqlStr.setString(5, address);
	        sqlStr.setInt(6, phone);
	        sqlStr.setDouble(7, 0.00);
	        sqlStr.setInt(8, id);
	        
	        // Get the result by executing the query
	        int numRowsAffected = sqlStr.executeUpdate();
	       
	    	System.out.println("rowsAffected " + numRowsAffected);
	        
	        if (numRowsAffected == 0) {
	        	response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/editUser.jsp?errCode=unexpectedErr");
			} else {
				response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/profilePage.jsp");
			}
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

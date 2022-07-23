package Auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String loginid = request.getParameter("loginid");
				String password = request.getParameter("password");
				
				if(loginid == null || password == null){
					response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/login.jsp?errCode=invalidBody");
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
					
					PreparedStatement sqlStr = conn.prepareStatement("SELECT * FROM user WHERE name = ? AND password = ?");
			        sqlStr.setString(1, loginid);
			        sqlStr.setString(2, password);
			        
			        // Get the result by executing the query
			        ResultSet rs = sqlStr.executeQuery();
			        
			     // rs.next() will return true if there is a result, false if none
			        if(rs.next()){
			        	
			        	// A new HttpSession can be obtained by the following line of code:
			        	HttpSession session = request.getSession(true);
			        	
			        	int userID = rs.getInt("id");
			        	String userRole = rs.getString("role");
			        	// Set session attributes
			        	session.setAttribute("sessUserID", userID);
			        	session.setAttribute("sessUserRole", userRole);
			        	
			        	// Redirect
			        	if(userRole.equals("admin")) {
			        		response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/adminPage.jsp");
			        	} else {
			        		response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/index.jsp");
			        	}
			        	
			        	conn.close();
						return;
						
			        }else{

						// If there is no user found, redirect them to the login page with an error
			        	response.sendRedirect("/ST0510-JAD-Practical/JAD_CA1/view/login.jsp?errCode=invalidBody");
			        	conn.close();
						return;
			        }
			       
			        
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package webservices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class UserDetailsDB {
	public ArrayList<UserDetails> getUserDetails() {
		// TODO: Query database

			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		
		// Define Connection URL
        String connURL = "jdbc:mysql://localhost:3306/db1?user=root&password=Root1234&serverTimezone=UTC";

        // Establish connection to URL
        try {
			Connection conn = DriverManager.getConnection(connURL);
			
			PreparedStatement sqlStr = conn.prepareStatement("SELECT * FROM user_details WHERE userid = ?");
	        
			String userid = i;
			sqlStr.setString(1, userid);
	        
	        // Get the result by executing the query
	        ResultSet rs = sqlStr.executeQuery();
	        
	        
	        
	     // rs.next() will return true if there is a result, false if none
	        if(rs.next()){
	        	String db_userid = rs.getString(1);
	        	int db_age = rs.getInt(2);
	        	String db_gender = rs.getString(3);
	        	
	        	UserDetails user = new UserDetails();
				
				user.setUserId(db_userid);
				user.setAge(db_age);
				user.setGender(db_gender);
		        
		        
				return user;
	        }
	        
	     // Close the connection after querying
	        conn.close();
	        
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return null;
		
		
	}
}
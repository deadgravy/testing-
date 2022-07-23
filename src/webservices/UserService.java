package webservices;

import java.util.ArrayList;
import javax.ws.rs.*;
import javax.ws.rs.core.*;


@Path("/UserService")
public class UserService {

	@GET
	@Path("/listAllUsers")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAllUsers() {
		//--------------------------------------------
		ArrayList<UserDetails> myList = new ArrayList<>();
		try {
			UserDetails db = new UserDetails();
			myList = db.listAllUsers();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
//		String[] membersJSONString = new String[members.size()];
//		
//		for(int i = 0; i < members.size(); i++) {
//			membersJSONString[i] = members.get(i).getCustomJSON();
//		}
//		
//		String.join(",", membersJSONString);
//		
//		String jsonOutput = "{" + 
//				"\"members\" : [" + 
//								String.join(",", membersJSONString) +
//							  "]" +
//				"\"totalCount\" : " + members.size();
		
		return Response
				.status(Response.Status.OK)
				.entity(myList)
				.build();
		//---------------------------------------------
	}
}

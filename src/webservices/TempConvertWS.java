package webservices;

import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("/TempConvertWS")
public class TempConvertWS {

	@GET
	@Path("/CtoF")
	@Produces(MediaType.APPLICATION_JSON)
	public double CtoF(@QueryParam("cel") double celsius) {
		double fahrenheit;
		fahrenheit = ((celsius * 9) / 5) + 32;
		return fahrenheit;
	}

	@POST 
	@Path("/FtoC")
	@Produces(MediaType.APPLICATION_JSON) 
	public double FtoC(@QueryParam("fah") double fahrenheit) { 
	double celsius = 0.0; celsius = (fahrenheit - 32.0) * 5 / 9;
	System.out.println("...FtoC-fahrenheit:" + fahrenheit);
	System.out.println("...FtoC-celsius:" + celsius); return celsius; }

}
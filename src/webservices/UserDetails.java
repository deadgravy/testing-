package webservices;

import java.util.ArrayList;

public class UserDetails {
	String userid;
	int age;
	String gender;
	
	public void setUserId(String UserId) {
		userid = UserId;
	}
	
	public void setAge(int Age) {
		age = Age;
	}
	
	public void setGender(String Gender) {
		gender = Gender;
	}
	
	public String getUserId() {
		return userid;
	}
	
	public int getAge() {
		return age;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String listAllUsers() {
		return "{" + 
				"\"age\" : " + this.getAge() + ", " +
				"\"gender\" : " + this.getGender() + ", " +
				"\"userid\" : " + this.getUserId() + ", " +
				"}";
	}
}
package dbaccess;

public class UserDetails {
	String userid;
	int age;
	String gender;
	
	public void setUserId(String UserId) {
		this.userid = UserId;
	}
	
	public void setAge(int Age) {
		this.age = Age;
	}
	
	public void setGender(String Gender) {
		this.gender = Gender;
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
}
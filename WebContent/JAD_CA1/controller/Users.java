package users;

public class Users {
	private int Id;
	private String Name;
	private String Password;
	private String Email;
	private String Role;
	
	public Users(int id, String name, String password, String email, String role) {
		
		Id = id;
		Name= name;
		Password = password;
		Email = email;
		Role = role;
		
	}
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}
}

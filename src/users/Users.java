package users;

public class Users {
	private int Id;
	private String Name;
	private String Password;
	private String Email;
	private String Role;
	private String Address;
	private int Phone;
	private double MoneySpent;
	
	public Users(int id, String name, String password, String email, String role, String address, int phone, double moneySpent) {
		
		Id = id;
		Name= name;
		Password = password;
		Email = email;
		Role = role;
		Address = address;
		Phone = phone;
		MoneySpent = moneySpent;
		
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
	
	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getPhone() {
		return Phone;
	}

	public void setPhone(int phone) {
		Phone = phone;
	}

	public double getMoneySpent() {
		return MoneySpent;
	}

	public void setMoneySpent(double moneySpent) {
		MoneySpent = moneySpent;
	}

}

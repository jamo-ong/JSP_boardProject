package auth.service;

public class User {

	private String id;
	private String name;
	private String email;
	private String phoneNo;

	public User(String id, String name, String email, String phoneNo) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phoneNo = phoneNo;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getphoneNo() {
		return phoneNo;
	}

}

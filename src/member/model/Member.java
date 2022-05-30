package member.model;

import java.util.Date;

public class Member {

	private String id;
	private String name;
	private String password;
	private String email;
	private String phoneNo;
	private Date regDate;

	public Member(String id, String name, String password, String email, String phoneNo, Date regDate) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phoneNo = phoneNo;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}
	
	public String getEmail() {
		return password;
	}
	
	public String getPhoneNo() {
		return password;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	//비밀번호 확인
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}
	
	//비밀번호 변경
	public void changePassword(String newPwd) {
		this.password = newPwd;
	}

}

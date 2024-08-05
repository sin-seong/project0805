package module;

public class PlayerDTO {

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "PlayerDTO [id=" + id + ", name=" + name + ", sss=" + sss + ", tel=" + tel + ", email=" + email + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSss() {
		return sss;
	}
	public void setSss(String sss) {
		this.sss = sss;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	private int id;
	private String name;
	private String sss;
	private String tel;
	private String email;
	
	public PlayerDTO(int id, String name, String sss, String tel, String email) {
		super();
		this.id = id;
		this.name = name;
		this.sss = sss;
		this.tel = tel;
		this.email = email;
	}
	
	
	}


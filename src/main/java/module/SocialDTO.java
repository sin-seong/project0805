package module;

public class SocialDTO {

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getLivtime() {
		return livtime;
	}

	public void setLivtime(String livtime) {
		this.livtime = livtime;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "socialDTO [id=" + id + ", name=" + name + ", title=" + title + ", text=" + text + ", livtime=" + livtime
				+ ", hit=" + hit + "]";
	}

	private int id;
	private String name;
	private String title;
	private String text;
	private String livtime;
	private int hit;
	
	public SocialDTO(int id, String name, String title, String text, String livtime, int hit) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.text = text;
		this.livtime = livtime;
		this.hit = hit;
	}
	
}

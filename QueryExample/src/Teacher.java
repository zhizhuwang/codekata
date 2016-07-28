
public class Teacher {

	private String name;
	private boolean female;
	
	public Teacher(String name, boolean female) {
		super();
		this.name = name;
		this.female = female;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isFemale() {
		return female;
	}
	public void setFemale(boolean female) {
		this.female = female;
	}
	
}

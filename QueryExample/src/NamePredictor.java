
public class NamePredictor implements Predictor{

	private String name;
	
	public NamePredictor(String name)
	{
		this.name = name;
	}

	@Override
	public boolean test(Student s) {
		return s.getName().equals(name);
	}
	
}

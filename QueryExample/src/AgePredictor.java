
public class AgePredictor implements StudentPredictor {

	private int age;
	
	public AgePredictor(int age) {
		this.age = age;
	}
	@Override
	public boolean test(Student s) {
		return s.getAge() == this.age;
	}

}

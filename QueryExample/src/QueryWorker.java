
public class QueryWorker {

	public static Student findByAge(Student[] students)
	{
		for(Student s: students)
		{
			if (s.getAge() == 18)
				return s;
		}
		return null;
	}

	public static Student findByName(Student[] students) {
		for(Student s : students)
		{
			if(s.getName().equals("john"))
				return s;
		}
		return null;
	}

	public static Student find(Student[] sdudents, Predictor namePredictor) {
		for(Student s: sdudents)
		{
			if(namePredictor.test(s))
				return s;
		}
		return null;
	}
}

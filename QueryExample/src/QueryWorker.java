import java.util.List;


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

	public static Student find(Student[] sdudents, Predictor predictor) {
		for(Student s: sdudents)
		{
			if(predictor.test(s))
				return s;
		}
		return null;
	}
	
	public static Student find(Iterable<Student> sdudents, Predictor predictor) {
		for(Student s: sdudents)
		{
			if(predictor.test(s))
				return s;
		}
		return null;
	}

	public static Teacher find(List<Teacher> teachers, TeacherPredictor predictor) {
		for(Teacher t: teachers)
		{
			if(predictor.test(t))
				return t;
		}
		return null;
	}
}

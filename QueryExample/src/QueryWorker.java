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

	public static Student find(Student[] sdudents, StudentPredictor predictor) {
		for(Student s: sdudents)
		{
			if(predictor.test(s))
				return s;
		}
		return null;
	}
	
	/*public static Student find(Iterable<Student> sdudents, StudentPredictor predictor) {
		for(Student s: sdudents)
		{
			if(predictor.test(s))
				return s;
		}
		return null;
	}

	public static Teacher find(Iterable<Teacher> teachers, TeacherPredictor predictor) {
		for(Teacher t: teachers)
		{
			if(predictor.test(t))
				return t;
		}
		return null;
	}
*/	
	/*public static <E> E find(Iterable<E> list, Predictor<E> predictor) {
		for(E t: list)
		{
			if(predictor.test(t))
				return t;
		}
		return null;
	}*/
	
	public static <E> E find(Iterable<? extends E> list, Predictor<? super E> predictor) {
		for(E t: list)
		{
			if(predictor.test(t))
				return t;
		}
		return null;
	}
}
